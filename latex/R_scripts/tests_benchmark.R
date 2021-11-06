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
# run tests_benchmark
tests_benchmark_folder <- root$find_file(
  "tests_benchmark"
)
tests_benchmark_files <- list.files(
  tests_benchmark_folder,
  pattern = "\\.R$",
  full.names = TRUE,
  all.files = TRUE
)
lapply(
  X = tests_benchmark_files,
  FUN = source
)
rm(
  tests_benchmark_files,
  tests_benchmark_folder
)
