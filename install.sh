#!/usr/bin/env bash
#
# Symlinks all dotfile packages into $HOME using GNU Stow.
#
# Usage:
#   ./install.sh              # stow every package
#   ./install.sh nvim zsh     # stow only the listed packages
#
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${HOME}"

# Packages = every top-level directory except these
EXCLUDE=("archive" ".git")

all_packages=()
for d in "$DOTFILES_DIR"/*/; do
  name="$(basename "$d")"
  skip=false
  for ex in "${EXCLUDE[@]}"; do
    [[ "$name" == "$ex" ]] && skip=true
  done
  $skip || all_packages+=("$name")
done

packages=("$@")
if [ ${#packages[@]} -eq 0 ]; then
  packages=("${all_packages[@]}")
fi

if ! command -v stow >/dev/null 2>&1; then
  echo "GNU Stow is not installed."
  echo "  macOS:  brew install stow"
  echo "  Debian/Ubuntu: sudo apt install stow"
  echo "  Fedora: sudo dnf install stow"
  echo "  Arch:   sudo pacman -S stow"
  exit 1
fi

echo "Dotfiles dir : $DOTFILES_DIR"
echo "Target dir   : $TARGET"
echo "Packages     : ${packages[*]}"
echo

for pkg in "${packages[@]}"; do
  if [ ! -d "$DOTFILES_DIR/$pkg" ]; then
    echo "skip: no such package '$pkg'"
    continue
  fi
  echo "-> stow $pkg"
  stow -v --restow --target="$TARGET" --dir="$DOTFILES_DIR" "$pkg"
done

echo
echo "Done. Run './install.sh -D <package>' equivalent (stow -D) to remove a package's symlinks."
