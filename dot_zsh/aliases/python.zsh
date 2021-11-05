# Python aliases
alias py='python'
alias pyserver='py -m http.server'
alias pyclean='find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf'

# Update all outdated packages
alias pipup="pip freeze --local | cut -d = -f 1  | xargs pip install -U"