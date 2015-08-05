#!/bin/sh

[ "$BIN" ] || BIN="$HOME/bin"

# Install executables into BIN.
for file in bin/*; do
  dst_file="$BIN/$(basename "$file")"
  cp -v "$file" "$dst_file"
  chmod -v +x "$dst_file"
done
# 
. ./git_config
. ./git_aliases
# Install "shell_aliases".
cp -v "shell_aliases" "$HOME/.my-git-workflow-aliases"
echo ">>> Add \". ~/.my-git-workflow-aliases\" to your \".bashrc\" (or to"
echo ">>> another shell initialization file)."
