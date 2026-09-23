cask "dojo" do
  version "1.0.0"
  sha256 "c928aae22506b93c40b2561979a50d6d9b70f55e4a6259dd2dd2ccbb8ba10e40"

  url "https://github.com/yask123/nvim-macos/archive/refs/tags/v#{version}.tar.gz"
  name "Dojo"
  desc "Quiet code editor built on Neovim"
  homepage "https://yask.dev/dojo"

  # Dojo keeps itself up to date with `nvim-update`; a cask upgrade would
  # reinstall from scratch, so Homebrew leaves it alone unless asked.
  auto_updates true
  depends_on cask: %w[
    font-monaspice-nerd-font
    neovide-app
  ]
  depends_on formula: %w[
    fd
    fzf
    git
    lazygit
    lua
    neovim
    node
    python
    ripgrep
    tree-sitter-cli
  ]
  depends_on macos: :ventura

  # Installs the config to ~/.config/nvim (backing up any existing one),
  # restores the pinned plugins, and builds ~/Applications/Dojo.app.
  installer script: {
    executable: "nvim-macos-#{version}/install.sh",
    args:       ["--skip-brew", "--ref", "v#{version}"],
  }

  # Moves the Neovim config, plugins and state to a recoverable backup under
  # ~/.local/state/nvim-bootstrap/uninstalled/ and removes Dojo.app.
  uninstall script: {
    executable: "nvim-macos-#{version}/scripts/uninstall.sh",
  }

  caveats <<~EOS
    Open Dojo from Spotlight, or run: dojo <folder>
    Any previous Neovim setup was moved to ~/.local/state/nvim-bootstrap/backups/.
    Update later with: nvim-update
  EOS
end
