function flush-dns() {
  sudo killall -HUP mDNSResponder
}

function gen-sks-yk() {
  rm -R ~/.gnupg/private-keys-v1.d
  gpgconf --kill gpg-agent
  gpg --card-status
}

function myip() {
  curl -w '%{stdout}\n' ifconfig.me
}

function showcert() {
  echo | openssl s_client -showcerts -servername $argv[1] -connect $argv[1]:443 2>/dev/null | openssl x509 -inform pem -noout -text
}
