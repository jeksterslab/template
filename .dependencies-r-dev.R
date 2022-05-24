# R dependencies for development
lib <- ".library"
installed <- installed.packages(lib = lib)
pkg <- c(
  "rhub",
  "covr",
  "devtools",
  "knitr",
  "lintr",
  "pkgdown",
  "rmarkdown",
  "rprojroot",
  "styler",
  "testthat",
  "microbenchmark",
  "ggplot2",
  "tikzDevice"
)
for (i in seq_along(pkg)) {
  if (!(pkg[i] %in% installed)) {
    install.packages(
      pkg[i],
      lib = lib
    )
  }
}
pkg <- c(
  "rstudio/tinytex"
)
for (i in seq_along(pkg)) {
  if (!(pkg[i] %in% installed)) {
    remotes::install_github(
      repo = pkg[i],
      lib = lib
    )
  }
}
