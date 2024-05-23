import numpy as np

from astropy.coordinates.matching import _get_cartesian_kdtree
from astropy.coordinates import Angle
from astropy.coordinates.representation import UnitSphericalRepresentation
from astropy import units as u

def not_in_mask(target_class, catalog):
    
    """Quality mask for the given target class for randoms.
    Args:
    target_class (str): name of the target class
    catalog (table): legacy survey like data table
    Returns: Boolean array of length of catalog selecting unmasked values
    """
    
    if "LRG" in target_class:
        maskbits = [1, 12, 13]
        min_nobs = 1
        mask = (catalog['NOBS_G']>=min_nobs) & (catalog['NOBS_R']>=min_nobs) & (catalog['NOBS_Z']>=min_nobs)
        for bit in maskbits:
            mask &= (catalog['MASKBITS'] & 2**bit)==0
        return mask
    
    elif "ELG" in target_class:
        maskbits = [1, 12, 13]
        min_nobs = 1
        mask = (catalog['NOBS_G']>=min_nobs) & (catalog['NOBS_R']>=min_nobs) & (catalog['NOBS_Z']>=min_nobs)
        for bit in maskbits:
            mask &= (catalog['MASKBITS'] & 2**bit)==0
        return mask
    
    elif "QSO" in target_class:
        maskbits = [1, 5, 6, 7, 10, 12, 13]
        min_nobs = 1
        mask = (catalog['NOBS_G']>=min_nobs) & (catalog['NOBS_R']>=min_nobs) & (catalog['NOBS_Z']>=min_nobs)
        for bit in maskbits:
            mask &= (catalog['MASKBITS'] & 2**bit)==0
        return mask
    
    elif "BGS" in target_class:
        maskbits = [1, 12, 13]
        min_nobs = 1
        mask = (catalog['NOBS_G']>=min_nobs) & (catalog['NOBS_R']>=min_nobs) & (catalog['NOBS_Z']>=min_nobs)
        for bit in maskbits:
            mask &= (catalog['MASKBITS'] & 2**bit)==0
        return mask
    
    elif "MWS" in target_class:
        min_nobs = 1
        mask = (catalog['NOBS_G']>=min_nobs) & (catalog['NOBS_R']>=min_nobs)
        return mask
    
    else:
        raise ValueError("invalid target class")
        
        
"""
Modified implementation of astropy.coordinates.matching.search_around_sky
Accepts multiple separation limits for search around coords2
"""



