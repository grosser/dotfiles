export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

function rbenvsudo(){
  executable=$1
  shift 1
  sudo $(rbenv which $executable) $* 
}

alias rbsudo="rbenvsudo"