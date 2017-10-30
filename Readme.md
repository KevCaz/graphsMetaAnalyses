# Tips to visualize your meta-analysis

This repository includes the talk (as a `.Rmd` file) and all the R scripts I
used for my meta-analysis visualization talk I gave during [the QCBS meta-analysis workshop](http://qcbs.ca/wiki/meta-analysis-workshop) on October 30th, 2017.


## R packages required

###  Meta-analysis packages

- `meta`
- `metafor`

### R packages required to reproduce the slideshow

- `bibtex`
- `rmarkdown`
- `mapview`
- `dplyr`
- `visNetwork`
- `bibtex`


using a single line of code:

```r
install.packages(c('bibtex', 'dplyr', 'meta', 'metafor', 'mapview', 'rmarkdown', 'visNetwork'))
```


## Changes after the QCBS talk (10-30-2017)

- [X] use `mtext()` in a loop to add graph annotations in when creating multi-panels figure.
- [X] add KevCaz solution for Fig. 1 from Roca *et al.* (2016)
- [X] add KevCaz solution for Fig. S2 from Vellend *et al.* (2013)
- [X] add networks of co-authors
