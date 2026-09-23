# Dojo for Homebrew

[Dojo](https://yask.dev/dojo) is a quiet code editor for macOS, built on Neovim.

```bash
brew install --cask yask123/dojo/dojo
```

This installs Neovim, Neovide and the Monaspice font, sets up the config in
`~/.config/nvim` (any existing one is backed up first), and builds
`~/Applications/Dojo.app`. Update with `nvim-update`; remove with
`brew uninstall --cask dojo` (your Neovim files are moved to a recoverable
backup, not deleted).

Already have Neovide or the Monaspice font installed by hand? Let Homebrew take
them over first:

```bash
brew install --cask --adopt neovide-app font-monaspice-nerd-font
```

Source: [yask123/nvim-macos](https://github.com/yask123/nvim-macos).
