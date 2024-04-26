### exa
if command -v exa > /dev/null; then
  alias ls='exa --long --all --color auto --icons --sort=type'
  alias tree='exa --tree'
  alias la='ls -la'
  alias lt='ls --tree --level=2'
else
  # Show full output when using ls
  alias ls='ls -AlhF --color=auto'
fi

### VIM
if command -v vim > /dev/null; then
  alias vi="vim"
  alias v="vim"
fi

# Create parent directories automatically
alias mkdir='mkdir -pv'

### cd aliases
alias Applications='cd $HOME/Applications'
alias Cloud='cd $HOME/Cloud'
alias Config='cd $HOME/.config'
alias Desktop='cd $HOME/Desktop'
alias Downloads='cd $HOME/Downloads'
alias Library='cd $HOME/Library'
alias Local='cd $HOME/.local'
alias Movies='cd $HOME/Movies'
alias Music='cd $HOME/Music'
alias Pictures='cd $HOME/Pictures'
alias Public='cd $HOME/Public'