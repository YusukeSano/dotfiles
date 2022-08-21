#!/bin/bash
set -eu

source './scripts/functions.sh'

_link 'config/git/.gitconfig'
_link 'config/homebrew/.Brewfile'
_link 'config/nvim' '.config/nvim'
_link 'config/sheldon/plugins.toml' '.sheldon/plugins.toml'
_link 'config/starship/starship.toml' '.config/starship.toml'
_link 'config/vscode/settings.json' 'Library/Application Support/Code/User/settings.json'
_link 'config/zsh/.zprofile'
_link 'config/zsh/.zshrc'

_log 'success' 'Symbolic link creation is completed!'
