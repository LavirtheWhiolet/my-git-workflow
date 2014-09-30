#!/bin/sh

# Install "git-*".
BIN="$HOME/bin"
ls -1 git-* | xargs -d "\n" -I '{}' sh -c "cp \"{}\" \"$BIN\" && chmod +x \"$BIN/{}\""
# Install "config.sh".
exec sh config.sh
