# Quick Start Guide

## Goal

Get you from zero to making your first contribution in under 30 minutes.

### Prerequisites Checklist

Before you begin, make sure you have:

- [ ] GitHub account created
- [ ] Two-factor authentication (2FA) enabled
- [ ] Access request submitted by your WP/Group lead
- [ ] Organization invitation accepted

**Don't have these?** See [Onboarding Procedures](03-onboarding-procedures.md#2-pre-onboarding-requirements).

---

## 5-Minute Setup

### Step 1: Configure Git

```bash
# Set your identity
git config --global user.name "Your Full Name"
git config --global user.email "your.email@organization.com"

# Set default branch name
git config --global init.defaultBranch main

# Verify configuration
git config --list
```

### Step 2: Set Up SSH Key

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your.email@organization.com"
# Press Enter to accept defaults, add passphrase when prompted

# Start SSH agent and add key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Copy public key
cat ~/.ssh/id_ed25519.pub
# Copy the output
```

**Add to GitHub:**
1. Go to [GitHub Settings → SSH Keys](https://github.com/settings/keys)
2. Click "New SSH key"
3. Paste your public key
4. Click "Add SSH key"

**Test connection:**
```bash
ssh -T git@github.com
# Should see: "Hi username! You've successfully authenticated..."
```

---

## Essential Reading

Read these sections in order:

1. **[Repository Structure](01-github-policies-and-guidelines.md#4-repository-organization)**
   - Understand how repositories are organized

2. **[Contribution Workflow](02-contribution-guidelines.md#31-standard-workflow-overview)**
   - Learn the basic contribution process

3. **[Branch Naming](07-branching-and-workflow.md#33-branch-naming-rules)**
   - Know how to name your branches

4. **[Commit Messages](07-branching-and-workflow.md#51-commit-message-format)**
   - Write proper commit messages

---

## Your First Contribution

### 1. Clone a Repository

```bash
# Navigate to your workspace
cd ~/workspace

# Clone repository (replace with your repo name)
git clone git@github.com:webuild-consortium/repo-name.git

# Navigate into repository
cd repo-name
```

### 2. Create a Feature Branch

```bash
# Update main branch
git checkout main
git pull origin main

# Create feature branch (use actual issue number)
git checkout -b feature/123-your-feature-name
```

### 3. Make Your Changes

```bash
# Edit files as needed
# Make your changes in your editor

# Check what changed
git status
git diff
```

### 4. Commit Your Changes

```bash
# Stage changes
git add .

# Commit with proper message
git commit -m "feat: brief description of change

- Detail 1
- Detail 2
- Detail 3

Closes #123"
```

### 5. Push and Create Pull Request

```bash
# Push your branch
git push origin feature/123-your-feature-name
```

**On GitHub:**
1. Go to repository
2. Click "Pull requests" → "New pull request"
3. Select your branch
4. Fill in PR description
5. Request reviewers
6. Click "Create pull request"

---

## Essential Commands Reference

### Daily Workflow

| Task | Command |
|------|---------|
| **Update main** | `git checkout main && git pull origin main` |
| **Create branch** | `git checkout -b feature/123-name` |
| **Check status** | `git status` |
| **Stage changes** | `git add .` |
| **Commit** | `git commit -m "type: description"` |
| **Push branch** | `git push origin feature/123-name` |
| **Update branch** | `git fetch origin && git rebase origin/main` |
| **Delete branch** | `git branch -d feature/123-name` |

### Branch Naming

| Type | Format | Example |
|------|--------|---------|
| **Feature** | `feature/[issue]-[name]` | `feature/123-add-auth` |
| **Bug fix** | `bugfix/[issue]-[name]` | `bugfix/456-fix-timeout` |
| **Hotfix** | `hotfix/[issue]-[name]` | `hotfix/789-security-patch` |
| **Docs** | `docs/[issue]-[name]` | `docs/012-update-readme` |

### Commit Types

| Type | When to Use | Example |
|------|-------------|---------|
| `feat:` | New feature | `feat: add user authentication` |
| `fix:` | Bug fix | `fix: resolve login timeout` |
| `docs:` | Documentation | `docs: update API guide` |
| `refactor:` | Code refactoring | `refactor: simplify auth logic` |
| `test:` | Tests | `test: add integration tests` |
| `chore:` | Maintenance | `chore: update dependencies` |

---

## Quick Troubleshooting

### Problem: Can't push to repository
```bash
# Check your access
gh repo view webuild-consortium/repo-name

# Verify authentication
gh auth status
```
**Solution:** Contact your WP/Group lead if access issues persist.

### Problem: Merge conflicts
```bash
# Update your branch
git fetch origin
git rebase origin/main

# Fix conflicts in your editor, then:
git add .
git rebase --continue
git push origin your-branch --force-with-lease
```

### Problem: Wrong commit message
```bash
# Fix last commit message
git commit --amend -m "New message"
git push origin your-branch --force-with-lease
```

### Problem: Accidentally committed to main
```bash
# Move commit to new branch
git branch feature/accidental-commit
git reset --hard HEAD~1
git checkout feature/accidental-commit
```

---

## Security Essentials

### Never Commit:
- Passwords or API keys
- Private keys or certificates
- Personal data
- Database credentials

### Always:
- Use `.env` files for secrets (add to `.gitignore`)
- Enable 2FA on your GitHub account
- Review code for security issues
- Keep dependencies updated

**If you accidentally commit a secret:**
1. Rotate the secret immediately
2. Contact Technical Coordinator
3. See [Security Incident Response](06-security-and-compliance.md#8-incident-response)

---

## Getting Help

### Quick Questions
1. **Check documentation** - Search in relevant policy doc
2. **Search issues** - Someone may have asked before
3. **Ask your team** - Contact your WP/Group lead

### Support Channels
- **Technical issues:** Open issue in relevant repository
- **Policy questions:** Contact WP/Group lead
- **Access issues:** Email Technical Coordinator (webuild-github-support@grnet.gr)
- **Real-time chat:** [WEBUILD Slack](https://join.slack.com/t/we-build-consortium/shared_invite/zt-3h6k2igc1-7DVjTs2yRqVChORqb4lxkw)

---

## Learning Resources

### Interactive Learning
- [GitHub Skills](https://skills.github.com/) - Free interactive courses
- [Introduction to Repository Management](https://github.com/skills/introduction-to-repository-management/) - Hands-on practice

### Reference Materials
- [Pro Git Book](https://git-scm.com/book) - Comprehensive Git guide (free)
- [GitHub Documentation](https://docs.github.com) - Official GitHub docs
- [Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf) - Quick reference

---

## Quick Tips

### For Efficient Work:
1. **Keep branches small** - Easier to review, faster to merge
2. **Commit often** - Small, logical commits are better
3. **Update frequently** - Sync with main daily to avoid conflicts
4. **Test locally** - Always test before pushing
5. **Ask early** - Don't struggle alone, ask for help

### For Better Collaboration:
1. **Write clear PR descriptions** - Help reviewers understand your changes
2. **Respond to feedback promptly** - Keep the conversation moving
3. **Review others' code** - Learn and contribute to quality
4. **Document decisions** - Future you will thank you
5. **Be respectful** - We're all learning together

---

## You're Ready!

You now have everything you need to start contributing to WEBUILD repositories.

### Questions?

Contact your WP/Group lead or email webuild-github-support@grnet.gr