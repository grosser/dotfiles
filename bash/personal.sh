# Stuff that no-one else need, add and modify here to keep forks clean
alias j="test -e go.mod && goland . || rubymine ."
alias wrake="`which rake`" # rake without bundler
alias wruby="`which ruby`" # ruby without bundler
alias t='testrbl'
alias bi='bundle install'
alias bo='bundle open'
alias bu='bundle update'
alias global-off='sudo mv /Applications/GlobalProtect{,OFF}.app && sudo pkill -9 -f GlobalProtect && sudo pkill -9 -f PanGPS'
alias global-on='sudo mv /Applications/GlobalProtect{OFF,}.app'
alias casper-off='sudo mv /usr/local/jamf/bin/jamfAgent{,-off} ; sudo mv /usr/local/jamf/bin/jamf{,-off} ; sudo pkill -9 jamf'
alias casper-on='sudo mv /usr/local/jamf/bin/jamfAgent{-off,} ; sudo mv /usr/local/jamf/bin/jamf{-off,}'
alias game-on='global-off; casper-off'
alias game-off='global-on; casper-on'
alias dst='docker rm -f $(docker ps -aq) >/dev/null 2>&1 || true' # docker stop
alias s="stern --timezone utc -t --context" # stern with timestamps that match systems time
alias kbadpod="kubectl get pods -A --field-selector status.phase!=Running,status.phase!=Succeeded -L team,project,role --context"
alias each-cluster="~/Code/zendesk/dotfiles_n_scripts/shell_scripts/each-cluster"
alias sshc="~/Code/zendesk/dotfiles_n_scripts/shell_scripts/sshc"
alias review="claude 'check the last commit things to fix/improve/document/simplify'"

# kubectl shortcuts
# - cannot be an alias to make plugins work `ka sandbox edit-status -h`
# - needs $3 at the end to make exec with `--` work
# - needs dash-detection to make `ka sandbox -n foo get pods` work
function k() { if [[ $2 = -* ]]; then kubectl --context "$1" "${@:2}"; else kubectl "$2" --context "$1" "${@:3}"; fi; }
function ka() { if [[ $2 = -* ]]; then kubectl --as admin --as-group system:masters --context "$1" "${@:2}"; else kubectl "$2" --as admin --as-group system:masters --context "$1" "${@:3}"; fi; }

# delete without finalizers (does not support -l, for that use https://github.com/grosser/kubectl-patch-all)
function kdelf() {
  kubectl patch --as admin --as-group system:masters --patch '{"metadata":{"finalizers":null}}' --type merge --context "$@" && \
  kubectl delete --as admin --as-group system:masters  --context "$@"
}

# ns can be stuck with spec.finalizers and a regular patch can't remove them
function kdelns() {
  kubectl get --as admin --as-group system:masters --context "$1" namespace "$2" -ojson | jq '.spec.finalizers = []' | kubectl replace --as admin --as-group system:masters --context "$1" --raw "/api/v1/namespaces/$2/finalize" -f -
}

function kubeletconfig() {
    ka $1 get --raw "/api/v1/nodes/$2/proxy/configz" | jq .
}

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

export BUNDLER_EDITOR=rubymine
export GEM_EDITOR=rubymine

# prevent kubectl mistakes
kubectl config use-context docker-desktop >/dev/null
