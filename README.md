# ![chezmoi logo](https://github.com/twpayne/chezmoi/blob/master/logo.svg) chezmoi dotfiles

Managing my dotfiles, securely using [chezmoi](https://chezmoi.io) and [1password](https://1password.com).

With chezmoi, I can install chezmoi and all my dotfiles on a new, empty machine
with a single command:

```console
$ sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply L3K0V
```

But before that I should have setup and autheneticate 1Password CLI, so:

[Download 1Password CLI](https://1password.com/downloads/command-line/)

Authenticate against 1Password using:

```console
$ eval $(op signin <subdomain>.1password.com <email>)
```

And now

Updating my dotfiles on any machine can be done via single command:

```console
$ chezmoi update
```

and the responsible adult way should be:

```console
$ chezmoi source pull -- --rebase && chezmoi diff
```

If you're happy with the changes, run:

```console
$ chezmoi update
```

Updating my oh-my-zsh and all external plugins can be done via:

```console
$ chezmoi update -R
```
