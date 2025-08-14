# LaTeX Development Container

This is a VS Code dev container environment specifically configured for LaTeX document compilation and editing.

> **Note**: For local build instructions without using dev containers, see the [README in the src directory](src/README.md). The instructions below are for dev container builds.

## Features

- **Custom Dockerfile** - Built on top of `texlive/texlive:latest` with additional tools
- **Full TeXLive distribution** - Complete LaTeX installation with all packages
- **VS Code Extensions**:
  - LaTeX Workshop - Main LaTeX extension with build tools
  - LTeX - Grammar and spell checking
  - LaTeX Utilities - Additional LaTeX tools
  - Mathematic LaTeX - Enhanced math support
- **Syntax Highlighting** - Python Pygments for code blocks with `minted` package
- **Timezone** - Set to Asia/Shanghai (UTC+8)
- **Shell** - Zsh with Oh My Zsh configuration
- **Additional Python packages** - matplotlib, numpy, pillow for advanced LaTeX features

## Architecture

The container is built using a custom Dockerfile that:
- Starts from the official `texlive/texlive:latest` image (complete TeXLive distribution)
- Adds Python 3 and Pygments for `minted` package support
- Installs additional utilities (git, curl, imagemagick, etc.)
- Creates a non-root `vscode` user
- Configures timezone to UTC+8
- Sets up ImageMagick policies for PDF handling

## Getting Started

1. **Prerequisites**:
   - VS Code with Dev Containers extension installed
   - Docker running on your system

2. **Open the container**:
   - Copy this entire directory to your desired location
   - Open the directory in VS Code
   - When prompted, click "Reopen in Container" or use Command Palette: "Dev Containers: Reopen in Container"

3. **First build**:
   - The container will build from the Dockerfile on first run
   - This may take several minutes to download the TeXLive image and install dependencies
   - Subsequent starts will be much faster

## Usage

### Building Documents

Use the command line to build your documents with the included Makefile.

### Available Build Tools

- **latexmk**: Recommended - handles dependencies automatically (PDFLaTeX)
- **latexmk (XeLaTeX)**: Recommended for Unicode/system fonts - handles dependencies automatically
- **latexmk (shell-escape)**: For documents using `minted` or other packages requiring shell access (PDFLaTeX)
- **latexmk (XeLaTeX + shell-escape)**: XeLaTeX with shell access for `minted` etc.
- **pdflatex + bibtex**: Traditional workflow for documents with bibliographies
- **xelatex + biber**: Modern workflow with Unicode support and bibliographies
- **pdflatex (shell-escape) + bibtex**: Traditional workflow with shell access
- **xelatex (shell-escape) + biber**: Modern workflow with shell access

### Choosing Between PDFLaTeX and XeLaTeX

**Use XeLaTeX when you need:**
- Unicode text input (Chinese, Arabic, emoji, etc.)
- System fonts (TTF/OTF files)
- Advanced typography features
- Multilingual documents
- Modern font technologies

**Use PDFLaTeX when you need:**
- Maximum compatibility with older packages
- Faster compilation times
- Traditional LaTeX workflow
- Certain packages that don't support XeLaTeX

### Building with Different Engines

```bash
make pdf          # Build with PDFLaTeX
make xelatex      # Build with XeLaTeX
make manual       # Manual PDFLaTeX + BibTeX
make manual-xe    # Manual XeLaTeX + Biber
make watch        # Auto-rebuild with PDFLaTeX
make watch-xe     # Auto-rebuild with XeLaTeX
```

### Viewing PDFs

- Final PDFs are output to the project root directory
- Open with your preferred PDF viewer

### Code Highlighting

For syntax-highlighted code blocks, use the `minted` package:

```latex
\usepackage{minted}

\begin{minted}{python}
def example():
    return "Hello World"
\end{minted}
```

The container includes both regular and shell-escape build recipes for `minted` support.

## Installing Additional LaTeX Packages

The `texlive/texlive:latest` image includes the complete TeXLive distribution with virtually all packages. However, if you need to install additional packages or update existing ones, here are your options:

### Method 1: Using tlmgr (TeXLive Manager) - Recommended

Open a terminal in the container and use `tlmgr`:

```bash
# Update the package database
sudo tlmgr update --self

# Install a specific package
sudo tlmgr install packagename

# Search for packages
tlmgr search packagename

# List installed packages
tlmgr list --installed

# Update all packages
sudo tlmgr update --all
```

### Method 2: Modify the Dockerfile (Permanent)

For packages you always need, add them to the Dockerfile:

```dockerfile
# Add this after the existing RUN commands
RUN tlmgr update --self && \
    tlmgr install packagename1 packagename2 packagename3
```

Then rebuild the container: Command Palette → "Dev Containers: Rebuild Container"

### Method 3: Using postCreateCommand (Semi-permanent)

Add package installation to `devcontainer.json`:

```json
"postCreateCommand": "echo 'LaTeX development environment ready!' && latexmk --version && python3 --version && sudo tlmgr install packagename"
```

### Method 4: Manual Package Installation

For packages not in TeXLive, you can install them manually:

```bash
# Download package files to ~/texmf/tex/latex/packagename/
mkdir -p ~/texmf/tex/latex/packagename
# Copy .sty, .cls files there
# Update the filename database
texhash ~/texmf
```

