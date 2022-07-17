# R dependencies for the project from github
pkg <- c(
  "rstudio/tinytex"
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
for (i in seq_along(pkg)) {
  install_github(
    repo = pkg[i],
    lib = dot_library_folder,
    dependencies = TRUE
  )
}
