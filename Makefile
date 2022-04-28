.PHONY: all archlinux pkg deps style check cran site build install lint cov xz data latex clean term rclean

all: clean pkg deps style README.md man/*.Rd check site build install

README.md: README.Rmd R/*.R
	Rscript -e "rmarkdown::render('README.Rmd')"

man/*.Rd: R/*.R
	Rscript -e "devtools::document()"
	
archlinux:
	bash .dependencies-archlinux-dev.sh
	bash .dependencies-archlinux-pkg.sh

pkg:
	Rscript .dependencies-r-dev.R
	Rscript .dependencies-r-pkg.R

deps:
	find R-dependencies -name \*.R -exec cp {} R \;

style:
	Rscript -e "styler::style_dir(exclude_dirs = c('.library', '.notes'), filetype = c('.R', '.Rmd'))"

check:
	Rscript -e "devtools::check(cran = FALSE)"

cran:
	Rscript -e "devtools::check()"

site:
	Rscript -e "pkgdown::build_site()"
	
build:
	Rscript -e "devtools::build(path = '.')"

install:
	Rscript -e "devtools::install(pkg = '.')"

lint:
	Rscript -e "lintr::lint_dir('R')"
	Rscript -e "lintr::lint_dir('R-dependencies')"
	Rscript -e "lintr::lint_dir('tests')"

cov:
	Rscript -e "covr::package_coverage()"

xz:
	Rscript -e "tools::resaveRdaFiles(paths = 'data', compress = 'xz')"

data:
	Rscript -e "tools::resaveRdaFiles(paths = 'data')"

latex:
	Rscript -e "source('latex/r-scripts/latex-make.R'); LatexMake(clean = TRUE)"

term:
	cp .bash* ~
	cp .vim* ~
	bash .vimplugins

rclean:
	rm -rf .library/*
	Rscript -e "remove.packages(installed.packages(priority = 'NA'))"

clean:
	@rm -rf README.html
	@rm -rf README.md
	@rm -rf docs/*
	@rm -rf man/*
	@rm -rf NAMESPACE
	@rm -rf latex/pdf/*.*
	@rm -rf data-process/*.Rds
	@find tmp/ -type f -not -name '.gitignore'-delete
