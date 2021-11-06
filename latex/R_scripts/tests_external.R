# find root directory
root <- rprojroot::is_rstudio_project
# source start.R
source(
  root$find_file(
    "latex",
    "R_scripts",
    "start.R"
  )
)
# run tests_external
tests_external_folder <- root$find_file(
  "tests_external"
)
tests_external_files <- list.files(
  tests_external_folder,
  pattern = "\\.R$",
  full.names = TRUE,
  all.files = TRUE
)
lapply(
  X = tests_external_files,
  FUN = source
)
rm(
  tests_external_files,
  tests_external_folder
)
