#!/bin/bash

set -eu

reset="\033[0m"
error="\033[0;31m"
info="\033[0;36m"
success="\033[0;32m"
debug="\033[0;35m"

color_dir="$(pwd)/colors"

if [ -d "${color_dir}" ]; then
  rm -rf "${color_dir}"
fi
mkdir -p "${color_dir}"

# nvim
nvim_dir="${color_dir}/nvim/colors"
mkdir -p "${nvim_dir}"
curl -sSf "https://raw.githubusercontent.com/cocopon/iceberg.vim/master/colors/iceberg.vim" > "${nvim_dir}/iceberg.vim"
echo -e "${debug}Downloaded nvim color${reset}"

echo -en "${info}"
ln -snvf "${nvim_dir}" "$(pwd)/config/nvim/colors"
echo -en "${reset}"

# Xcode
xcode_dir="${color_dir}/xcode/FontAndColorThemes"
mkdir -p "${xcode_dir}"
curl -sSf "https://raw.githubusercontent.com/cocopon/xcode-iceberg/master/Iceberg%20(Light).xccolortheme" > "${xcode_dir}/Iceberg (Light).xccolortheme"
curl -sSf "https://raw.githubusercontent.com/cocopon/xcode-iceberg/master/Iceberg%20(Dark).xccolortheme" > "${xcode_dir}/Iceberg (Dark).xccolortheme"
echo -e "${debug}Downloaded Xcode color${reset}"

echo -en "${info}"
ln -snvf "${xcode_dir}" "${HOME}/Library/Developer/Xcode/UserData/FontAndColorThemes"
echo -en "${reset}"

# iTerm2
iterm2_dir="${color_dir}/iterm2"
mkdir -p "${iterm2_dir}"
curl -sSf "https://raw.githubusercontent.com/YusukeSano/iterm2-iceberg/main/Iceberg.itermcolors" > "${iterm2_dir}/Iceberg.itermcolors"
curl -sSf "https://raw.githubusercontent.com/YusukeSano/iterm2-iceberg/main/Iceberg%20Light.itermcolors" > "${iterm2_dir}/Iceberg Light.itermcolors"
curl -sSf "https://raw.githubusercontent.com/YusukeSano/iterm2-iceberg/main/Iceberg%20Dark.itermcolors" > "${iterm2_dir}/Iceberg Dark.itermcolors"
echo -e "${debug}Downloaded iTerm2 color${reset}"

# CotEditor
coteditor_dir="${color_dir}/coteditor"
mkdir -p "${coteditor_dir}"
curl -sSf "https://raw.githubusercontent.com/YusukeSano/coteditor-iceberg/main/Iceberg%20(Light).cottheme" > "${coteditor_dir}/Iceberg (Light).cottheme"
curl -sSf "https://raw.githubusercontent.com/YusukeSano/coteditor-iceberg/main/Iceberg%20(Dark).cottheme" > "${coteditor_dir}/Iceberg (Dark).cottheme"
echo -e "${debug}Downloaded CotEditor color${reset}"

echo -e "${success}Color scheme setup is completed!${reset}"
