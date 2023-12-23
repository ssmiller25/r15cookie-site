---
layout: page
title: "Scripting"
meta: "false"
tags: ["devops","ops", "dev"]
---

Captures ad-hoc scripting and process needs.  Also includes resources making these ad-hoc scripts more robust and part of an automation framework.

## Shell

- [Minimally Safe Bash Shell Script Template](https://betterdev.blog/minimal-safe-bash-script-template/)
- [Bash Style Guidelines](https://github.com/progrium/bashstyle)
- [Bash - Using Loops](https://itnext.io/bash-using-loops-for-while-until-with-examples-f519eda7f41b) - Nice example of several looping and conditional structures.
- [Debugging Bash Like a Sire](https://blog.brujordet.no/post/bash/debugging_bash_like_a_sire/): A stacktrace like mechanism for Shell!
- [Gum - Pretty Shellscript Addon](https://github.com/charmbracelet/gum)
- [Testing Shell Scripts/CLI leveraging Go's Testing Framework](https://bitfieldconsulting.com/golang/test-scripts)

## Higher Level

- Python
- [Shell-like Scripting In Go](https://github.com/bitfield/script) - Might be a nice bridge when a shell script gets complex enough that you want to use a more robust langauge, but maintain a lot of "shell-like" features

## Cheatsheet

- Passing variables to curl bash (Example from [coder](https://coder.com/))

  ```sh
  curl -L https://coder.com/install.sh | sh -s -- --version 0.19.2
  ```

## Bash Template

Directly from [Article above](https://gist.github.com/m-radzikowski/53e0b39e9a59a1518990e76c2bff8038), but here for my copy/paste needs.  [MIT licensed](https://gist.github.com/m-radzikowski/d925ac457478db14c2146deadd0020cd).

```sh
#!/usr/bin/env bash

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)


usage() {
  cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-v] [-f] -p param_value arg1 [arg2...]
Script description here.
Available options:
-h, --help      Print this help and exit
-v, --verbose   Print script debug info
-f, --flag      Some flag description
-p, --param     Some param description
EOF
  exit
}

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
  # script cleanup here
}

setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
  else
    NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
  fi
}

msg() {
  echo >&2 -e "${1-}"
}

die() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}

parse_params() {
  # default values of variables set from params
  flag=0
  param=''

  while :; do
    case "${1-}" in
    -h | --help) usage ;;
    -v | --verbose) set -x ;;
    --no-color) NO_COLOR=1 ;;
    -f | --flag) flag=1 ;; # example flag
    -p | --param) # example named parameter
      param="${2-}"
      shift
      ;;
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  args=("$@")

  # check required params and arguments
  [[ -z "${param-}" ]] && die "Missing required parameter: param"
  [[ ${#args[@]} -eq 0 ]] && die "Missing script arguments"

  return 0
}

parse_params "$@"
setup_colors

# script logic here

msg "${RED}Read parameters:${NOFORMAT}"
msg "- flag: ${flag}"
msg "- param: ${param}"
msg "- arguments: ${args[*]-}"
```

## Quick Bash Template

When I don't wnat a ton of boilerplate, and assuming most things coming from command line

```sh
#!/usr/bin/env bash

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
  # script cleanup here
}

# Required first parameter
requireedparam=${1?"Must supply parameters!"}

# Optional value passed from cmdline - 2nd parameter
optionalparam=${2-"defaultvalue}

```
