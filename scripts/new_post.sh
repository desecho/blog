#!/bin/bash

set -eou pipefail

# Make sure that the script is being run from the root of the repository
cd "$(dirname "$0")/.."

post_name="$1"
post_file_name="$post_name.md"
hugo new "posts/$post_file_name"
temp_file=$(mktemp)
post_file_path="content/posts/$post_file_name"

# Remove the last 2 lines of the post file
# Value is 3 because it includes the last newline
head -n -3 "$post_file_path" > "$temp_file" && mv "$temp_file" "$post_file_path"

cat >> "$post_file_path" <<- EOM
comments: true
categories: ['']
keywords:
---
EOM
