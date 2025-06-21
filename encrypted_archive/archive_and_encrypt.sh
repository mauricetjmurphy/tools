#!/bin/bash

# Check if a directory was provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory_to_compress>"
    exit 1
fi

# Input directory to archive
DIR="$1"

# Resolve the path to the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTDIR="$SCRIPT_DIR/output"

# Ensure the output directory exists
mkdir -p "$OUTDIR"

ARCHIVE_NAME="$(basename "$DIR").tar.gz"
ARCHIVE_PATH="$OUTDIR/$ARCHIVE_NAME"

# Step 1: Create a tar.gz archive in the output directory
tar -czf "$ARCHIVE_PATH" "$DIR"
if [ $? -ne 0 ]; then
    echo "Error creating archive"
    exit 2
fi
echo "Created archive: $ARCHIVE_PATH"

# Step 2: Encrypt the archive with a password (symmetric encryption)
gpg --symmetric --output "$ARCHIVE_PATH.gpg" "$ARCHIVE_PATH"
if [ $? -ne 0 ]; then
    echo "Error encrypting archive"
    exit 3
fi
echo "Encrypted archive: $ARCHIVE_PATH.gpg"

# Step 3: Remove the unencrypted archive
rm "$ARCHIVE_PATH"
