## Spatial Patterning of Lake Nutrients and Morphometry at Macroscales: Importance of Regional Factors and Aquatic-Terrestrial Linkages

## Timeline

June 19 - Dissertation draft due to commitee

August 19 - Approval deadline at Grad School

## Prerequsites

### R packages
 
 * bookdown
 
 * tinytex
 
### LaTeX packages

See [Dockerfile](Dockerfile)

## Building

### pdf
`$ make all`

### docx
`$ make stachelek-dissertation.docx`

### bookdown
`$ make docs/index.html`

## Editing

* The title page, abstract, preface, and introduction source is set in [correct-front-matter.tex](correct-front-matter.tex) and relevant sections copied to [index.Rmd](index.Rmd)

* Each individual chapter is a numbered Rmd file in the top level folder.

* Research frontiers source is set in [end.Rmd](end.Rmd)

* Bibtex files are listed in [index.Rmd](index.Rmd), stored in the top level folder, **and** symlinked (or copied) to the `_bookdown_files` directory

## Reproducibility

```
docker pull jsta/dissertation:latest
# docker build -t jsta/dissertation:latest .
docker create --name dissertation3 jsta/dissertation
docker cp dissertation3:~/stachelek-dissertation.pdf test.pdf
```

## Links

https://grad.msu.edu/etd/formatting-guide

https://github.com/jrosen48/dissertation

https://ctan.org/pkg/msu-thesis?lang=en

https://twitter.com/JillDeines/status/991725606311116800
