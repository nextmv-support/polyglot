#!/bin/bash

set -euo pipefail

# Determine architecture
ARCH=${ARCH:-arm64}

# Change to the script's directory
cd "$(dirname "$0")"
# Download the repository (only if not already downloaded)
REPO_FILE=repo.zip
REPO_DIR=sardine-can-main  # GH naming convention for main branch zip downloads
if [ ! -d "$REPO_DIR" ]; then
    # Download the repository as a zip file
    echo "Downloading sardine-can repository..."
    wget https://github.com/merschformann/sardine-can/archive/refs/heads/main.zip -O "$REPO_FILE"
    # Unzip the file
    unzip "$REPO_FILE"
else
    echo "Skipping sardine-can download, $REPO_DIR already exists."
fi

# Navigate to the directory
cd "$REPO_DIR"
docker run --rm -v "$PWD":/app -w /app mcr.microsoft.com/dotnet/sdk:8.0 bash -c "
    cd SC.CLI/ &&
    dotnet publish --os linux --arch $ARCH --self-contained
"
cp -v SC.CLI/bin/Release/net8.0/linux-arm64/publish/SC.CLI ../../main
