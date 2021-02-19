## Reason for Submission

This is a re-submission to fix two things:

* reduce size of `data/Rdata.rdb` by using the `LazyDataCompression` field in the
`DESCRIPTION` file with the same value the .rda files were compressed ('xz'). We
haven been requested by Prof. Ripley to fix this.

* Avoid a NOTE on the flavors `r-devel-linux-x86_64-fedora-clang`,`r-devel-linux-x86_64-fedora-gcc`, 
`r-patched-solaris-x86`, `r-release-macos-x86_64` and `r-oldrel-macos-x86_64` caused 
by the fact that the package xgboost is listed in "Imports" but not in the NAMESPACE
(see the below explanation of the last re-submission why xgboost is listed in 
"Imports").

## Last Re-Submission

This is a re-submission to fix a WARNING in the CRAN Package Check Results for the flavor "r-devel-linux-x86_64-debian-gcc".

Explanation:
Some of the data in this package are of class "xgb.Booster". The machine that
runs the R CMD Check has to have installed the package "xgboost" to correctly
identify the class and will otherwise raise a warning. For that reason xgboost
was listed in "Suggests" but it appears that this wasn't enough for the above
mentioned flavor. Therefore xgboost is now listed in "Imports" which should
force the machine to install xgboost prior to the R CMD Check.
This was tested in the previous version on R-hub but it looks like their machines
didn't raise the warning for some reason.

## Test environments

* local R installation, R 4.0.3
* Debian Linux, R-devel, clang, ISO-8859-15 locale                       
* Debian Linux, R-devel, GCC                                             
* Debian Linux, R-devel, GCC, no long double                             
* Debian Linux, R-patched, GCC                                           
* Debian Linux, R-release, GCC                                           
* Fedora Linux, R-devel, clang, gfortran                                 
* Fedora Linux, R-devel, GCC                                             
* CentOS 8, stock R from EPEL                                            
* macOS 10.13.6 High Sierra, R-release, brew                             
* macOS 10.13.6 High Sierra, R-release, CRAN's setup                     
* Ubuntu Linux 20.04.1 LTS, R-devel, GCC                                 
* Ubuntu Linux 20.04.1 LTS, R-release, GCC                               
* Ubuntu Linux 20.04.1 LTS, R-devel with rchk                            
* Windows Server 2008 R2 SP1, R-devel, 32/64 bit                         
* Windows Server 2008 R2 SP1, R-oldrel, 32/64 bit                        
* Windows Server 2008 R2 SP1, R-patched, 32/64 bit                       
* Windows Server 2008 R2 SP1, R-release, 32/64 bit 
* win-builder (devel)

## revdepcheck results

We checked 1 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages

## R CMD check results

0 errors | 0 warnings | 1 note

* installed size is 15.8Mb
    sub-directories of 1Mb or more:
      data  15.7Mb

The CRAN Repository Policy (Revision 4336) says about package size

> As a general rule, neither data nor documentation should exceed 5MB [...].
Where a large amount of data is required (even after compression), consideration 
should be given to a separate data-only package which can be updated only rarely 
(since older versions of packages are archived in perpetuity). 

Our interpretation of this paragraph is that data-only packages may be larger 
than 5MB in exceptional cases, and especially when no updates are planned.
This package will host models that are currently partly included in the CRAN
package [nflfastR](https://cran.r-project.org/package=nflfastR). Swapping these 
models into a data-only package would significantly reduce the file size of the 
aforementioned package and it is not planned to update the data in this submission
at all. 

If this was a misinterpretation, then we apologize in advance for the expense incurred.