def search_around_sky(coords1, coords2, seplimit, storekdtree='kdtree_sky'):
    """
    Searches for pairs of points that have an angular separation at least as
    close as a specified angle.

    This is intended for use on coordinate objects with arrays of coordinates,
    not scalars.  For scalar coordinates, it is better to use the ``separation``
    methods.

    Parameters
    ----------
    coords1 : `~astropy.coordinates.BaseCoordinateFrame` or `~astropy.coordinates.SkyCoord`
        The first set of coordinates, which will be searched for matches from
        ``coords2`` within ``seplimit``. Cannot be a scalar coordinate.
    coords2 : `~astropy.coordinates.BaseCoordinateFrame` or `~astropy.coordinates.SkyCoord`
        The second set of coordinates, which will be searched for matches from
        ``coords1`` within ``seplimit``. Cannot be a scalar coordinate.
    seplimit : `~astropy.units.Quantity` with angle units
        The on-sky separation to search within.
    storekdtree : bool or str, optional
        If a string, will store the KD-Tree used in the search with the name
        ``storekdtree`` in ``coords2.cache``. This speeds up subsequent calls
        to this function. If False, the KD-Trees are not saved.

    Returns
    -------
    idx1 : integer array
        Indices into ``coords1`` that matches to the corresponding element of
        ``idx2``. Shape matches ``idx2``.
    idx2 : integer array
        Indices into ``coords2`` that matches to the corresponding element of
        ``idx1``. Shape matches ``idx1``.
    sep2d : `~astropy.coordinates.Angle`
        The on-sky separation between the coordinates. Shape matches ``idx1``
        and ``idx2``.
    dist3d : `~astropy.units.Quantity`
        The 3D distance between the coordinates. Shape matches ``idx1``
        and ``idx2``; the unit is that of ``coords1``.
        If either ``coords1`` or ``coords2`` don't have a distance,
        this is the 3D distance on the unit sphere, rather than a
        physical distance.

    Notes
    -----
    This function requires `SciPy <https://www.scipy.org/>`_
    to be installed or it will fail.

    In the current implementation, the return values are always sorted in the
    same order as the ``coords1`` (so ``idx1`` is in ascending order).  This is
    considered an implementation detail, though, so it could change in a future
    release.
    """
    if not seplimit.isscalar:
        if len(coords2) != len(seplimit):
            raise ValueError('seplimit must be a scalar or a vector with same length as coords2')

    if coords1.isscalar or coords2.isscalar:
        raise ValueError('One of the inputs to search_around_sky is a scalar. '
                         'search_around_sky is intended for use with array '
                         'coordinates, not scalars.  Instead, use '
                         '``coord1.separation(coord2) < seplimit`` to find the '
                         'coordinates near a scalar coordinate.')

    if len(coords1) == 0 or len(coords2) == 0:
        # Empty array input: return empty match
        if coords2.distance.unit == u.dimensionless_unscaled:
            distunit = u.dimensionless_unscaled
        else:
            distunit = coords1.distance.unit
        return (np.array([], dtype=int), np.array([], dtype=int),
                Angle([], u.deg),
                u.Quantity([], distunit))

    # we convert coord1 to match coord2's frame.  We do it this way
    # so that if the conversion does happen, the KD tree of coord2 at least gets
    # saved. (by convention, coord2 is the "catalog" if that makes sense)
    coords1 = coords1.transform_to(coords2)

    # strip out distance info
    urepr1 = coords1.data.represent_as(UnitSphericalRepresentation)
    ucoords1 = coords1.realize_frame(urepr1)

    kdt1 = _get_cartesian_kdtree(ucoords1, storekdtree)

    if storekdtree and coords2.cache.get(storekdtree):
        # just use the stored KD-Tree
        kdt2 = coords2.cache[storekdtree]
    else:
        # strip out distance info
        urepr2 = coords2.data.represent_as(UnitSphericalRepresentation)
        ucoords2 = coords2.realize_frame(urepr2)

        kdt2 = _get_cartesian_kdtree(ucoords2, storekdtree)
        if storekdtree:
            # save the KD-Tree in coords2, *not* ucoords2
            coords2.cache['kdtree' if storekdtree is True else storekdtree] = kdt2

    # this is the *cartesian* 3D distance that corresponds to the given angle
    r = (2 * np.sin(Angle(seplimit) / 2.0)).value

    idxs1 = []
    idxs2 = []
    
    if seplimit.isscalar:
        for i, matches in enumerate(kdt1.query_ball_tree(kdt2, r)):
            for match in matches:
                idxs1.append(i)
                idxs2.append(match)
        
    if not seplimit.isscalar:
        urepr2 = coords2.data.represent_as(UnitSphericalRepresentation)
        ucoords2 = coords2.realize_frame(urepr2)
        ucoords2 = ucoords2.cartesian.xyz.value.T
        for j, r_obj in enumerate(r):
            print(f"{j}/{len(r)}",end="\r")
            for i, match in enumerate(kdt1.query_ball_point(ucoords2[j], r_obj)):
                idxs1.append(match)
                idxs2.append(j)
    idxs1 = np.array(idxs1, dtype=int)
    idxs2 = np.array(idxs2, dtype=int)
        
    if idxs1.size == 0:
        if coords2.distance.unit == u.dimensionless_unscaled:
            distunit = u.dimensionless_unscaled
        else:
            distunit = coords1.distance.unit
        d2ds = Angle([], u.deg)
        d3ds = u.Quantity([], distunit)
    else:
        d2ds = coords1[idxs1].separation(coords2[idxs2])
        try:
            d3ds = coords1[idxs1].separation_3d(coords2[idxs2])
        except ValueError:
            # they don't have distances, so we just fall back on the cartesian
            # distance, computed from d2ds
            d3ds = 2 * np.sin(d2ds / 2.0)

    return idxs1, idxs2, d2ds, d3ds

def hist2d_on_binned_array(hist, xedges, yedges, colorbar=False, ax=None, **kwargs):
    if ax is None:
        ax = plt.gca()
    xdata = (xedges[1:] + xedges[:-1])/2
    ydata = (yedges[1:] + yedges[:-1])/2
    xv, yv = np.meshgrid(xdata, ydata)
    x = xv.ravel()
    y = yv.ravel()
    z = hist.T.ravel()
    h, xedges, yedges, im = ax.hist2d(x, y, weights=z, bins=(xedges, yedges), **kwargs)
    if colorbar:
        cb = ax.figure.colorbar(im, ax=ax)
    return h, xedges, yedges, im
