reset-postgres(){
  rm -rf /usr/local/var/postgres
  sudo sysctl -w kern.sysv.shmall=65536
  sudo sysctl -w kern.sysv.shmmax=16777216
  initdb /usr/local/var/postgres -E utf8
  sleep 2
  launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
  cp /usr/local/Cellar/postgresql/9.2.4/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/
  launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
  psql template1 -c 'create extension hstore;'
  sleep 3
  createdb coursesharing_development
}

