# Stuff that no-one else need, add and modify here to keep forks clean
alias m="mine ."
alias wrake="`which rake`" # rake without bundler
alias wruby="`which ruby`" # ruby without bundler
alias pryr="pry -r ./config/environment -r rails/console/app -r rails/console/helpers" # pry as rails console, without pry as dependency
alias t='testrbl'
alias bo='bundle open'
alias bu='bundle update'
alias global-off='sudo mv /Applications/GlobalProtect{,OFF}.app && sudo pkill -9 -f GlobalProtect && sudo pkill -9 -f PanGPS'
alias global-on='sudo mv /Applications/GlobalProtect{OFF,}.app'
alias casper-off='sudo mv /usr/local/jamf/bin/jamfAgent{,-off} ; sudo mv /usr/local/jamf/bin/jamf{,-off} ; sudo pkill -9 jamf'
alias casper-on='sudo mv /usr/local/jamf/bin/jamfAgent{-off,} ; sudo mv /usr/local/jamf/bin/jamf{-off,}'
alias game-on='global-off; casper-off'
alias game-off='global-on; casper-on'
alias dst='docker rm -f $(docker ps -aq) >/dev/null 2>&1 || true'
alias s="stern --timezone utc -t --context"
alias kbadpod="kubectl get pods -A --field-selector status.phase!=Running,status.phase!=Succeeded -L team,project,role --context"

# - cannot be an alias to make plugins work `ka sandbox edit-status -h`
# - needs $3 at the end to make exec with `--` work
# - needs dash-detection to make `ka sandbox -n foo get pods` work
function k() { if [[ $2 = -* ]]; then kubectl --context "$1" "${@:2}"; else kubectl "$2" --context "$1" "${@:3}"; fi; }
function ka() { if [[ $2 = -* ]]; then kubectl --as admin --as-group system:masters --context "$1" "${@:2}"; else kubectl "$2" --as admin --as-group system:masters --context "$1" "${@:3}"; fi; }

function take(){
  mkdir "$1"
  cd "$1" || exit
}

function pdf-decrypt(){
  qpdf --decrypt "$1" "$1".tmp && mv -f "$1.tmp" "$1"
}

function kbadpdb(){
  kubectl get pdb -A -o json --context $1 | jq '.items | map(select(.status.disruptionsAllowed == 0)) | map(select(.status.desiredHealthy != 0))' | jq -r '.[] | "\(.metadata.namespace)\t\(.metadata.name)\t\(.status.currentHealthy)/\(.status.expectedPods)\tteam:\(.metadata.labels.team)"'
}

export BUNDLER_EDITOR=mine
export GEM_EDITOR=mine
