# tinytex
lib <- ".library"
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
if (
  !dir.exists(
    file.path(
      Sys.getenv("HOME"),
      ".TinyTeX"
    )
  )
) {
  tinytex::install_tinytex()
  tinytex:::install_yihui_pkgs()
  tinytex::tlmgr_install("biblatex-apa")
  tinytex::tlmgr_install("apa7")
  tinytex::tlmgr_update()
}
root <- rprojroot::is_rstudio_project
source(
  root$find_file(
    "latex",
    "R_scripts",
    "start.R"
  )
)
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
  rm(tex_files)
}
rm(
  Rtex_files
)
