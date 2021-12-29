alias dots='chezmoi cd'
alias work='cd ~/Workspace'
alias dodi='cd ~/Workspace/dodi'
alias dl='cd ~/Workspace/dl'

alias sslme='sudo certbot -d lekov.me --manual --preferred-challenges dns certonly'

alias grep='grep --color'

alias less='less -R'

# Administer like a sir
alias please='sudo'

alias update='sudo softwareupdate -i -a --background; brew upgrade; brew upgrade --cask; npm update -g; gem update --system; gem update; tldr -u; asdf plugin-update --all'
alias cleanup='(trap "kill 0" INT; find ~/ -type f -name "*.DS_Store" -ls -delete &>/dev/null & gradleclean &>/dev/null & gem cleanup &>/dev/null & brew cleanup &>/dev/null)'

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume output volume 75'"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
