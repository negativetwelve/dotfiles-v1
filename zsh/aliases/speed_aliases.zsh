alias aliases="cd ~/.yadr/zsh/aliases"
alias y="cd ~/.yadr"
alias yu="cd ~/.yadr && git pull && cd - && ar"

function ypush() {
  echo "$1";
  cd ~/.yadr;
  git add .;
  git commit -m "$1";
  git push;
  cd -;
}

# For tmux attach and creation.
alias tm="tmux attach-session -t pro || tmux new-session -s pro"

if [ `uname` '==' "Linux" ]; then
  # Ubuntu/server specific commands.
  alias ls="ls --color=auto"
  alias tmux="$HOME/local/bin/tmux"
fi
