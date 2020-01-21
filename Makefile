all: MSU-thesis-testfile.pdf

MSU-thesis-testfile.pdf: MSU-thesis-testfile.tex
	pdflatex $<

msu-thesis.cls:
	wget http://mirrors.ctan.org/install/macros/latex/contrib/msu-thesis.tds.zip
	unzip -j msu-thesis.tds.zip -d .
	-rm msu-thesis.tds.zip
	-rm unified.bst
	-rm README
