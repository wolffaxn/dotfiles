# ~/.config/zsh/function.zsh

function dsx() {
  find . -name "*.DS_Store" -type f -delete
}

function flush-dns() {
  sudo killall -HUP mDNSResponder
}

function fname() {
  find . -iname "*$@*"
}

function gen-sks-yk() {
  rm -R ~/.gnupg/private-keys-v1.d
  gpgconf --kill gpg-agent
  gpg --card-status
}

function mkcd() {
  mkdir $1 && cd $1
}

function myip() {
  curl -w "%{stdout}\n" ifconfig.me
}

function randpw() {
  openssl rand -base64 4 | md5 | head -c$1 ; echo
}

function showcert() {
  echo | openssl s_client -showcerts -servername $argv[1] -connect $argv[1]:443 2>/dev/null | openssl x509 -inform pem -noout -text
}
