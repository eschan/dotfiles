# dotfiles

My macOS dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What's included

| Package | Config | Description |
|---------|--------|-------------|
| `zsh` | `.zshrc`, `.zprofile` | Shell config with [zinit](https://github.com/zdharma-continuum/zinit) plugin manager |
| `ghostty` | `.config/ghostty/config` | [Ghostty](https://ghostty.org/) terminal emulator settings |
| `starship` | `.config/starship/starship.toml` | [Starship](https://starship.rs/) cross-shell prompt |
| `git` | `.config/git/ignore` | Global git ignore patterns |

## How it works

Each top-level directory is a stow "package". Stow creates symlinks from `$HOME` into this repo by mirroring the directory structure inside each package.

```
Symlink                              ->  Target in repo
~/.zshrc                             ->  zsh/.zshrc
~/.zprofile                          ->  zsh/.zprofile
~/.config/ghostty/config             ->  ghostty/.config/ghostty/config
~/.config/starship/starship.toml     ->  starship/.config/starship/starship.toml
~/.config/git/ignore                 ->  git/.config/git/ignore
```

Configs that live in `~/.config/` have a nested `.config/` path in the repo so stow knows where to place the symlink.

## Zsh plugins

Managed by [zinit](https://github.com/zdharma-continuum/zinit) (auto-installs on first shell launch):

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) — fish-like inline suggestions from history
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) — command highlighting as you type
- [zsh-completions](https://github.com/zsh-users/zsh-completions) — additional tab completion definitions
- [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search) — type a partial command, then up/down arrow to search history

## Setup

### Fresh machine

```bash
git clone <repo-url> ~/Developer/eschan/dotfiles
cd ~/Developer/eschan/dotfiles
./install.sh
```

The bootstrap script installs Xcode CLT, Homebrew, stow, starship, ghostty, and JetBrains Mono Nerd Font, then links everything.

### Manual linking

```bash
cd ~/Developer/eschan/dotfiles
stow -t ~ zsh ghostty starship git
```

### Unlinking

```bash
stow -t ~ -D zsh ghostty starship git
```
