.latex_compile <- function(clean = TRUE) {
  root <- rprojroot::is_rstudio_project
  try(
    system(
      'latexmk -f -pdf -interaction=nonstopmode -output-directory="latex/pdf" latex/*.tex'
    )
  )
  # clean
  if (clean) {
    invisible(
      lapply(
        X = c(
          "\\.xml$",
          "\\.out$",
          "\\.log$",
          "\\.fls$",
          "\\.fdb_latexmk$",
          "\\.blg$",
          "\\.bcf$",
          "\\.bbl$",
          "\\.aux$"
        ),
        FUN = function(x) {
          invisible(
            lapply(
              X = list.files(
                file.path(
                  rprojroot::find_root(root),
                  "latex",
                  "pdf"
                ),
                pattern = x,
                full.names = TRUE,
                all.files = TRUE
              ),
              FUN = unlink
            )
          )
        }
      )
    )
  }
}
