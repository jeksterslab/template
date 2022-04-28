# find root directory
root <- rprojroot::is_rstudio_project
# set environment variables
Sys.setenv(
  R_LIBS_USER = root$find_file(
    ".library"
  )
)
# root_folder
root_folder <- basename(
  dirname(
    root$find_file(
      "project.Rproj"
    )
  )
)
# source R scripts in R-dependencies and R
lapply(
  X = c("R-dependencies", "R"),
  FUN = function(x) {
    x <- list.files(
      path = root$find_file(
        x
      ),
      pattern = "\\.R$",
      full.names = TRUE,
      all.files = TRUE,
      recursive = TRUE
    )
    if (length(x) > 0) {
      lapply(
        X = x,
        FUN = source
      )
    }
  }
)
# load all data in data/
data_files <- list.files(
  path = root$find_file(
    "data"
  ),
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
# other data folders
data_raw_folder <- root$find_file(
  "data-raw"
)
data_process_folder <- root$find_file(
  "data-process"
)
# tmp
tmp_folder <- root$find_file(
  "tmp"
)
# logs
logs_folder <- root$find_file(
  "logs"
)
