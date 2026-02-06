## Release summary

This release updates the shipped xgboost models (again) because xgboost v3 broke downstream packages. 
We've added tests to guard against breaking chganges in xgboost in the future and think the models are now saved in a stable format.

## R CMD check results

0 errors | 0 warnings | 0 notes

* installed size is 16.2Mb
     sub-directories of 1Mb or more:
       data  16.1Mb

The CRAN Repository Policy (Revision 6286) says about package size

> As a general rule, neither data nor documentation should exceed 5MB [...].
Where a large amount of data is required (even after compression), consideration 
should be given to a separate data-only package which can be updated only rarely 
(since older versions of packages are archived in perpetuity). 

Our interpretation of this paragraph is that data-only packages may be larger 
than 5MB in exceptional cases, and especially when no regular updates are planned.
This package hosts models for usage in the CRAN package 
[nflfastR](https://cran.r-project.org/package=nflfastR). It was not planned to
update those models and, in fact, we did not update them. However, models were
saved as R objects which caused compatibility problems with newer versions of
xgboost. This update resolves those problems by saving the models as raw vector
representations which can be handled by xgboost and future xgboost versions.
xgboost v3 forced us to update the models (again). This time hopefully the last
time.

## revdepcheck results

We checked 1 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages
