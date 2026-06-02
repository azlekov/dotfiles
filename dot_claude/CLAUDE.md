# Tech Stack
- Use Next.js 16+ for new web projects. Use `proxy.ts`, not `middleware.ts`.
- Use React 19+.
- Use Tailwind CSS v4.

# Search & Documentation
- Treat the current year as 2026 when searching for up-to-date documentation, releases, or data.
- Prefer fetching current library/framework docs (e.g. via Context7) over relying on memory, even for well-known tools.

# Skills
- When working on a task, check for and prefer installed SKILLs in the project (and globally) before solving from scratch — they encode the expected workflow.

# Workflow
- Use conventional commit messages derived from the actual changes. Keep each line under 180 chars.
- Open pull requests with the `gh` CLI.
- Track bugs, feature requests, and new tasks with `gh` issues.

# Sandbox & Remotes
- Default to running commands INSIDE the sandbox.
- Escape the sandbox only when a command genuinely needs network or auth — `gh` CLI, `bunx` (package downloads), and network git actions (`fetch`, `push`, `pull`, `clone`) — or when a command fails with clear evidence of a sandbox restriction (e.g. "Operation not permitted", denied path/socket, blocked host).
- Keep sandbox escapes per-command: escaping once does not mean later commands should also run outside. Re-evaluate each one.
- Never rewrite a repository remote from SSH to HTTPS just because SSH fails. Diagnose the SSH/auth problem (keys, agent, known_hosts) instead and leave the remote URL as-is.

# Worktrees & Branch Naming
- When working with worktrees, use clearly named, conventional branches — `feat/`, `fix/`, `chore/`, `refactor/`, `test/`, etc.
- Do not use `claude/`-prefixed branch names.

# Supabase
- Prefer editing existing migrations over creating new ones for existing tables, functions, or RLS — unless explicitly told to create a new migration.
- On a PR or `develop` branch, edit the existing migration ONLY if it has not yet been deployed to `main`. If it is already on `main`, create a new migration instead.
- When debugging a Supabase-based project, consider using Docker to inspect the running Postgres data directly.
