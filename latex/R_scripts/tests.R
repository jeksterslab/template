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
# run tests
test_folder <- root$find_file(
  "tests",
  "testthat"
)
test_files <- list.files(
  test_folder,
  pattern = "\\.R$",
  full.names = TRUE,
  all.files = TRUE
)
lapply(
  X = test_files,
  FUN = source
)
rm(
  test_files,
  test_folder
)
