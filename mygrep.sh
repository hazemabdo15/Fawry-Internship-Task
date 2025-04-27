#!/usr/bin/env bash

usage() {
  echo "Usage: $0 [-n] [-v] SEARCH_STRING FILE" >&2
  echo "  -n   Show line numbers for each match" >&2
  echo "  -v   Invert the match (print non-matching lines)" >&2
  echo "  --help  Display this help message" >&2
  exit 1
}

show_numbers=false
invert=false

while [[ "$1" =~ ^- ]] && [[ -n "$1" ]]; do
  case "$1" in
    -n)
      show_numbers=true
      shift
      ;;
    -v)
      invert=true
      shift
      ;;
    -nv|-vn)
      show_numbers=true
      invert=true
      shift
      ;;
    --help)
      usage
      ;;
    *)
      echo "Invalid option: $1" >&2
      usage
      ;;
  esac
done

if [[ $# -lt 2 ]]; then
  echo "Error: Missing search string or file." >&2
  usage
fi

pattern="$1"
file="$2"

if [[ ! -f "$file" ]]; then
  echo "Error: File '$file' not found." >&2
  exit 2
fi

args=()
$invert && args+=("-v")
show_numbers && args+=("-n")
args+=("-i")
args+=("--")
args+=("$pattern")
args+=("$file")

grep "${args[@]}"
