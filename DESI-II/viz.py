from matplotlib.colors import ListedColormap
import matplotlib.pyplot as plt
import mpl_scatter_density
import numpy as np


def get_viridis_white():
    viridis = plt.cm.get_cmap("viridis", 256)
    newcolors = viridis(np.linspace(0, 1, 256))
    white = np.array([1, 1, 1, 1])
    newcolors[:1, :] = white
    viridis_white = ListedColormap(newcolors, name="viridis_white")
    return viridis_white


def plot_spectra(
    x_test, x_recon, x_err, wavelength, descale=False, scaling="tanh", overplot=True
):
    """Plots original, reconstructed and residual spectra
    Args:
    x_test (array): original spectra
    x_recon (array): reconstructed spectra
    x_err (array): measurement errors on the data
    wavelength (array): wavelengths corresponding to the fluxes
    descale (bool): Whether or not to do the inverse tanh transformation
    """

    if descale:
        if scaling == "tanh":
            x_test = np.arctanh(x_test)
            x_recon = np.arctanh(x_recon)
        if scaling == "sigmoid":
            x_test = _logit(x_test)
            x_recon = _logit(x_recon)
    residuals = (x_test - x_recon) / (1 + np.abs(x_test))
    weighted_residuals = (x_test - x_recon) / x_err

    if overplot:
        fig, (ax1, ax2, ax3, ax4) = plt.subplots(
            nrows=4, ncols=1, sharex=True, figsize=(20, 15)
        )

        ax1.step(wavelength, x_test, c="k", label="Input", ls="--", lw=0.8)
        ax1.step(wavelength, x_recon, c="r", alpha=0.8, lw=1, label="Reconstructed")
        ax1.grid(alpha=0.5)
        ax1.legend()

        ax2.step(wavelength, residuals, c="k", label="Fractional Residuals", lw=0.8)
        # ax2.set_ylim(-10,10)
        ax2.grid(alpha=0.5)
        ax2.legend()

        ax3.step(
            wavelength,
            x_err / (1 + x_test),
            c="k",
            label="Fractional Flux error",
            lw=0.8,
        )
        ax3.set_ylim(0, 0.5)
        ax3.grid(alpha=0.5)
        ax3.legend()

        ax4.step(
            wavelength, weighted_residuals, c="k", label="Weighted Residuals", lw=0.8
        )
        # ax4.set_ylim(0,0.5)
        ax4.grid(alpha=0.5)
        ax4.legend()

        fig.subplots_adjust(hspace=0.02)

    else:
        fig, (ax1, ax2, ax3, ax4) = plt.subplots(
            nrows=3, ncols=1, sharex=True, figsize=(20, 15)
        )

        ax1.step(wavelength, x_test, c="k", label="Input")
        ax1.grid(alpha=0.5)
        ax1.legend()

        ax2.step(wavelength, x_recon, c="k", label="Reconstructed")
        ax2.grid(alpha=0.5)
        ax2.legend()

        ax3.step(wavelength, residuals, c="k", label="Fractional Residuals", lw=0.8)
        ax3.grid(alpha=0.5)
        ax3.legend()

        ax4.step(
            wavelength, weighted_residuals, c="k", label="Weighted Residuals", lw=0.8
        )
        # ax4.set_ylim(0,0.5)
        ax4.grid(alpha=0.5)
        ax4.legend()

        fig.subplots_adjust(hspace=0.02)

    if descale:
        fig.suptitle("De-scaled Data")
    else:
        fig.suptitle("Scaled Data")

        
def plot_zspec_zphot(
    z_spec,
    z_phot,
    metrics=None,
    z_min=None,
    z_max=None,
    outlier_threshold=None,
    mpl_scatter_density_kwargs=None,
):

    if metrics is not None:
        sigma_nmad, bias, percent_outlier = metrics
    
    with plt.style.context('seaborn-whitegrid'):
        fig, ax = plt.subplots(figsize=(6, 6), subplot_kw={"projection": "scatter_density"})

        if mpl_scatter_density_kwargs is None:
            mpl_scatter_density_kwargs = dict(dpi=30)
        
        scatter_density = ax.scatter_density(
            z_spec,
            z_phot,
            cmap=get_viridis_white(),
            **mpl_scatter_density_kwargs,
        )

        cb = fig.colorbar(scatter_density, fraction=0.046, pad=0.04)
        
        if z_min is None:
            z_min = 0
        
        if z_max is None:
            z_max = 0.4
        
        ax.plot([z_min, z_max], [z_min, z_max], c='gray', lw=1.5)
        ax.set_xlim(z_min, z_max)
        ax.set_ylim(z_min, z_max)
        x = np.linspace(z_min, z_max, 10)
        
        if outlier_threshold is None:
            outlier_theshold = 0.05
        
        outlier_upper = x + outlier_threshold * (1 + x)
        outlier_lower = x - outlier_threshold * (1 + x)
        ax.plot(x, outlier_upper, "k--")
        ax.plot(x, outlier_lower, "k--")

        ax.set_xlabel(r"$z_{\mathrm{spec}}$", fontsize=20)
        ax.set_ylabel(r"$z_{\mathrm{phot}}$", fontsize=20)
        ax.xaxis.grid(alpha=0.8)
        ax.yaxis.grid(alpha=0.8)
        ax.set_aspect("equal")
        ax.set_xticks(np.linspace(z_min, z_max, 9))
        ax.set_yticks(np.linspace(z_min, z_max, 9))

        if metrics is not None:
            textstr = "\n".join(
                (
                    r"$\sigma_{\mathrm{NMAD}}=%.5f$" % (sigma_nmad,),
                    r"$\mathrm{f}_{\mathrm{outlier}}=%.2f$" % (percent_outlier,),
                    r"$\langle \frac{\Delta z}{1+z_{\mathrm{spec}}} \rangle=%.5f$"
                    % (bias),
                )
            )

        # these are matplotlib.patch.Patch properties
        props = dict(boxstyle="round, pad=0.7", facecolor="w", alpha=0.5)

        # place a text box in upper left in axes coords
        ax.text(
            0.05,
            0.97,
            textstr,
            transform=ax.transAxes,
            fontsize=12,
            verticalalignment="top",
            bbox=props,
        )
        return fig