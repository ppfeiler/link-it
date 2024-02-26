# Script-Link

## About

Script-Linker is a tool born out of personal necessity, tailored to streamline my scripting workflow. As someone who writes numerous scripts to encapsulate various tasks, I found myself needing a simple way to make these scripts easily accessible, regardless of their location across my system. This tool solves that problem by creating symlinks in `~/.local/bin`, ensuring that all my scripts are just a command away, no matter where they reside.

This project was not only a solution to a practical problem but also a fun and engaging journey into scripting and automation. It stands as a testament to the power of scripting in simplifying and optimizing daily tasks.

## Features

- **Easy Accessibility**: Automatically symlinks your scripts to `~/.local/bin`, making them readily accessible from the command line.
- **Extension Handling**: Removes file extensions from symlinks for cleaner and more consistent command names.
- **Path Management**: Ensures that `~/.local/bin` is in your `PATH`, modifying `.bashrc` if necessary.
- **User-Friendly**: Provides helpful error messages and usage instructions.

## Getting Started

To use Script-Linker, simply clone this repository or download the script.

```bash
git clone https://github.com/ppfeiler/script-linker.git
cd script-linker
```

Ensure the script is executable:

```bash
chmod +x script-link.sh
```

Run the script with the path to your script as the argument:

```bash
./script-link.sh /path/to/your/script
```

## Usage

```bash
Usage: script-link.sh <path_to_script>

Paramter:
  <path_to_script>    The path to the script which should be symlinked to ~/.local/bin

Description:
  Symlink the given script to ~/.local/bin withouth the script extension (if it exists).
  ~/.local/bin will be created if it does not exist. If its not available on the PATH, it will add it and writes to your .bashrc file.
```

- **<path_to_script>**: The absolute or relative path to the script you want to symlink to ~/.local/bin.

## Contributing

This project is open to contributions! If you have suggestions, bug reports, or contributions, please feel free to open an issue or create a pull request. I appreciate any input that helps make this tool more efficient and useful to others.
