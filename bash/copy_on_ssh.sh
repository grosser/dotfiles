__SSH=$(type -path ssh 2>/dev/null);
function ssh()
{
  # This function overrides ssh to rsync all files listed in $HOME/.briefcase to
  # the remote server before logging in.  It tries very hard to skip this if
  # you're logging in as another user, but it cannot detect whether you have an
  # alternate "User" defined in $HOME/.ssh/config or its /etc equivalent.
  # USE WITH CAUTION!
  local skip_sync;
  if ! type -f rsync 2>&1 >/dev/null; then
    # we don't have rsync.
    skip_sync=1;
  fi
  if [ ! -f "$HOME/.briefcase" ]; then
    skip_sync=1;
  fi
  # skip ssh options to find hostname
  while getopts ":1246AaCfgKkMNnqsTtVvXxYyb:c:D:e:F:i:L:l:m:O:o:p:R:S:w:" Option; do
    if [ "$Option" = "l" ]; then
      # don't sync if we're logging into a different user's account
      skip_sync=1;
      break;
    fi
  done
  server=`eval echo "$"$OPTIND`
  # reset $OPTIND so that subsequent invocations work properly
  OPTIND=1;
  if echo "$server" | grep "@"; then
    # don't sync if we're logging into a different user's account
    skip_sync=1;
  fi
  if [ -z "$skip_sync" -a -z "$DISABLE_BRIEFCASE" ]; then
    rsync -rptgoL --rsh ssh --files-from="$HOME/dotfiles/copy_on_ssh.txt" "$HOME" "$server":
  fi
  $__SSH "$@";
}
