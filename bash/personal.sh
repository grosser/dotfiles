
#Stuff that no-one else need, add and modify here to keep forks clean
alias kj="pkill -f java"
alias kf="pkill -f firefox"
alias da="cd /apps/dawanda/main"
alias rs="cd /apps/rs"
alias m="mine . > /dev/null 2>&1 &"
alias wrake="`which rake` _0.8.7_"
alias pryr="pry -r ./config/environment -r rails/console/app -r rails/console/helpers" # pry as rails console, without pry as dependency
alias r="rvm 1.9.3 exec ruco"
alias skype-restart="killall -9 skype && video-skype"

function take(){
  mkdir $1;
  cd $1;
}

function pdf-decrypt(){
  qpdf --decrypt $1 $1.tmp && mv -f $1.tmp $1
}

function shredrm(){
 find $1 -type f | xargs shred && rm -rf $1
}

export GEMEDITOR='mine'
