cur = $(shell pwd)

pres:
	cd docs; \
	Rscript --no-init-file  -e 'rmarkdown::render("index.Rmd", "all")'
