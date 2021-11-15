# ![chezmoi logo](https://github.com/twpayne/chezmoi/raw/master/logo-144px.svg) chezmoi dotfiles

Managing my dotfiles, securely using [chezmoi](chezmoi.io) and [1password](https://1password.com).

With chezmoi, I can install chezmoi and all my dotfiles on a new, empty machine
with a single command:

```console
$ sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply L3K0V
```

Authenticate agains 1Password using:

```console
$ eval $(op signin <subdomain>.1password.com <email>)
```

Updating my dotfiles on any machine can be done via single command:

```console
$ chezmoi update
```

Updating my oh-my-zsh and all external plugins  can be done via:

```console
$ chezmoi update -R
```
