# .dotfiles

My personal dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/)
so the same repo works on macOS and Linux.

## How it's organized

Each top-level folder is a **stow package**. Inside a package, the path
mirrors exactly where it should end up under `$HOME`. For example:

```
nvim/.config/nvim/init.lua   ->  symlinked to  ~/.config/nvim/init.lua
zsh/.zshrc                   ->  symlinked to  ~/.zshrc
tmux/.tmux.conf              ->  symlinked to  ~/.tmux.conf
```

Packages in this repo:

| Package       | Ends up at              |
|---------------|--------------------------|
| `zsh`         | `~/.zshrc`               |
| `tmux`        | `~/.tmux.conf`           |
| `nvim`        | `~/.config/nvim`         |
| `kitty`       | `~/.config/kitty`        |
| `ghostty`     | `~/.config/ghostty`      |
| `linearmouse` | `~/.config/linearmouse`  |
| `skhd`        | `~/.config/skhd`         |
| `yabai`       | `~/.config/yabai`        |

`archive/` holds old/retired configs (e.g. `nvim.old`) — not a stow package,
kept only for reference.

## Install

1. Install GNU Stow:
   ```bash
   # macOS
   brew install stow
   # Debian / Ubuntu
   sudo apt install stow
   # Fedora
   sudo dnf install stow
   # Arch
   sudo pacman -S stow
   ```

2. Clone this repo (anywhere, e.g. `~/.dotfiles`):
   ```bash
   git clone https://github.com/Mirhajian/.dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

3. Symlink everything:
   ```bash
   ./install.sh
   ```

   Or only specific packages (useful on a machine that doesn't need yabai/skhd,
   e.g. Linux):
   ```bash
   ./install.sh zsh tmux nvim kitty
   ```

If a real file already exists where a symlink needs to go (e.g. an existing
`~/.zshrc`), stow will refuse and tell you — back it up or remove it, then
rerun.

## Remove a package's symlinks

```bash
stow -D --target="$HOME" --dir="$(pwd)" nvim
```

## Add a new package

```bash
mkdir -p newtool/.config/newtool
mv ~/.config/newtool/* newtool/.config/newtool/
./install.sh newtool
```