### Common Package Examples

```bash
# Install additional fonts
sudo tlmgr install fontawesome5

# Install additional math packages
sudo tlmgr install mathtools

# Install additional graphics packages
sudo tlmgr install tikz-3dplot

# Install language support
sudo tlmgr install babel-german

# Install bibliography styles
sudo tlmgr install biblatex-apa
```

### Checking Package Availability

Before installation, check if a package is already available:

```bash
# Check if a package is installed
tlmgr info packagename

# Find which package contains a specific file
tlmgr search --file filename.sty

# List all available packages (very long list)
tlmgr list
```

## File Structure

The project uses an organized directory structure to separate source files from build artifacts:

```
latex-devcontainer/
├── .devcontainer/
│   ├── devcontainer.json    # Container configuration
│   └── Dockerfile          # Custom container definition
├── src/                    # LaTeX source files
│   ├── sample.tex          # PDFLaTeX example document
│   ├── sample-xelatex.tex  # XeLaTeX example document
│   └── [your .tex files]   # Your LaTeX documents go here
├── build/                  # Build artifacts (auto-created)
│   ├── *.aux, *.log, etc.  # Auxiliary files
│   └── [build outputs]     # Temporary build files
├── Makefile               # Command-line build tools
├── README.md              # This file
├── .gitignore             # LaTeX-specific gitignore
└── *.pdf                  # Final PDF outputs (copied from build/)
```

## Project Organization Benefits

- **Clean separation**: Source files in `src/`, build artifacts in `build/`
- **Version control friendly**: Only source files need to be committed
- **Easy cleanup**: Remove `build/` directory to clean all artifacts
- **Multiple documents**: Organize multiple LaTeX projects in `src/`
- **Build isolation**: Build files don't clutter your source directory

## Command Line Usage

The included Makefile provides command-line build options. **Run all commands from the project root directory** (not from `src/`):

```bash
# Basic usage
make                    # Build src/sample.tex (default)
make pdf               # Build with PDFLaTeX
make xelatex           # Build with XeLaTeX

# Build specific documents
make MAIN=mydocument pdf      # Build src/mydocument.tex with PDFLaTeX
make MAIN=mydocument xelatex  # Build src/mydocument.tex with XeLaTeX

# Manual build processes
make manual            # Manual PDFLaTeX + BibTeX workflow
make manual-xe         # Manual XeLaTeX + Biber workflow

# Maintenance
make clean             # Clean build directory and auxiliary files
make cleanall          # Clean everything including PDFs
make list              # List available source files

# Auto-rebuild
make watch             # Watch src/ for changes and rebuild (PDFLaTeX)
make watch-xe          # Watch src/ for changes and rebuild (XeLaTeX)

# Help
make help              # Show detailed help and usage examples
```

### Workflow Example

1. **Create your document**: Put your `.tex` files in the `src/` directory
2. **Build from root**: Run `make MAIN=yourdoc pdf` from the project root
3. **Find your PDF**: The final PDF appears in the project root
4. **Clean up**: Run `make clean` to remove build artifacts

## Troubleshooting

### Build Issues
- Check the LaTeX Workshop output panel for error details
- Ensure all required packages are included in your document
- For `minted` issues, use the shell-escape build recipes
- Verify Python and Pygments are installed (handled automatically in Dockerfile)

### Package Issues
- If a package is missing, use `tlmgr search packagename` to find it
- Some packages may require `sudo` permissions for installation
- After installing packages manually, run `texhash` to update the filename database

### Container Issues
- Rebuild container: Command Palette → "Dev Containers: Rebuild Container"
- Check Docker is running and has sufficient resources
- The first build may take 10-15 minutes due to the large TeXLive image

### Extensions Not Loading
- Reload window: Command Palette → "Developer: Reload Window"
- Check VS Code extensions are enabled in container

## Customization

### Adding LaTeX Packages Permanently
Modify the Dockerfile to include `tlmgr install` commands for packages you always need.

### Changing Build Settings
Modify the `latex-workshop` settings in `devcontainer.json` under `customizations.vscode.settings`.

### Adding VS Code Extensions
Add extension IDs to the `extensions` array in `devcontainer.json`.

### Modifying the Container
Edit the Dockerfile to add additional tools or modify the environment. Rebuild the container after changes.

## Sample Documents

The container includes two sample documents in the `src/` directory:

**`src/sample.tex`** - PDFLaTeX example demonstrating:
- Basic document structure
- Mathematical equations
- Code highlighting with minted
- Lists and formatting

**`src/sample-xelatex.tex`** - XeLaTeX example demonstrating:
- Unicode text input
- System font usage
- Advanced typography features
- Multilingual support
- Font feature access

Compile either to test your environment setup:
```bash
# From project root directory
make MAIN=sample pdf          # Build PDFLaTeX example
make MAIN=sample-xelatex xelatex  # Build XeLaTeX example
```

## Benefits of This Approach

- **Reproducible**: Same environment across all machines
- **Complete**: Full TeXLive distribution with all packages
- **Isolated**: No need to install LaTeX on host system
- **Customizable**: Easy to modify Dockerfile for specific needs
- **Version controlled**: Container configuration is part of your project
- **Package management**: Easy to install additional packages with tlmgr
