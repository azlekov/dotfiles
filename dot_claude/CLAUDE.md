# Tech Stack
- Use Next.js 16+ for new web projects. Use `proxy.ts`, not `middleware.ts`.
- Use React 19+.
- Use Tailwind CSS v4.
- Use latest shadcn/ui on Base UI (not Radix) for components.

# Search & Documentation
- Treat the current year as 2026 when searching for up-to-date documentation, releases, or data.
- Prefer fetching current library/framework docs (e.g. via Context7) over relying on memory, even for well-known tools.

# Skills
- When working on a task, check for and prefer installed SKILLs in the project (and globally) before solving from scratch — they encode the expected workflow.

# Workflow
- Use conventional commit messages derived from the actual changes. Keep each line under 180 chars.
- Open pull requests with the `gh` CLI.
- Track bugs, feature requests, and new tasks with `gh` issues.

# Deployment
- On fresh or updated deployments, record env vars in 1Password Environments via the 1Password MCP before setting them on the host.
- Track everything unrecoverable or user-impacting on rotation: salts, JWT/session secrets, DB credentials, webhook signing secrets, cron secrets, self-minted API keys.
- Provider-issued secrets re-readable from their dashboard (Supabase, Neon, Upstash, etc.) need no record — unless the provider shows them only once.
- Reason: Vercel marks env vars sensitive and never reveals them again; without a 1Password record the deployment cannot be reconstructed.

# Sandbox & Remotes
- Default to running commands INSIDE the sandbox.
- Escape the sandbox only when a command genuinely needs network or auth — `gh` CLI, `bunx` (package downloads), and network git actions (`fetch`, `push`, `pull`, `clone`) — or when a command fails with clear evidence of a sandbox restriction (e.g. "Operation not permitted", denied path/socket, blocked host).
- Keep sandbox escapes per-command: escaping once does not mean later commands should also run outside. Re-evaluate each one.
- Never rewrite a repository remote from SSH to HTTPS just because SSH fails. Diagnose the SSH/auth problem (keys, agent, known_hosts) instead and leave the remote URL as-is.

# Worktrees & Branch Naming
- When working with worktrees, use clearly named, conventional branches — `feat/`, `fix/`, `chore/`, `refactor/`, `test/`, etc.
- Do not use `claude/`-prefixed branch names.

# Supabase
- Edit migrations introduced in the current branch/PR freely, as long as they are not yet merged to development, staging, or production. Once merged, add a new migration instead.
- A feature ships a complete, consolidated set of migrations — final table/function/RLS definitions, not a chain of `ALTER TABLE` patches accumulated across sessions. Collapse in-branch migrations before the PR merges.
- When debugging a Supabase-based project, consider using Docker to inspect the running Postgres data directly.
