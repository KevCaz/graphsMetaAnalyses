cur = $(shell pwd)

pdf:
	cd pres; \
	Rscript --no-init-file  -e 'rmarkdown::render("metaGraph.Rmd", "all")'
