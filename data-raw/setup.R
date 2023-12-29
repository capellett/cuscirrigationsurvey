install.packages(c("devtools", "roxygen2", "testthat", "knitr"))

library(devtools)

use_devtools()
## paste the code snipper in to the .Rprofile file.



## Windows needs Rtools to build packages from source
## Rtools is NOT an R package. NOT installed with install.packages().
## download from https://cran.r-project.org/bin/windows/Rtools/
## and run the installer.

## installation you may see a window “Select Additional Tasks”.
## Do NOT select  “Edit the system PATH”.
## Do select “Save version information to registry”, should be default.


##request a package development situation report
devtools::dev_sitrep()

# devtools::update_packages("devtools")

## non-exhaustive list of entries in .Rbuildignore :

##  ^.*\.Rproj$         # Designates the directory as an RStudio Project
##  ^\.Rproj\.user$     # Used by RStudio for temporary files
##  ^README\.Rmd$       # An Rmd file used to generate README.md
##  ^LICENSE\.md$       # Full text of the license
##  ^cran-comments\.md$ # Comments for CRAN submission
##  ^data-raw$          # Code used to create data included in the package
##  ^pkgdown$           # Resources used for the package website
##  ^_pkgdown\.yml$     # Configuration info for the package website
##  ^\.github$          # Contributing guidelines, CoC, issue templates, etc.

## don't include the commentsin the .Rbuildignore file!

# usethis::use_build_ignore()

usethis::create_package('.')

usethis::use_readme_rmd()
# here::dr_here()

# devtools::load_all()
