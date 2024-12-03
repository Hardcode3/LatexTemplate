#!/bin/bash

# This script automates the compilation of a LaTeX document (main.tex)
# using pdflatex, bibtex, and makeindex. It stores build artifacts
# in a specified directory (e.g., "build/") and calculates the total
# compilation time.

# Define the build directory
BUILD_DIR="build"

# Create the build directory if it doesn't exist
mkdir -p "$BUILD_DIR"

# Start timing
start_time=$(date +%s)

# Compile steps with output directory
pdflatex -output-directory="$BUILD_DIR" main.tex
bibtex "$BUILD_DIR/main"
makeindex "$BUILD_DIR/main.idx" -o "$BUILD_DIR/main.ind"
pdflatex -output-directory="$BUILD_DIR" main.tex
pdflatex -output-directory="$BUILD_DIR" main.tex

# End timing
end_time=$(date +%s)

# Calculate execution time
execution_time=$((end_time - start_time))

# Display the result
echo "LaTeX compile time: $execution_time seconds"
echo "Build artifacts stored in: $BUILD_DIR"
