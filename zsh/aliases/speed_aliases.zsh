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

