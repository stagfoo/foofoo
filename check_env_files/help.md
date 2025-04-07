# check_env_files - .env File Checker (⌐■_■)

A utility script to check for .env files in multiple directories.

## Usage

Pipe a list of directories to check:

```bash
find . -type d | check_env_files

```

Or specify directories directly:

```bash
check_env_files path/to/dir1 path/to/dir2
```

## Features

- Recursively checks directories for .env files
