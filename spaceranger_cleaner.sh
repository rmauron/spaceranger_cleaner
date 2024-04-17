#!/bin/bash

######################################################
# Date: 2024/04/16
# Author: Raphael Mauron
# Contact: raphael.mauron@scilifelab.se
######################################################

# Define usage message
usage() {
    echo "Usage: $0 [OPTIONS] <directory1> [<directory2> ...]"
    echo "OPTIONS:"
    echo "  -k, --keep FILE        Keep an extra FILE during cleanup (can be specified multiple times)"
    exit 1
}

# Define the files and directories to keep
KEEP=(
    "filtered_feature_bc_matrix.h5"
    "raw_feature_bc_matrix.h5"    
    "web_summary.html"
    "spatial"
    "aligned_fiducials.jpg"
    "detected_tissue_image.jpg"
    "scalefactors_json.json"
    "spatial_enrichment.csv"
    "tissue_hires_image.png"
    "tissue_lowres_image.png"
    "tissue_positions.csv"
)

# Process options
while [[ $# -gt 0 ]]; do
    case "$1" in
        -k|--keep)
            shift
            KEEP+=("$1")
            ;;
        *)
            break
            ;;
    esac
    shift
done

# Check if at least one directory name is provided as an argument
if [ $# -eq 0 ]; then
    usage
fi

# Function to recursively remove unwanted files and directories
cleanup() {
    local dir=$1
    for item in "$dir"/*; do
        if [[ -d "$item" ]]; then
            if [[ ! "${KEEP[@]}" =~ "${item##*/}" ]]; then
                echo "Removing directory: $item"
                rm -rf "$item"
            else
                cleanup "$item"
            fi
        elif [[ -f "$item" ]]; then
            if [[ ! "${KEEP[@]}" =~ "${item##*/}" ]]; then
                echo "Removing file: $item"
                rm "$item"
            fi
        fi
    done
}

# Process each directory provided as an argument
for dir in "$@"; do
    # Check if the directory exists
    if [ ! -d "$dir" ]; then
        echo "Directory '$dir' not found."
        continue
    fi

    # Move files from 'outs' subdirectory to the parent directory
    if [ -d "$dir/outs" ]; then
        mv "$dir/outs"/* "$dir" && rm -rf "$dir/outs"
    fi

    # Remove the 'filtered_feature_bc_matrix' directory
    if [ -d "$dir/filtered_feature_bc_matrix" ]; then
        rm -rf "$dir/filtered_feature_bc_matrix"
    fi

    # Remove the 'raw_feature_bc_matrix' directory
    if [ -d "$dir/raw_feature_bc_matrix" ]; then
        rm -rf "$dir/raw_feature_bc_matrix"
    fi

    # Start cleanup from the specified directory
    cleanup "$dir"

    echo "Cleanup completed for '$dir'."
done

