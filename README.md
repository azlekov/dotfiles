# ![chezmoi logo](https://github.com/twpayne/chezmoi/blob/master/assets/images/logo-144px.svg) chezmoi dotfiles

Managing my dotfiles, securely using [chezmoi](https://chezmoi.io)

With chezmoi, I can install chezmoi and all my dotfiles on a new, empty machine
with a single command:

```console
$ sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply azlekov
```

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

## Layout & lifecycle

This repo is macOS-only. chezmoi's source-state naming maps onto the home directory:

- `dot_*` → `~/.\*` (e.g. `dot_gitconfig` → `~/.gitconfig`).
- `private_*` → files with `0600`-style perms / kept out of broad sharing.
- `*.tmpl` → rendered through Go templates at apply time, using data from
  `.chezmoi.toml.tmpl` (prompts `email`, derives `device_type`) and `.chezmoidata/`.

**Where to edit data (single source of truth):**

- `.chezmoidata/packages.yaml` — Homebrew taps/brews/casks and Mac App Store (`mas`) apps.
  The install script renders this into a `brew bundle` file; add/remove packages here, not in
  the script.
- `.chezmoidata/env.yaml` — shared shell environment (Android SDK path, PATH segments,
  `PNPM_HOME`, `SSH_AUTH_SOCK`, locale). Rendered into **both** `dot_config/shell/profile.sh.tmpl`
  (bash/zsh) and `dot_config/fish/config.fish.tmpl` so the two shells never drift.
- `.chezmoiexternal.toml` — files fetched from the network (LS_COLORS), refreshed weekly.

**Apply lifecycle** — scripts in `.chezmoiscripts/` run in this order on `chezmoi apply`:

1. `run_once_before_install-homebrew` — install Homebrew, trust taps.
2. `run_before_install-homebrew-packages` — Xcode + `brew bundle` (brews, casks, mas).
3. `run_onchange_after_00-install-mise-tools` — re-runs whenever `mise/config.toml` changes.
4. `run_once_after_0{1..7}-*` — Android SDK, Claude Code, fish setup, default shell, 1Password
   agent socket, Touch ID for sudo, global pnpm packages (numeric prefixes set the order).

`run_once_*` scripts are deduplicated by content hash, so renaming them does not re-trigger a run.

**Secrets:** SSH auth is delegated to the 1Password agent (`~/.1password/agent.sock` via
`dot_ssh/config`); no private keys live in this repo.
