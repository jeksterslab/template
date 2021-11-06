# find root directory
root <- rprojroot::is_rstudio_project
# set environment variables
Sys.setenv(R_LIBS_USER = ".library")
# source all scripts in R_dependencies/
R_dependencies_folder <- root$find_file(
  "R_dependencies"
)
R_dependencies_files <- list.files(
  R_dependencies_folder,
  pattern = "\\.R$",
  full.names = TRUE,
  all.files = TRUE
)
lapply(
  X = R_dependencies_files,
  FUN = source
)
rm(
  R_dependencies_files,
  R_dependencies_folder
)
# source all scripts in R/
R_folder <- root$find_file(
  "R"
)
R_files <- list.files(
  R_folder,
  pattern = "\\.R$",
  full.names = TRUE,
  all.files = TRUE
)
lapply(
  X = R_files,
  FUN = source
)
rm(
  R_files,
  R_folder
)
# load all data in data/
data_folder <- root$find_file(
  "data"
)
if (dir.exists(data_folder)) {
  data_files <- list.files(
    data_folder,
    pattern = "\\.rda$",
    full.names = TRUE,
    all.files = TRUE
  )
  for (i in seq_along(data_files)) {
    load(data_files[i])
  }
  rm(
    i,
    data_files
  )
}
rm(data_folder)
