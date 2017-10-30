# MetaGraph

Repository for the [QCBS meta-analysis workshop](http://qcbs.ca/wiki/meta-analysis-workshop) -- graphics.
I gave this talk October 30th, 2017.

## R packages required

### for the meta-analyses

- `meta`
- `metafor`

### To reproduce the slideshow

- `rmarkdown`
- `mapview`
- `wordcloud2`
- `visNetwork`
- `bibtex`


using a single line of code:

```r
install.packages(c('meta', 'metafor', 'mapview', 'bibtex', 'rmarkdown', 'visNetwork','wordcloud2'))
```


## Changes after the QCBS talk (10-30-2017)

- [X] use `mtext()` in a loop to add graph annotations in when creating multi-panels figure.
- [X] add KevCaz solution for Fig. 1 from Roca *et al.* (2016)
- [ ] add KevCaz solution for Fig. S2 from Vellend *et al.* (2013)
- [ ] add wordcloud
- [ ] add networks of co-authors
