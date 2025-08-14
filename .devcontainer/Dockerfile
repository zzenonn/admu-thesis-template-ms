# Use the official TeXLive image as base
FROM texlive/texlive:latest

# Set timezone to UTC+8 (Asia/Shanghai)
ENV TZ=Asia/Shanghai

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install additional system dependencies
RUN apt-get update && apt-get install -y \
    # Python for pygments (minted package support)
    python3 \
    python3-pip \
    python3-pygments \
    # Additional utilities
    curl \
    wget \
    git \
    unzip \
    # Image processing tools
    ghostscript \
    imagemagick \
    # Clean up
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install additional Python packages that might be useful for LaTeX
# Using --break-system-packages is safe in Docker containers
RUN pip3 install --no-cache-dir --break-system-packages \
    pygments \
    matplotlib \
    numpy \
    pillow \
    seaborn \
    pandas \
    scipy

# Set up timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Configure ImageMagick policy for better PDF handling
RUN sed -i 's/rights="none" pattern="PDF"/rights="read|write" pattern="PDF"/' /etc/ImageMagick-6/policy.xml || true

# Set working directory
WORKDIR /workspace

# Default command
CMD ["/bin/bash"]
