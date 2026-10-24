# ADMU MS Thesis Template

A repository for using Latex for the Ateneo de Manila University MS Computer Science thesis which follows the rules and guidelines imposed by the university.

## Requirements

* Latex Compiler (with pdflatex and bibtex)

## Compiling the Paper

The main entry point of the paper is `main.tex`. You can compile it using the following commands:

```bash
pdflatex main.tex && bibtex main && pdflatex main.tex
```

This will produce a file called `main.pdf`.

For *nix users, you may use the following bash script for convenience:

```bash
./compile.sh
```

If you are using the dev container instead, build from the project root with
`make` (see the root [README](../README.md)).

## Notes

### Class and style options

The document class is `discsthesis` (`\documentclass[oneside,12pt]{discsthesis}`).
`\ThesisStyle{MS|PhD}{Final|FinalWithCorner|Draft}{nudge1}{nudge2}` generates
the title, recommendation, and acceptance pages: the first argument picks the
MS or PhD wording, the second picks whether corner marks/a draft timestamp are
shown, and the last two nudge the two signature columns horizontally.

### Co-adviser and four-member panels

By default the recommendation/acceptance pages show one adviser and a
three-member panel. Setting `\ThesisCoAdviser{NAME, Ph.D.}` switches the
adviser signature to a two-column adviser/co-adviser layout; setting
`\FourthPanelMember{NAME, Ph.D.}` switches the panel to a 2x2 four-member
grid. Both are commented out by default in `main.tex` — uncomment the ones
you need.
