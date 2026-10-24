# ADMU MS/PhD Thesis Template

A LaTeX template for Ateneo de Manila University DISCS theses/dissertations, with a
dev container so you don't need a local TeX install.

> For building without the dev container (a local TeX Live install), see the
> [README in the src directory](src/README.md).

## Building in the dev container

### Prerequisites

1. [VS Code](https://code.visualstudio.com/) with the
   [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
2. Docker, running locally

### Workflow

1. Open this repository in VS Code and choose "Reopen in Container" when prompted
   (or run the commands below directly if you have Docker without VS Code).
2. Edit your thesis fields and content in `src/main.tex` and `src/*.tex`.
3. Build from the project root (not from `src/`):

```bash
make          # full build: pdflatex, bibtex, pdflatex x2 -> build/main.pdf
make quick    # single pdflatex pass, for text-only edits
make clean    # remove build/
```

The first `make` call builds the `thesis-latex` image from
`.devcontainer/Dockerfile` automatically; subsequent builds reuse it.

## Document structure

- `src/main.tex` — preamble and document assembly (`\documentclass{discsthesis}`,
  packages, cover-page fields, `\input`s of the chapter files).
- `src/discsthesis.cls` — the thesis class: title/recommendation/acceptance
  pages, `\ThesisStyle{MS|PhD}{Final|FinalWithCorner|Draft}{nudge1}{nudge2}`,
  and the optional `\ThesisCoAdviser`/`\FourthPanelMember` layouts. See
  [src/README.md](src/README.md) for details.
- `src/01_abstract.tex` … `src/10_references.tex`, `src/09_appendices.tex` —
  sample chapter content; replace with your own.
- `src/thesis.bib` — bibliography database.

## Installing additional LaTeX packages

The `texlive/texlive:latest` base image already ships the full TeX Live
distribution. If you still need something extra, add it to
`.devcontainer/Dockerfile` (e.g. `RUN tlmgr install <package>`) and rebuild
the image (`docker build -t thesis-latex .devcontainer` or just delete the
image and re-run `make`).
