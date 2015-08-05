#!/bin/sh

[ "$BIN" ] || BIN="$HOME/bin"

# Install "git-*" into BIN.
for file in git-*; do
  file="$(basename "$file")"
  cp -v "$file" "$BIN/$file"
  chmod -v +x "$BIN/$file"
done
# 
. ./git_config
. ./git_aliases
# Install "shell_aliases".
cp -v "shell_aliases" "$HOME/.my-git-workflow-aliases"
echo ">>> Add \". ~/.my-git-workflow-aliases\" to your \".bashrc\" (or to"
echo ">>> another shell initialization file)."
