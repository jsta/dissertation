## Spatial Patterning of Lake Nutrients and Morphometry at Macroscales: Importance of Regional Factors and Aquatic-Terrestrial Linkages

> J. Stachelek, Michigan State University, 2020

## Products

pdf: [stachelek-dissertation.pdf](stachelek-dissertation.pdf)

## Prerequsites

### R packages
 
 * bookdown
 
 * tinytex
 
### LaTeX packages

See [Dockerfile](Dockerfile). Install with `tinytex::tlmgr_install("package")`.

## Building

### pdf + html

From the command line type: `$ make all`

## Editing

* The title page, abstract, preface, and introduction source is set in [correct-front-matter.tex](correct-front-matter.tex). Relevant sections need to be copied to [index.Rmd](index.Rmd) if attemping to build an html version.

* Each individual chapter is a numbered Rmd file in the top level folder.

* End matter is set in [end.Rmd](end.Rmd)

* Bibtex files are listed in [index.Rmd](index.Rmd), stored in the top level folder, **and** symlinked (or copied) to the `_bookdown_files` directory

* Figures are stored under [figures](figures) and copied to [_bookdown_files/figures]

* Formatting of figure and table captions for supplementary material is set in [preamble.tex](preamble.tex)

* Make LaTeX commands available to the initial Rmd conversion process by placing them in [preamble.tex](preamble.tex)

## Reproducibility

```
docker build -t jsta/dissertation:latest .
docker create --name dissertation3 jsta/dissertation
docker cp dissertation3:~/stachelek-dissertation.pdf test.pdf
```

## Links

https://grad.msu.edu/etd/formatting-guide

https://github.com/jrosen48/dissertation

https://ctan.org/pkg/msu-thesis?lang=en

https://twitter.com/JillDeines/status/991725606311116800
