#!/bin/bash
set -eu

source './scripts/functions.sh'

color_dir='colors'

if [ -d "${color_dir}" ]; then
  rm -rf "${color_dir}"
fi
mkdir "${color_dir}"

# nvim
nvim_dir="${color_dir}/nvim/colors"
mkdir -p "${nvim_dir}"
curl -sSf 'https://raw.githubusercontent.com/cocopon/iceberg.vim/master/colors/iceberg.vim' > "${nvim_dir}/iceberg.vim"
_log 'debug' 'Downloaded nvim color'
_link "${nvim_dir}" '.config/nvim/colors'

# Xcode
xcode_dir="${color_dir}/xcode/FontAndColorThemes"
mkdir -p "${xcode_dir}"
curl -sSf 'https://raw.githubusercontent.com/cocopon/xcode-iceberg/master/Iceberg%20(Light).xccolortheme' > "${xcode_dir}/Iceberg (Light).xccolortheme"
curl -sSf 'https://raw.githubusercontent.com/cocopon/xcode-iceberg/master/Iceberg%20(Dark).xccolortheme' > "${xcode_dir}/Iceberg (Dark).xccolortheme"
_log 'debug' 'Downloaded Xcode color'
_link "${xcode_dir}" 'Library/Developer/Xcode/UserData/FontAndColorThemes'

# iTerm2
iterm2_dir="${color_dir}/iterm2"
mkdir -p "${iterm2_dir}"
curl -sSf 'https://raw.githubusercontent.com/YusukeSano/iterm2-iceberg/main/Iceberg.itermcolors' > "${iterm2_dir}/Iceberg.itermcolors"
curl -sSf 'https://raw.githubusercontent.com/YusukeSano/iterm2-iceberg/main/Iceberg%20Light.itermcolors' > "${iterm2_dir}/Iceberg Light.itermcolors"
curl -sSf 'https://raw.githubusercontent.com/YusukeSano/iterm2-iceberg/main/Iceberg%20Dark.itermcolors' > "${iterm2_dir}/Iceberg Dark.itermcolors"
_log 'debug' 'Downloaded iTerm2 color'

# CotEditor
coteditor_dir="${color_dir}/coteditor"
mkdir -p "${coteditor_dir}"
curl -sSf 'https://raw.githubusercontent.com/YusukeSano/coteditor-iceberg/main/Iceberg%20(Light).cottheme' > "${coteditor_dir}/Iceberg (Light).cottheme"
curl -sSf 'https://raw.githubusercontent.com/YusukeSano/coteditor-iceberg/main/Iceberg%20(Dark).cottheme' > "${coteditor_dir}/Iceberg (Dark).cottheme"
_log 'debug' 'Downloaded CotEditor color'

_log 'success' 'Color scheme setup is completed!'
