all: stachelek-dissertation.pdf

# msu-thesis.cls
stachelek-dissertation.pdf: _bookdown.yml _output.yml scripts/fix-tex.R \
index.Rmd \
dissertation.bib \
correct-front-matter.tex end-matter.tex \
01-connectivity.Rmd \
02-ag.Rmd \
03-bathymetry.Rmd
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book', output_dir = "")"
	Rscript scripts/fix-tex.R
	cd _bookdown_files && pdflatex stachelek-dissertation_mod.tex
	cd _bookdown_files && bibtex stachelek-dissertation_mod
	cd _bookdown_files && pdflatex stachelek-dissertation_mod.tex
	mv _bookdown_files/stachelek-dissertation_mod.pdf stachelek-dissertation.pdf
	rm docs/stachelek-dissertation.pdf

stachelek-dissertation.docx: stachelek-dissertation.pdf \
_bookdown_files/stachelek-template.docx
	cd _bookdown_files && pandoc stachelek-dissertation_mod.tex \
	--reference-doc=stachelek-template.docx --bibliography=pinp.bib \
	--bibliography=dissertation.bib \
	--default-image-extension=.png -s -o stachelek-dissertation_mod.docx
	mv _bookdown_files/stachelek-dissertation_mod.docx stachelek-dissertation.docx

# rmarkdown::render_site(output_format = 'bookdown::word_document2', encoding = 'UTF-8')

docs/index.html: index.Rmd
	Rscript -e "bookdown::render_book('index.Rmd')"

msu-thesis.cls:
	wget http://mirrors.ctan.org/install/macros/latex/contrib/msu-thesis.tds.zip
	unzip -j msu-thesis.tds.zip -d .
	cp msu-thesis.cls _bookdown_files/msu-thesis.cls
	-rm msu-thesis.tds.zip
	-rm unified.bst
	-rm README
