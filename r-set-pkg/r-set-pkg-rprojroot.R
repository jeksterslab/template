repos <- "https://cran.rstudio.com/"
install.packages(
  "rprojroot",
  repos = repos
)
root <- rprojroot::is_rstudio_project
dot_library_folder <- root$find_file(
  ".library"
)
dir.create(
  dot_library_folder,
  showWarnings = FALSE,
  recursive = TRUE
)
.libPaths(
  dot_library_folder,
  include.site = FALSE
)
install.packages(
  "rprojroot",
  repos = repos,
  lib = dot_library_folder,
  dependencies = TRUE
)
