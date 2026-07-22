# checksum

## SYNOPSIS
`checksum` [-o OUTPUT_FILE]

## DESCRIPTION
Generates MD5 checksums for all regular files in the current working directory, including hidden files (those beginning with a dot). Sub-directories are ignored.

The output is written to a tab-separated values (TSV) file with two columns:
1. **MD5 hash** - A 32-character hexadecimal string
2. **Filename** - The relative path from the current directory

## OPTIONS
- `-o, --output OUTPUT_FILE`
    Specify the output filename. Defaults to `checksums.tsv` if not provided.

## EXIT STATUS
- **0** - Success
- **1** - Error (invalid option or missing dependencies)

## DEPENDENCIES
- `md5sum` (GNU coreutils)
- `find`
- `sed`

## EXAMPLES
```
# Basic usage
$ cd /path/to/project
$ checksum

# Custom output file
$ checksum -o verify-me.tsv

# Verify the checksums later
$ md5sum -c checksums.tsv
```

## NOTES
- This script is designed for **Linux/GNU** systems. 
- For macOS, install GNU coreutils: `brew install coreutils`

## SEE ALSO
- `md5sum(1)` - The GNU manual page
- `find(1)` - The find manual page