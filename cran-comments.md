## Release summary

This is release updates the shipped xgboost packages to raw vector representations of models for compatibility with future xgboost versions.

## R CMD check results

0 errors | 0 warnings | 0 notes

* installed size is 15.8Mb
    sub-directories of 1Mb or more:
      data  15.7Mb

The CRAN Repository Policy (Revision 6286) says about package size

> As a general rule, neither data nor documentation should exceed 5MB [...].
Where a large amount of data is required (even after compression), consideration 
should be given to a separate data-only package which can be updated only rarely 
(since older versions of packages are archived in perpetuity). 

Our interpretation of this paragraph is that data-only packages may be larger 
than 5MB in exceptional cases, and especially when no updates are planned.
This package hosts models for usage in the CRAN package 
[nflfastR](https://cran.r-project.org/package=nflfastR). It was not planned to
update those models and, in fact, we did not update them. However, models were
saved as R objects which caused compatibility problems with newer versions of
xgboost. This update resolves those problems by saving the models as raw vector
representations which can be handled by xgboost and future xgboost versions.

## revdepcheck results

We checked 1 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages
