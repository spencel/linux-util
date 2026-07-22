#!/usr/bin/env bash

show_help() {
    cat << EOF
Usage: checksum [OPTIONS]

Generates MD5 checksums for all files in the current directory.

Output:
  Creates a TSV file (checksums.tsv) with two columns:
    - MD5 hash (32 hex characters)
    - Filename

Options:
  -h, --help     Show this help message
  -o, --output   Specify output file (default: checksums.tsv)

Examples:
  checksum                    # Creates checksums.tsv
  checksum -o my-checksums.tsv   # Creates my-checksums.tsv

Note: Hidden files (.bashrc, .gitignore, etc.) are included.
      Sub-directories are ignored.
EOF
}

# Parse arguments
OUTPUT_FILE="checksums.tsv"
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -o|--output)
            OUTPUT_FILE="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            echo "Use -h or --help for usage information."
            exit 1
            ;;
    esac
done

# Main script
find . -maxdepth 1 -type f -exec md5sum {} + | sed 's/  \.\//	/' > "$OUTPUT_FILE"
echo "MD5 checksums written to: $OUTPUT_FILE"