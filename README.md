
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fastrmodels

<!-- badges: start -->

[![CRAN
status](https://img.shields.io/cran/v/fastrmodels?style=flat-square&logo=R&label=CRAN)](https://CRAN.R-project.org/package=fastrmodels)
[![CRAN
downloads](http://cranlogs.r-pkg.org/badges/grand-total/fastrmodels)](https://CRAN.R-project.org/package=fastrmodels)
[![Dev
status](https://img.shields.io/github/r-package/v/nflverse/fastrmodels/master?label=dev%20version&style=flat-square&logo=github)](https://fastrmodels.nflverse.com)
[![R build
status](https://img.shields.io/github/workflow/status/nflverse/fastrmodels/R-CMD-check?label=R%20check&style=flat-square&logo=github)](https://github.com/nflverse/fastrmodels/actions)
[![nflverse
support](https://img.shields.io/discord/789805604076126219?color=7289da&label=nflverse%20support&logo=discord&logoColor=fff&style=flat-square)](https://discord.com/invite/5Er2FBnnQa)
<!-- badges: end -->

The R package fastrmodels is a lower level data-only package that
includes all models required by the nflfastR package. Since the models
take up significant file size, they have been swapped out of the
[nflfastR package](https://www.nflfastr.com/).

## Installation

You can install the released version of fastrmodels from
[CRAN](https://CRAN.R-project.org/package=fastrmodels) with:

``` r
install.packages("fastrmodels")
```

To get a bug fix or to use a feature from the development version, you
can install the development version of nflplotR either from
[GitHub](https://github.com/nflverse/fastrmodels/) with:

``` r
if (!require("remotes")) install.packages("remotes")
remotes::install_github("nflverse/fastrmodels")
```

or prebuilt from the [development repo](https://nflverse.r-universe.dev)
with:

``` r
install.packages("fastrmodels", repos = "https://nflverse.r-universe.dev")
```

## About the Models

This package hosts the following models:

-   `ep_model` : the expected points model,
-   `wp_model` : the win probability model,
-   `wp_model_spread` : the win probability model that includes pre-game
    spread lines,
-   `fg_model` : the field goal model,
-   `cp_model` : the completion probability model,
-   `xyac_model` : the expected yards after the catch model,
-   `xpass_model` : the expected pass model.

The models are open source and detailed descriptions can be found on
[Open Source
Football](https://www.opensourcefootball.com/posts/2020-09-28-nflfastr-ep-wp-and-cp-models/).
