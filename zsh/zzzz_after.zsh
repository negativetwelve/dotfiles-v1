# Load any custom after code
if [ -d $HOME/.zsh.after/ ]; then
  if [ "$(ls -A $HOME/.zsh.after/)" ]; then
    for config_file ($HOME/.zsh.after/*.zsh) source $config_file
  fi
fi

# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
  rm -f /tmp/ssh-agent-$USER-screen
  ln -sf $SSH_AUTH_SOCK $SOCK
  export SSH_AUTH_SOCK=$SOCK
fi

source ~/.yadr/zsh/zsh-func.zsh

# For autojump and j to load, we need to initialize the scripts.
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

PATH="$HOME/.rvm/bin:$PATH:/usr/local/share/npm/bin:~/npm/bin"

# Turn off auto cd so that we can run executables.
unsetopt AUTO_CD

# Postgres
export PGHOST=localhost
export PGDATA=/usr/local/var/postgres

# Editor
export EDITOR=subl

