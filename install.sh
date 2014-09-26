BIN="$HOME/bin"
ls -1 git-* | xargs -d "\n" -I '{}' sh -c "cp \"{}\" \"$BIN\" && chmod +x \"$BIN/{}\""
