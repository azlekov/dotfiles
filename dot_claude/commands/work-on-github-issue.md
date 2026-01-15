Please analyze and start working on this GitHub issue: $ARGUMENTS.

Follow these steps:

1. Use `gh issue view` to get the issue details
2. Understand the problem described in the issue
3. Create a branch following conventional commits and naming conventions and work on it locally.
4. Explore the codebase for relevant files using sub-agents
5. Define a implementataion plan and split the work if possible into separate parts which can be work on in parallel
6. Implement the necessary changes to fix the issue with multiple sub-agents in parallel when applicable
6. Write and run tests to verify the fix
7. Ensure code passes linting and type checking
8. Create a descriptive conventional commit message
9. Push and create a PR

Guidelines:
- Always prefer using `develop` as base branch instead of `main` when repo is using trunk based git flow
- Use the GitHub CLI (`gh`) for all GitHub-related tasks.
