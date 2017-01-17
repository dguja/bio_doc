INKSCAPE_OPTS := -D -z --export-latex
DOT_OPTS := -Tsvg

DOT := $(wildcard *.dot)
DOT_SVG := $(patsubst %.dot,%.svg,$(DOT))

SVG := $(wildcard *.svg) $(DOT_SVG)
PDF := $(patsubst %.svg,%.pdf,$(SVG))
PDF_TEX := $(patsubst %.svg,%.pdf_tex,$(SVG))

.PHONY: all pdf_tex

all: dot_svg pdf_tex

dot_svg: $(DOT_SVG)

pdf_tex: $(PDF)

%.svg: %.dot
	dot $(DOT_OPTS) $< > $@

%.pdf: %.svg
	inkscape $(INKSCAPE_OPTS) --file=$< --export-pdf=$@

clean:
	@rm -vf $(PDF) $(PDF_TEX) $(DOT_SVG)

