### TODO on a new intall
1. [Hack nerd font](https://www.nerdfonts.com/font-downloads)
1. [Ripgrep](https://github.com/BurntSushi/ripgrep#installation)
1. Install packer: `git clone --depth 1 https://github.com/wbthomason/packer.nvim  ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
1. `:PackerInstall`
1. `./lazygit/install_config.bash`
1. `./vsnip/install_snippets.bash`
1. `dotnet tool install --global csharp-ls`
1. `npm install --global cssmodules-language-server`
1. `npm install --global vscode-langservers-extracted`

### Updating configurations
1. Updating LazyGit `./lazygit/update_config.bash`
1. Updating snippets `./vsnip/update_snippets.bash`

## Okular
`Settings` -> `Configure Okular` -> `Editor` -> `Custom Text Editor` -> `nvim --headless -c "VimtexInverseSearch %l '%f'"`
