#!/bin/bash

set -eu

reset="\033[0m"
error="\033[0;31m"
info="\033[0;36m"
success="\033[0;32m"
debug="\033[0;35m"

function link() {
  source="$(pwd)/config/${1}"
  if [ ! -e "${source}" ]; then
    echo -e "${error}${source}: No such file or directory${reset}"
    exit 1
  fi

  if [ "${#}" -eq "1" ]; then
    target_base=$(basename "${source}")
  else
    target_base="${2}"
  fi
  target="${HOME}/${target_base}"
  target_dir=$(dirname "${target}")
  if [ ! -d "${target_dir}" ]; then
    mkdir -p "${target_dir}"
  else
    if [ -e "${target}" ]; then
      status="0"
      diff -rq "${source}" "${target}" > /dev/null || status="${?}"
      case "${status}" in
        "0")
          if [ -L "${target}" ]; then
            echo -e "${debug}config/${1} -> ~/${target_base}: Symbolic link exists${reset}"
            return
          elif [ -d "${target}" ]; then
            rm -r "${target}"
          fi
          ;;
        "1")
          echo -e "${error}${target}: File exists${reset}"
          exit 1
          ;;
        *)
          exit1
          ;;
      esac
    fi
  fi

  echo -en "${info}"
  ln -snvf "${source}" "${target}"
  echo -en "${reset}"
}

link "git/.gitconfig"
link "homebrew/.Brewfile"
link "nvim" ".config/nvim"
link "sheldon/plugins.toml" ".sheldon/plugins.toml"
link "starship/starship.toml" ".config/starship.toml"
link "vscode/settings.json" "Library/Application Support/Code/User/settings.json"
link "zsh/.zprofile"
link "zsh/.zshrc"

echo -e "${success}Symbolic link creation is completed!${reset}"
