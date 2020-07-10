all: stachelek-dissertation.pdf docs/index.html

stachelek-dissertation.pdf: _bookdown.yml _output.yml scripts/fix-tex.R \
_bookdown_files/jsta.bst \
index.Rmd \
msu-thesis.cls \
dissertation.bib \
_bookdown_files/msu-thesis.cls \
_bookdown_files/dissertation.bib \
correct-front-matter.tex \
01-connectivity.Rmd \
02-ag.Rmd \
03-bathymetry.Rmd \
end.Rmd
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book', output_dir = "")"
	Rscript scripts/fix-tex.R
	cd _bookdown_files && pdflatex stachelek-dissertation_mod.tex
	cd _bookdown_files && bibtex stachelek-dissertation_mod
	cd _bookdown_files && pdflatex stachelek-dissertation_mod.tex
	mv _bookdown_files/stachelek-dissertation_mod.pdf stachelek-dissertation.pdf
	cp stachelek-dissertation.pdf docs/stachelek-dissertation.pdf

stachelek-dissertation.docx: stachelek-dissertation.pdf \
_bookdown_files/stachelek-template.docx
	cd _bookdown_files && pandoc stachelek-dissertation_mod.tex \
	--reference-doc=stachelek-template.docx --bibliography=dissertation.bib
	--default-image-extension=.png -s -o stachelek-dissertation_mod.docx
	mv _bookdown_files/stachelek-dissertation_mod.docx stachelek-dissertation.docx

# rmarkdown::render_site(output_format = 'bookdown::word_document2', encoding = 'UTF-8')

docs/index.html: index.Rmd _output.yml stachelek-dissertation.pdf
	Rscript -e "bookdown::render_book('index.Rmd')"

_bookdown_files/msu-thesis.cls: msu-thesis.cls
	rsync -av msu-thesis.cls _bookdown_files/msu-thesis.cls

_bookdown_files/dissertation.bib: dissertation.bib
	rsync -av dissertation.bib _bookdown_files/dissertation.bib

bookdownfigures:
	rsync -av figures _bookdown_files

clean:
	-@rm _bookdown_files/*.nav _bookdown_files/*.aux _bookdown_files/*.snm _bookdown_files/*.toc _bookdown_files/*.out _bookdown_files/*.log _bookdown_files/*.cpc 2>/dev/null || true

ksc_response.pdf: ksc_response.md
	pandoc $< -H quote_setup.tex -V geometry:margin=1in -o $@

_bookdown_files/diff.pdf: _bookdown_files/old.tex stachelek-dissertation.pdf
	Rscript -e 'setwd("_bookdown_files"); tinytex::tlmgr_path(); latexdiffr::latexdiff("old.tex", "stachelek-dissertation_mod.tex")'

# msu-thesis.cls:
# 	wget http://mirrors.ctan.org/install/macros/latex/contrib/msu-thesis.tds.zip
# 	unzip -j msu-thesis.tds.zip -d .
# 	cp msu-thesis.cls _bookdown_files/msu-thesis.cls
# 	-rm msu-thesis.tds.zip
# 	-rm unified.bst
# 	-rm README
