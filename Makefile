all: dissertation.pdf

dissertation.pdf: index.Rmd
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book', output_dir = "")"
	Rscript scripts/fix-tex.R
	cd _bookdown_files && pdflatex stachelek-dissertation_mod.tex
	cd _bookdown_files && bibtex stachelek-dissertation_mod
	cd _bookdown_files && pdflatex stachelek-dissertation_mod.tex

msu-thesis.cls:
	wget http://mirrors.ctan.org/install/macros/latex/contrib/msu-thesis.tds.zip
	unzip -j msu-thesis.tds.zip -d .
	cp msu-thesis.cls _bookdown_files/msu-thesis.cls
	-rm msu-thesis.tds.zip
	-rm unified.bst
	-rm README
