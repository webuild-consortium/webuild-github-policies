# Git Commands Cheat Sheet

**Quick Reference for WEBUILD Consortium Members**

---

## Daily Workflow

| Task | Command |
|------|---------|
| Update main | `git checkout main && git pull origin main` |
| Create branch | `git checkout -b feature/123-description` |
| Check status | `git status` |
| View changes | `git diff` |
| Stage changes | `git add .` |
| Commit | `git commit -m "type: description"` |
| Push branch | `git push origin feature/123-name` |
| Update branch | `git fetch origin && git rebase origin/main` |
| Delete branch | `git branch -d feature/123-name` |

## Branch Management

```bash
# Create and switch to branch
git checkout -b feature/123-name

# Switch branches
git checkout main

# List branches
git branch -a

# Delete local branch
git branch -d feature/123-name

# Delete remote branch
git push origin --delete feature/123-name
```

## Commit Types

| Type | Example |
|------|---------|
| feat | `feat: add authentication` |
| fix | `fix: resolve timeout` |
| docs | `docs: update guide` |
| refactor | `refactor: simplify logic` |
| test | `test: add tests` |
| chore | `chore: update deps` |

## Syncing

```bash
# Fetch changes
git fetch origin

# Pull with rebase
git pull --rebase origin main

# Push changes
git push origin feature/123-name

# Force push safely
git push origin feature/123-name --force-with-lease
```

## Undoing Changes

```bash
# Undo last commit, keep changes
git reset --soft HEAD~1

# Undo last commit, discard changes
git reset --hard HEAD~1

# Fix last commit message
git commit --amend -m "New message"

# Unstage file
git reset path/to/file
```

## Stashing

```bash
# Stash changes
git stash save "WIP: description"

# List stashes
git stash list

# Apply stash
git stash pop

# Apply specific stash
git stash apply stash@{0}
```

## Viewing History

```bash
# View log
git log --oneline --graph

# View changes
git diff

# View staged changes
git diff --staged

# Show last commit
git show HEAD
```

## Emergency Recovery

```bash
# View reflog
git reflog

# Recover lost commit
git checkout commit-hash
git checkout -b recovery-branch

# Abort merge
git merge --abort

# Abort rebase
git rebase --abort
```

---

**Related:** [Quick Start](../00-quick-start.md) | [Branching Workflow](../07-branching-and-workflow.md)
