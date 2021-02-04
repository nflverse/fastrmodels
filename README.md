
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fastrmodels

<!-- badges: start -->

[![R-CMD-check](https://github.com/mrcaseb/fastrmodels/workflows/R-CMD-check/badge.svg)](https://github.com/mrcaseb/fastrmodels/actions)
<!-- badges: end -->

The R package fastrmodels is a lower level data-only package that
includes all models required by the nflfastR package. Since the models
take up significant file size, they have been swapped out of the
[nflfastR package](https://www.nflfastr.com/).

## Installation

You can install the released version of fastrmodels from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("fastrmodels")
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
