cask "dojo" do
  version "1.1.0"
  sha256 "9d7f62442059c0a39e2c41d80259008053d1dd2e30abfd6be2e6b2747edcef6d"

  url "https://github.com/yask123/nvim-macos/archive/refs/tags/v#{version}.tar.gz"
  name "Code"
  name "Dojo"
  desc "Quiet code editor built on Neovim, now called Code"
  homepage "https://yask.dev/code"

  # The app is called Code now, and its cask lives in yask123/tap. This one
  # still installs the same thing, so old instructions keep working.
  deprecate! date: "2026-11-19", because: "is now called Code", replacement_cask: "yask123/tap/code"

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

  # Installs the editor to ~/.config/nvim, restores the pinned plugins and
  # builds ~/Applications/Code.app (an old Dojo.app is removed).
  installer script: {
    executable: "nvim-macos-#{version}/install.sh",
    args:       ["--skip-brew", "--ref", "v#{version}"],
  }

  # Moves the Neovim config, plugins and state to a recoverable backup under
  # ~/.local/state/nvim-bootstrap/uninstalled/ and removes the app.
  uninstall script: {
    executable: "nvim-macos-#{version}/scripts/uninstall.sh",
  }

  caveats <<~EOS
    Dojo is now called Code. Open Code from Spotlight.
    New installs: brew install yask123/tap/code
    Update later with: nvim-update
  EOS
end
