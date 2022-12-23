SRCDIR = src/
TARGET = presentation

allPDFFromSVG := $(shell find -type f | grep "\.svg$$" | sed "s/svg$$/pdf/g")

%.pdf: %.svg
	inkscape $< --export-pdf=$@

%.pdf: %.gplot
	gnuplot $<

all: ${allPDFFromSVG} pics/physicallyBasedRendering/shininessGraph.pdf
	pdflatex -shell-escape $(SRCDIR)$(TARGET)
	pdflatex -shell-escape $(SRCDIR)$(TARGET)
	#bibtex $(TARGET)
	#pdflatex -shell-escape $(TARGET)
	#pdflatex -shell-escape $(TARGET)

clean:
	rm -rf *.aux *.pdf *.log *.toc *.bbl *.blg *.out *.nav *.snm *.pyg *.vrb _minted-presentation ${allPDFFromSVG}
