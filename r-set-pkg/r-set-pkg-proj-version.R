# R dependencies for the project with specific versions
pkg <- c(
  "MASS"
)
ver <- c(
  "7.3-58"
)
root <- rprojroot::is_rstudio_project
dot_library_folder <- root$find_file(
  ".library"
)
.libPaths(
  dot_library_folder,
  include.site = FALSE
)
library(
  "remotes",
  lib.loc = dot_library_folder
)
installed <- installed.packages()
pkg_installed <- installed[, "Package"]
if (length(pkg > 0)) {
  if (length(pkg_installed) == 0) {
    for (i in seq_along(pkg)) {
      install_version(
        package = pkg[i],
        version = ver[i],
        repos = "https://cran.rstudio.com/",
        lib = dot_library_folder,
        dependencies = TRUE
      )
    }
  } else {
    for (i in seq_along(pkg)) {
      run <- FALSE
      if (pkg[i] %in% pkg_installed) {
        if (installed[pkg[i], "Version"] != ver[i]) {
          run <- TRUE
        }
      } else {
        run <- TRUE
      }
      if (run) {
        install_version(
          package = pkg[i],
          version = ver[i],
          repos = "https://cran.rstudio.com/",
          lib = dot_library_folder,
          dependencies = TRUE
        )
      }
    }
  }
}
