# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Create pipenv venv in project directory
export PIPENV_VENV_IN_PROJECT=true

# Attach to a tmux session if it's installed
# TODO: Deduplicate from .bash_profile
if command -v tmux &> /dev/null
then
	[[ $TERM != "screen" ]] && exec tmux new-session -A -s main
fi

# -------- End of intended content --------
