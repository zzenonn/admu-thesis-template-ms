# Builds the thesis inside the TeX Live container (no local TeX needed).
#   make         full build: pdflatex, bibtex, pdflatex x2 -> build/main.pdf
#   make quick   single pdflatex pass (text edits, no new citations/refs)
#   make clean   remove build/

MAIN     = main
IMAGE   ?= thesis-latex
BUILDDIR = build

DOCKER   = docker run --rm -u $$(id -u):$$(id -g) -v "$(CURDIR)":/w
PDFLATEX = $(DOCKER) -w /w/src $(IMAGE) pdflatex -interaction=nonstopmode \
           -halt-on-error -file-line-error -output-directory=../$(BUILDDIR) $(MAIN).tex
BIBTEX   = $(DOCKER) -w /w/$(BUILDDIR) -e BIBINPUTS=/w/src: -e BSTINPUTS=/w/src: \
           $(IMAGE) bibtex $(MAIN)

.PHONY: pdf quick image clean

pdf: image | $(BUILDDIR)
	$(PDFLATEX)
	$(BIBTEX)
	$(PDFLATEX)
	$(PDFLATEX)

quick: image | $(BUILDDIR)
	$(PDFLATEX)

# Builds the image from .devcontainer/Dockerfile the first time it's needed
image:
	@docker image inspect $(IMAGE) >/dev/null 2>&1 || docker build -t $(IMAGE) .devcontainer

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

clean:
	rm -rf $(BUILDDIR)
