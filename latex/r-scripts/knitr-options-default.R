# See options
# https://yihui.org/knitr/options/
tmp_figures_folder <- file.path(
  tmp_folder, # see latex/r-scripts/start.R
  paste0(
    "tex-fig-",
    paste0(
      sample(
        letters,
        size = 8,
        replace = TRUE
      ),
      collapse = ""
    )
  )
)
dir.create(tmp_figures_folder)
knitr_options_default <- list(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6,
  fig.height = 6,
  fig.path = tmp_figures_folder,
  out.width = "100%",
  dev = "pdf",
  dev.args = list(
    pdf = list(
      family = "Times"
    )
  )
)
rm(
  tmp_figures_folder
)
