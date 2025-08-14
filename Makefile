# Makefile for LaTeX documents with organized structure
# Run this Makefile from the project root directory
# Source files should be in src/, build outputs go to build/

# Default target document (change this to your main document, without .tex extension)
MAIN = main

# Source and build directories
SRCDIR = src
BUILDDIR = build

# LaTeX compilers
LATEX = pdflatex
XELATEX = xelatex
BIBTEX = bibtex
BIBER = biber

# Compiler flags
LATEXFLAGS = -shell-escape -interaction=nonstopmode -file-line-error -synctex=1
XELATEXFLAGS = -shell-escape -interaction=nonstopmode -file-line-error -synctex=1

.PHONY: all clean cleanall help pdf xelatex manual manual-xe list

# Default target (PDFLaTeX)
all: pdf

# Create build directory
$(BUILDDIR):
	mkdir -p $(BUILDDIR)

# Build PDF using latexmk with pdflatex (recommended)
pdf: $(SRCDIR)/$(MAIN).tex | $(BUILDDIR)
	cd $(SRCDIR) && latexmk -pdf -outdir=../$(BUILDDIR) $(LATEXFLAGS) $(MAIN).tex

# Build PDF using latexmk with xelatex
xelatex: $(SRCDIR)/$(MAIN).tex | $(BUILDDIR)
	cd $(SRCDIR) && latexmk -xelatex -outdir=../$(BUILDDIR) $(XELATEXFLAGS) $(MAIN).tex

# Alternative: manual build process with pdflatex
manual: $(SRCDIR)/$(MAIN).tex | $(BUILDDIR)
	cd $(SRCDIR) && $(LATEX) $(LATEXFLAGS) -output-directory=../$(BUILDDIR) $(MAIN).tex
	cd $(BUILDDIR) && -$(BIBTEX) $(MAIN)
	cd $(SRCDIR) && $(LATEX) $(LATEXFLAGS) -output-directory=../$(BUILDDIR) $(MAIN).tex
	cd $(SRCDIR) && $(LATEX) $(LATEXFLAGS) -output-directory=../$(BUILDDIR) $(MAIN).tex

# Alternative: manual build process with xelatex
manual-xe: $(SRCDIR)/$(MAIN).tex | $(BUILDDIR)
	cd $(SRCDIR) && $(XELATEX) $(XELATEXFLAGS) -output-directory=../$(BUILDDIR) $(MAIN).tex
	cd $(BUILDDIR) && -$(BIBER) $(MAIN)
	cd $(SRCDIR) && $(XELATEX) $(XELATEXFLAGS) -output-directory=../$(BUILDDIR) $(MAIN).tex
	cd $(SRCDIR) && $(XELATEX) $(XELATEXFLAGS) -output-directory=../$(BUILDDIR) $(MAIN).tex

# Clean auxiliary files
clean:
	rm -rf $(BUILDDIR)
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot
	rm -f *.fls *.fdb_latexmk *.synctex.gz *.idx *.ind *.ilg
	rm -f *.acn *.acr *.alg *.glg *.glo *.gls *.ist
	rm -f *.bcf *.run.xml *.xdv
	rm -rf _minted-*/

# Clean everything including PDF
cleanall: clean
	rm -f $(MAIN).pdf

# Watch for changes and rebuild automatically (pdflatex)
watch: $(SRCDIR)/$(MAIN).tex | $(BUILDDIR)
	cd $(SRCDIR) && latexmk -pdf -pvc -outdir=../$(BUILDDIR) $(LATEXFLAGS) $(MAIN).tex

# Watch for changes and rebuild automatically (xelatex)
watch-xe: $(SRCDIR)/$(MAIN).tex | $(BUILDDIR)
	cd $(SRCDIR) && latexmk -xelatex -pvc -outdir=../$(BUILDDIR) $(XELATEXFLAGS) $(MAIN).tex

# List available source files
list:
	@echo "Available LaTeX source files in $(SRCDIR)/:"
	@find $(SRCDIR) -name "*.tex" -type f | sed 's|$(SRCDIR)/||' | sed 's|\.tex$$||'

# Help target
help:
	@echo "LaTeX Build System with Organized Structure"
	@echo "=========================================="
	@echo ""
	@echo "Directory Structure:"
	@echo "  src/     - LaTeX source files (.tex, .bib, images, etc.)"
	@echo "  build/   - Build artifacts (aux files, logs, etc.)"
	@echo "  ./       - Final PDF output"
	@echo ""
	@echo "Available targets:"
	@echo "  all       - Build $(MAIN).pdf using latexmk + pdflatex (default)"
	@echo "  pdf       - Build $(MAIN).pdf using latexmk + pdflatex"
	@echo "  xelatex   - Build $(MAIN).pdf using latexmk + xelatex"
	@echo "  manual    - Build using manual pdflatex + bibtex process"
	@echo "  manual-xe - Build using manual xelatex + biber process"
	@echo "  clean     - Remove build directory and auxiliary files"
	@echo "  cleanall  - Remove all generated files including PDF"
	@echo "  watch     - Watch for changes and rebuild automatically (pdflatex)"
	@echo "  watch-xe  - Watch for changes and rebuild automatically (xelatex)"
	@echo "  list      - List available source files"
	@echo "  help      - Show this help message"
	@echo ""
	@echo "Usage Examples:"
	@echo "  make                    # Build default document ($(MAIN).tex)"
	@echo "  make MAIN=mydoc pdf     # Build mydoc.tex with pdflatex"
	@echo "  make MAIN=mydoc xelatex # Build mydoc.tex with xelatex"
	@echo ""
	@echo "XeLaTeX is recommended for:"
	@echo "  - Unicode text and non-Latin scripts"
	@echo "  - System fonts (TTF/OTF)"
	@echo "  - Modern typography features"
	@echo ""
	@echo "Note: Run this Makefile from the project root directory"
