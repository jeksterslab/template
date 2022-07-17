# R dependencies for development
pkg <- c(
  "covr",
  "devtools",
  "ggplot2",
  "knitr",
  "lintr",
  "microbenchmark",
  "pkgdown",
  "remotes",
  "rhub",
  "rmarkdown",
  "rprojroot",
  "styler",
  "testthat",
  "tidyverse",
  "tikzDevice"
)
root <- rprojroot::is_rstudio_project
dot_library_folder <- root$find_file(
  ".library"
)
.libPaths(
  dot_library_folder,
  include.site = FALSE
)
installed <- installed.packages()
pkg_installed <- installed[, "Package"]
check <- TRUE
if (length(pkg_installed) == 0) {
  check <- FALSE
}
for (i in seq_along(pkg)) {
  run <- TRUE
  if (check) {
    if (pkg[i] %in% pkg_installed) {
      run <- FALSE
    }
  }
  if (run) {
    install.packages(
      pkg[i],
      repos = "https://cran.rstudio.com/",
      lib = dot_library_folder,
      dependencies = TRUE
    )
  }
}
