# R dependencies for the project
pkg <- c(
  "remotes"
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
for (i in seq_along(pkg)) {
  if (!(pkg[i] %in% pkg_installed)) {
    install.packages(
      pkg[i],
      repos = "https://cran.rstudio.com/",
      lib = dot_library_folder,
      dependencies = TRUE
    )
  }
}
