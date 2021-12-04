.latex_knit <- function() {
  root <- rprojroot::is_rstudio_project
  latex <- root$find_file(
    "latex"
  )
  Rtex_files <- list.files(
    latex,
    pattern = "\\.Rtex$",
    full.names = TRUE,
    all.files = TRUE
  )
  if (length(Rtex_files) > 0) {
    lapply(
      X = Rtex_files,
      FUN = function(i) {
        knitr::knit(
          input = i
        )
      }
    )
    tex_files <- list.files(
      rprojroot::find_root(root),
      pattern = "\\.tex$",
      full.names = TRUE,
      all.files = TRUE
    )
    file.copy(
      from = tex_files,
      to = latex,
      overwrite = TRUE
    )
    unlink(tex_files)
  }
}
