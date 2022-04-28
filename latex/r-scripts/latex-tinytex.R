LatexTinytex <- function() {
  root <- rprojroot::is_rstudio_project
  # install tinytex
  lib <- file.path(
    rprojroot::find_root(root),
    ".library"
  )
  installed <- installed.packages(lib = lib)
  pkg <- c(
    "tinytex"
  )
  for (i in seq_along(pkg)) {
    if (!(pkg[i] %in% installed)) {
      install.packages(
        pkg[i],
        lib = lib
      )
    }
  }
  rm(i)
  if (
    !dir.exists(
      file.path(
        Sys.getenv("HOME"),
        ".TinyTeX"
      )
    )
  ) {
    tinytex::install_tinytex()
    lapply(
      X = read.table(
        file.path(
          rprojroot::find_root(root),
          "latex",
          "ctan",
          "pkg.txt"
        )
      ),
      FUN = tinytex::tlmgr_install
    )
    tinytex::tlmgr_update()
  }
}
