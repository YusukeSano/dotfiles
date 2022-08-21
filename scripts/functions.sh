#!/bin/bash
set -eu

reset='\033[0m'
error='\033[0;31m'
success='\033[0;32m'
debug='\033[0;35m'
info='\033[0;36m'

function _log() {
  case "${1}" in
    'error')
      echo -e "${error}${2}${reset}" ;;
    'success')
      echo -e "${success}${2}${reset}" ;;
    'debug')
      echo -e "${debug}${2}${reset}" ;;
    'info')
      echo -e "${info}${2}${reset}" ;;
    *)
      echo -e "${error}_log: Invalid argument '${1}'${reset}"
      exit 1 ;;
  esac
}

function _link() {
  source="$(pwd)/${1}"
  if [ ! -e "${source}" ]; then
    _log 'error' "${source}: No such file or directory"
    exit 1
  fi

  if [ "${#}" -eq '1' ]; then
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
      status='0'
      diff -rq "${source}" "${target}" > /dev/null || status="${?}"
      case "${status}" in
        '0')
          if [ -L "${target}" ]; then
            _log 'debug' "./${1} -> ~/${target_base}: Symbolic link exists"
            return
          elif [ -d "${target}" ]; then
            rm -r "${target}"
          fi ;;
        '1')
          _log 'error' "${target}: File exists"
          exit 1 ;;
        *)
          exit 1 ;;
      esac
    fi
  fi

  echo -en "${info}"
  ln -snvf "${source}" "${target}"
  echo -en "${reset}"
}
