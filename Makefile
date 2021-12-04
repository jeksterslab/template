.PHONY: all style lint cov archlinux cloud build clean xz data latex

all: clean build

doc: README.Rmd R/* R_dependencies/*
	Rscript .dependencies_r_dev.R
	Rscript .dependencies_r_pkg.R
	cp R_dependencies/*.R R
	Rscript -e "rmarkdown::render('README.Rmd')"
	Rscript -e "devtools::document()"

check: README.Rmd R/* R_dependencies/*
	Rscript .dependencies_r_dev.R
	Rscript .dependencies_r_pkg.R
	cp R_dependencies/*.R R
	Rscript -e "rmarkdown::render('README.Rmd')"
	Rscript -e "devtools::document()"
	Rscript -e "devtools::check(cran = FALSE)"

cran: README.Rmd R/* R_dependencies/*
	Rscript .dependencies_r_dev.R
	Rscript .dependencies_r_pkg.R
	cp R_dependencies/*.R R
	Rscript -e "rmarkdown::render('README.Rmd')"
	Rscript -e "devtools::document()"
	Rscript -e "devtools::check()"

style:
	Rscript -e "styler::style_dir(exclude_dirs = '.library', filetype = c('.R', '.Rmd'))"

lint:
	Rscript -e "lintr::lint_dir('R')"
	Rscript -e "lintr::lint_dir('R_dependencies')"
	Rscript -e "lintr::lint_dir('tests')"

cov:
	Rscript -e "covr::package_coverage()"

archlinux: README.Rmd R/* vignettes/*
	bash .dependencies_archlinux_dev.sh
	bash .dependencies_archlinux_pkg.sh
	Rscript .dependencies_r_dev.R
	Rscript .dependencies_r_pkg.R

cloud: README.Rmd R/* vignettes/*
	Rscript .dependencies_r_dev.R
	Rscript .dependencies_r_pkg.R

build:
	Rscript .dependencies_r_dev.R
	Rscript .dependencies_r_pkg.R
	Rscript -e "styler::style_dir(exclude_dirs = '.library', filetype = c('.R', '.Rmd'))"
	cp R_dependencies/*.R R
	Rscript -e "rmarkdown::render('README.Rmd')"
	Rscript -e "devtools::document()"
	Rscript -e "devtools::check(cran = FALSE)"
	Rscript -e "pkgdown::build_site()"
	Rscript -e "devtools::build(path = '.')"

xz:
	Rscript -e "tools::resaveRdaFiles(paths = 'data', compress = 'xz')"

data:
	Rscript -e "tools::resaveRdaFiles(paths = 'data')"

latex:
	Rscript -e "source('latex/R_scripts/.latex.R'); .latex(clean = TRUE)"

clean:
	@rm -rf README.html
	@rm -rf README.md
	@rm -rf docs/*
	@rm -rf man/*
	@rm -rf NAMESPACE
	@rm -rf latex/pdf/*.*
