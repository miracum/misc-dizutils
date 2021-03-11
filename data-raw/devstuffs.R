packagename <- "DIZutils"

# remove existing description object
unlink("DESCRIPTION")

# Create a new description object
my_desc <- desc::description$new("!new")

# Set your package name
my_desc$set("Package", packagename)

# Set author names 2
# http://r-pkgs.had.co.nz/description.html
# Full list of roles: http://www.loc.gov/marc/relators/relaterm.html
my_desc$set_authors(c(
  person(
    "Jonathan M.",
    "Mang",
    role = c("aut", "cre"),
    email = "jonathan.mang@uk-erlangen.de",
    comment = c(ORCID = "0000-0003-0518-4710")
  ),
  person(
    "Lorenz A.",
    "Kapsner",
    role = c("aut"),
    comment = c(ORCID = "0000-0003-1866-860X")
  ),
  person(
    "MIRACUM - Medical Informatics in Research and Care in University Medicine",
    role = c("fnd")
  ),
  person("Universitätsklinikum Erlangen", role = "cph")
))

# Remove some author fields
my_desc$del("Maintainer")

# Set the version
my_desc$set_version("0.0.7.9003")

# The title of your package
my_desc$set(Title = "Utilities for 'DIZ' R Package Development")

# The description of your package
my_desc$set(
  Description = paste0(
    "Utility functions used for the R package development",
    " infrastructure inside the data integration centers ('DIZ')",
    " to standardize and facilitate repetitive tasks",
    " such as setting up a database connection",
    " or issuing notification messages and to avoid redundancy."
  )
)


# The date when description file has been created
my_desc$set("Date" = as.character(Sys.Date()))

# The date package language:
my_desc$set("Language" = "en-US")

# The urls
my_desc$set("URL", "https://github.com/miracum/misc-dizutils")
my_desc$set("BugReports",
            "https://github.com/miracum/misc-dizutils/issues")

# Vignette Builder
# my_desc$set("VignetteBuilder" = "knitr")

# License
my_desc$set("License", "GPL-3")

# System requirements (for CRAN to avoid Rpostgres-errors):
my_desc$set("SystemRequirements",
            "libpq >= 9.0: libpq-dev (deb) or postgresql-devel (rpm)")

# Save everyting
my_desc$write(file = "DESCRIPTION")

# License
#usethis::use_gpl3_license(name = "Universitätsklinikum Erlangen")


# add Imports and Depends
# Listing a package in either Depends or Imports ensures that it’s installed when needed
# Imports just loads the package, Depends attaches it
# Loading will load code, data and any DLLs; register S3 and S4 methods; and run the .onLoad() function.
##      After loading, the package is available in memory, but because it’s not in the search path,
##      you won’t be able to access its components without using ::.
##      Confusingly, :: will also load a package automatically if it isn’t already loaded.
##      It’s rare to load a package explicitly, but you can do so with requireNamespace() or loadNamespace().
# Attaching puts the package in the search path. You can’t attach a package without first loading it,
##      so both library() or require() load then attach the package.
##      You can see the currently attached packages with search().

# Depends
usethis::use_package("R", min_version = "3.1.0", type = "Depends")

## Imports
usethis::use_package("config", type = "Imports")
usethis::use_package("data.table", type = "Imports")
# usethis::use_package("ggplot2", type = "Imports")
# usethis::use_package("ggpubr", type = "Imports")
# usethis::use_package("magrittr", type = "Imports")
# usethis::use_package("polynom", type = "Imports")
usethis::use_package("DBI", type = "Imports", min_version = "1.1.0")
## For `combine_stats`:
usethis::use_package("Hmisc", type = "Imports")
## For `format_POSIXct`:
usethis::use_package("parsedate", type = "Imports")
## For `combine_stats`:
usethis::use_package("psych", type = "Imports")
## For `feedback`:
usethis::use_package("rapportools", type = "Imports")
usethis::use_package("RJDBC", type = "Imports")
## For xml_to_json:
usethis::use_package("RJSONIO", type = "Imports")
usethis::use_package("RPostgres", type = "Imports")
usethis::use_package("shiny", type = "Imports")
usethis::use_package("shinyjs", type = "Imports")
## For xml_to_json:
usethis::use_package("xml2", type = "Imports")


## Suggests
usethis::use_package("testthat", type = "Suggests")
usethis::use_package("lintr", type = "Suggests")


## buildignore
usethis::use_build_ignore("LICENSE.md")
usethis::use_build_ignore(".gitlab-ci.yml")
usethis::use_build_ignore("data-raw")
usethis::use_build_ignore(".vscode")
usethis::use_build_ignore(".lintr")
usethis::use_build_ignore(".spelling")
usethis::use_build_ignore("tic.R")
usethis::use_build_ignore(".github")
usethis::use_build_ignore("cran-comments.md")
usethis::use_build_ignore("logfile.log")
# usethis::use_build_ignore("NEWS.md")

# gitignore
usethis::use_git_ignore("/*")
usethis::use_git_ignore("/*/")
usethis::use_git_ignore("*.log")
usethis::use_git_ignore("!/.gitignore")
usethis::use_git_ignore("!/.Rbuildignore")
usethis::use_git_ignore("!/.gitlab-ci.yml")
usethis::use_git_ignore("!/data-raw/")
usethis::use_git_ignore("!/DESCRIPTION")
usethis::use_git_ignore("!/inst/")
usethis::use_git_ignore("!/LICENSE.md")
usethis::use_git_ignore("!/man/")
usethis::use_git_ignore("!NAMESPACE")
usethis::use_git_ignore("!/R/")
usethis::use_git_ignore("!/README.md")
usethis::use_git_ignore("!/tests/")
usethis::use_git_ignore("/.Rhistory")
usethis::use_git_ignore("!/*.Rproj")
usethis::use_git_ignore("/.Rproj*")
usethis::use_git_ignore("/.RData")
usethis::use_git_ignore("/.vscode")
usethis::use_git_ignore("!/.lintr")
usethis::use_git_ignore("!/tic.R")
usethis::use_git_ignore("!/.github/")
usethis::use_git_ignore("!/NEWS.md")
usethis::use_git_ignore("!/cran-comments.md")

# code coverage
# covr::package_coverage()

# lint package
# lintr::lint_package()

# test package
# devtools::test()

# R CMD check package
# rcmdcheck::rcmdcheck()
# rcmdcheck::rcmdcheck(args = "--no-vignettes", build_args = "--no-build-vignettes")

# tidy description
usethis::use_tidy_description()
