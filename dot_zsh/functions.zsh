
function zssh {
  ssh "$@" -t zsh
}

function hgrep {
  history | egrep --color=auto --recursive "$@" | egrep --color=auto --recursive -v "hgrep $@"
}

function keyhash {
  keytool -exportcert -keystore $1 -alias $2 | openssl sha1 -binary | openssl base64
}

function jdk {
  version=$1
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
  java -version
 }

function man {
  env LESS_TERMCAP_mb=$'\E[01;31m' \
  LESS_TERMCAP_md=$'\E[01;38;5;74m' \
  LESS_TERMCAP_me=$'\E[0m' \
  LESS_TERMCAP_ue=$'\E[0m' \
  LESS_TERMCAP_us=$'\E[04;38;5;146m' \
  man "$@"
}

function path {
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
           sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
           sub(\"/Users/lekov\",   \"$fg_no_bold[red]/bin$reset_color\"); \
           sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
           sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
           sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
           print }"
}