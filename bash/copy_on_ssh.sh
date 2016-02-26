SSH_WITHOUT_COPY_ON_SSH=$(type -path ssh 2>/dev/null);

function ssh() {
  # Overrides ssh to rsync all files listed in $list to the remote server before login.
  # Tries very hard to skip this when logging in as another user,
  # but it cannot detect whether an alternate "User" is defined in $HOME/.ssh/config
  # or its /etc equivalent.

  local skip_sync
  local list="$HOME/dotfiles/copy_on_ssh.txt"

  # skip when rsync is missing
  if ! type -f rsync 2>&1 >/dev/null; then
    skip_sync="missing rsync"
  fi

  # skip when our sync list does not exist
  if [ ! -f "$list" ]; then
    skip_sync="$list not found"
  fi

  # skip when ssh options are used to switch to a different user
  while getopts ":1246AaCfgKkMNnqsTtVvXxYyb:c:D:e:F:i:L:l:m:O:o:p:R:S:w:" Option; do
    if [ "$Option" = "l" ]; then
      skip_sync="picked user via ssh options"
      break
    fi
  done

  # skip if we're logging into a different user's account via ssh foo@bar.com
  local server=`eval echo "$"$OPTIND`
  if echo "$server" | grep "@"; then
    skip_sync="picked user via user@"
  fi
  OPTIND=1 # reset $OPTIND so that subsequent invocations work properly

  # skip when manually disabled
  if [ -n "$DISABLE_COPY_ON_SSH" ]; then
    skip_sync="DISABLE_COPY_ON_SSH is set"
  fi

  # do not rsync to the server if it was synced after the local files were last changed
  # only using local commands to avoid server latency
  local last_synced=".copy_on_ssh/$server"
  if [ -z "$skip_sync" ]; then
    mkdir -p "$(dirname "$HOME/$last_synced")"
    local recent=`cd ~ && ls -t "$last_synced" $(find $(cat "$list")) 2> /dev/null | head -n 1`
    if [[ $recent == $last_synced ]]; then
      skip_sync="server is up to date"
    fi
  fi

  # sync
  if [ -z "$skip_sync" ]; then
    rsync -rptgoL --rsh ssh --files-from="$list" "$HOME" "$server":
    touch "$HOME/$last_synced" # mark as synced only on success
  else
    echo "Copy on ssh disabled: $skip_sync"
  fi

  $SSH_WITHOUT_COPY_ON_SSH "$@"
}
