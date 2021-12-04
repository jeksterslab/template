.latex <- function(clean = TRUE) {
  root <- rprojroot::is_rstudio_project
  source(
    root$find_file(
      "latex",
      "R_scripts",
      ".latex_tinytex.R"
    )
  )
  source(
    root$find_file(
      "latex",
      "R_scripts",
      ".latex_knit.R"
    )
  )
  source(
    root$find_file(
      "latex",
      "R_scripts",
      ".latex_compile.R"
    )
  )
  try(
    .latex_tinytex()
  )
  try(
    .latex_knit()
  )
  try(
    .latex_compile(clean = clean)
  )
}
