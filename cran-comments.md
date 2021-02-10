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

## R CMD check results

0 errors | 0 warnings | 2 notes

* New submission

* installed size is 19.7Mb (not a NOTE on win-builder.r-project.org.)

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
