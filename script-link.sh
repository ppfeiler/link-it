#!/bin/bash

readonly BIN_DIR="$HOME/.local/bin"

function main() {
  if [[ $EUID -eq 0 ]]; then
      error "This script should not be run as root or with sudo. Please run as a regular user."
      exit 1
  fi

  if [[ $# -eq 0 ]] || [[ $1 == "--help" ]]; then
    print_help
    exit 1
  fi

  if [[ ! -d $BIN_DIR ]]; then
    echo "$BIN_DIR does not exist. Creating it now..."
    mkdir -p "$BIN_DIR"
  fi

  if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
    echo "$BIN_DIR is not in PATH. Adding it now..."

    export PATH="$PATH:$BIN_DIR"
    echo "export PATH=\"\$PATH:$BIN_DIR\"" >> ~/.bashrc
  fi

  local file_path=$(realpath "$1")

  if [ ! -f "$file_path" ]; then
      error "The file does not exist."
      exit 1
  fi

  local filename=$(basename -- "$file_path")
  local filename_without_ext="${filename%.*}"

  ln -sf "$file_path" "$BIN_DIR/$filename_without_ext"

  if [[ ! -x "$BIN_DIR/$filename_without_ext" ]]; then
    echo "Symlink is not executable. Making it executable..."
    chmod +x "$BIN_DIR/$filename_without_ext"
  fi

  echo "Symlink created for $filename at $BIN_DIR/$filename_without_ext"
}

function print_help() {
  echo "Usage: script-link.sh <path_to_script>"
  echo ""
  echo "Paramter:"
  echo "  <path_to_script>    The absolute or relative path to the script you want to symlink to ~/.local/bin."
  echo ""
  echo "Description:"
  echo "  Symlink the given script to ~/.local/bin withouth the script extension (if it exists)."
  echo "  ~/.local/bin will be created if it does not exist. If its not available on the PATH, it will add it and writes to your .bashrc file."
}

function error() {
  local error_message=$1
  echo -e "\e[91m\e[1mError: ${error_message}\e[0m" >&2
}

main "$@"
