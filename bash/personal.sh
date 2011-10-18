
#Stuff that no-one else need, add and modify here to keep forks clean
alias kj="pkill -f java"
alias kf="pkill -f firefox"
alias da="cd /apps/dawanda/main"
alias rs="cd /apps/rs"
alias r="~/.rbenv/versions/1.9.3-rc1/bin/ruco"
alias m="mine . > /dev/null 2>&1 &"
alias wrake="`which rake` _0.8.7_"
alias pryr="pry -r ./config/environment" # pry as rails console, without pry as dependency
alias video-skype="LD_PRELOAD=/usr/lib/libv4l/v4l1compat.so skype"
alias skype-restart="killall -9 skype && skype &"

function rbenvsudo(){
  executable=$1
  shift 1
  sudo $(rbenv which $executable) $* 
}

function take(){
  mkdir $1;
  cd $1;
}

export GEMEDITOR='mine'
