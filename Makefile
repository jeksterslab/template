.PHONY: all archlinux pkg deps style check cran site build install lint cov xz data tinytex latex clean term rclean start

all: clean pkg deps style README.md man/*.Rd check site build install

README.md: README.Rmd R/*.R
	Rscript -e "rmarkdown::render('README.Rmd')"

man/*.Rd: R/*.R
	Rscript -e "devtools::document()"
	
archlinux:
	bash .dependencies-archlinux-dev.sh
	bash .dependencies-archlinux-pkg.sh

ubuntu:
	bash .dependencies-ubuntu-dev.sh
	bash .dependencies-ubuntu-pkg.sh

pkg:
	Rscript .dependencies-r-dev.R
	Rscript .dependencies-r-pkg.R

deps:
	find r-dependencies -name \*.R -exec cp {} R \;

style:
	Rscript -e "styler::style_dir(exclude_dirs = c('.library', '.notes'), filetype = c('.R', '.Rmd'))"

check:
	Rscript -e "devtools::check(cran = FALSE)"

cran:
	Rscript -e "rhub::check_for_cran(email = 'r.jeksterslab@gmail.com')"

site:
	Rscript -e "pkgdown::build_site()"
	
build:
	Rscript -e "devtools::build(path = '.')"

install:
	Rscript -e "devtools::install(pkg = '.')"

lint:
	Rscript -e "lintr::lint_dir('R')"
	Rscript -e "lintr::lint_dir('r-dependencies')"
	Rscript -e "lintr::lint_dir('r-writeup')"
	Rscript -e "lintr::lint_dir('tests')"
	Rscript -e "lintr::lint_dir('tests-benchmark')"
	Rscript -e "lintr::lint_dir('tests-external')"

cov:
	Rscript -e "covr::package_coverage()"

xz:
	Rscript -e "tools::resaveRdaFiles(paths = 'data', compress = 'xz')"

data:
	Rscript -e "tools::resaveRdaFiles(paths = 'data', version = 3)"

tinytex:
	Rscript -e "tinytex::install_tinytex(bundle = 'TinyTeX-2', force = TRUE)"

latex:
	Rscript -e "source('latex/r-scripts/latex-make.R'); LatexMake(clean = TRUE)"

term:
	cp .bash* ~
	cp .vim* ~
	-bash .vimplugins

rclean:
	rm -rf .library/*
	Rscript -e "remove.packages(installed.packages(priority = 'NA'))"

deepclean: clean
	@rm -rf .github
	@rm -rf .library
	@rm -rf .notes	
	@rm -rf data-process
	@rm -rf data-raw
	@rm -rf docs
	@rm -rf julia
	@rm -rf latex
	@rm -rf logs
	@rm -rf r-dependencies
	@rm -rf r-writeup
	@rm -rf tests-benchmark
	@rm -rf tests-external
	@rm -rf tmp
	@rm -rf _pkgdown.yml
	@rm -rf .bash_aliases
	@rm -rf .bash_profile
	@rm -rf .bash_secrets
	@rm -rf .bashrc
	@rm -rf .clone.sh
	@rm -rf .covrignore
	@rm -rf .dependencies-archlinux-dev.sh
	@rm -rf .dependencies-archlinux-pkg.sh
	@rm -rf .dependencies-r-dev.R
	@rm -rf .dependencies-r-pkg.R
	@rm -rf .dependencies-ubuntu-dev.sh
	@rm -rf .dependencies-ubuntu-pkg.sh
	@rm -rf .dependencies-win-dev.ps1
	@rm -rf .git
	@rm -rf .Rbuildignore
	@rm -rf .Renviron
	@rm -rf .Rprofile
	@rm -rf .vimplugins
	@rm -rf .vimrc
	@rm -rf latexmkrc
	@rm -rf Makefile
	@rm -rf NEWS.md
	@rm -rf project.Rproj
	@rm -rf README.Rmd
	@rm -rf *.uuid
	@rm -rf *.tar.gz

start: term rclean pkg deps tinytex

clean:
	@rm -rf README.html
	@rm -rf README.md
	@rm -rf docs/*
	@rm -rf man/*
	@rm -rf NAMESPACE
	@rm -rf latex/pdf/*.*
	@rm -rf data-process/*.Rds
	@find tmp/ -type f -not -name '.gitignore'-delete
