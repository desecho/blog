#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
cd "${DIR}/.."

post_name=$1
post_file_name=${post_name}.md
hugo new "posts/${post_file_name}"
