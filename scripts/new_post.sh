#!/bin/bash

set -eou pipefail

# Make sure that the script is being run from the root of the repository
cd "$(dirname "$0")/.."

post_name=$1
post_file_name=$post_name.md
hugo new "posts/$post_file_name"

