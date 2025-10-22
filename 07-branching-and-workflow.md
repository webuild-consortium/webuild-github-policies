# Branching and Workflow

**Document Version:** 1.0
**Last Updated:** October 2025
**Status:** Draft for Review

---

## Table of Contents

1. [Introduction](#1-introduction)
2. [Branching Strategy](#2-branching-strategy)
3. [Branch Types](#3-branch-types)
4. [Workflow Processes](#4-workflow-processes)
5. [Commit Guidelines](#5-commit-guidelines)
6. [Merge Strategies](#6-merge-strategies)
7. [Release Management](#7-release-management)
8. [Best Practices](#8-best-practices)
9. [Common Scenarios](#9-common-scenarios)
10. [Troubleshooting](#10-troubleshooting)

---

## 1. Introduction

### 1.1 Purpose

This document establishes standardized Git branching strategies and workflows for the WEBUILD consortium. Consistent workflows ensure smooth collaboration, reduce conflicts, and maintain code quality across all repositories.

### 1.2 Scope

These guidelines apply to:

✅ All consortium repositories
✅ All contributors and maintainers
✅ All development activities
✅ All environments (DEV, TEST, PROD)

### 1.3 Workflow Goals

1. **Enable Parallel Development:** Multiple features developed simultaneously
2. **Maintain Stability:** Keep main branch always deployable
3. **Facilitate Collaboration:** Clear processes for team coordination
4. **Support Quality:** Built-in review and testing processes
5. **Enable Traceability:** Clear history of changes and decisions

### 1.4 Choosing a Strategy

**Default Strategy:** Feature Branch Workflow with optional GitFlow for complex projects

**Selection Criteria:**

| Project Type | Recommended Strategy | Reason |
|-------------|---------------------|---------|
| Small projects (1-3 developers) | Feature Branch | Simple, flexible |
| Medium projects (4-10 developers) | Feature Branch or GitFlow | Balance complexity/control |
| Large projects (10+ developers) | GitFlow | Structured release management |
| Continuous deployment | Trunk-Based Development | Rapid iteration |
| Library/Framework | GitFlow | Multiple version support |

---

## 2. Branching Strategy

### 2.1 Feature Branch Workflow (Default)

**Overview:**

```
main (production-ready)
  │
  ├─── feature/user-authentication
  │     │
  │     └─── (develop, test, merge)
  │
  ├─── feature/api-integration
  │     │
  │     └─── (develop, test, merge)
  │
  └─── bugfix/login-timeout
        │
        └─── (fix, test, merge)
```

**Key Principles:**

- `main` branch is always stable and deployable
- All work happens in feature branches
- Features merged via pull requests
- Code review required before merge
- Automated tests must pass

**When to Use:**

✅ Most WEBUILD repositories
✅ Projects with continuous deployment
✅ Small to medium teams
✅ Rapid development cycles

### 2.2 GitFlow Workflow

**Overview:**

```
main (production releases)
  │
  ├─── Tag: v1.0.0
  │
develop (integration branch)
  │
  ├─── feature/new-feature
  │     │
  │     └─── (merge to develop)
  │
  ├─── release/v1.1.0
  │     │
  │     ├─── (bug fixes)
  │     ├─── (merge to main)
  │     └─── (merge back to develop)
  │
  └─── hotfix/critical-bug
        │
        ├─── (merge to main)
        └─── (merge to develop)
```

**Key Principles:**

- `main` contains production releases only
- `develop` is the integration branch
- Features branch from and merge to `develop`
- Releases prepared in release branches
- Hotfixes branch from `main`

**When to Use:**

✅ Complex projects with scheduled releases
✅ Multiple versions in production
✅ Strict release management needed
✅ Large teams with formal processes

### 2.3 Trunk-Based Development

**Overview:**

```
main (trunk)
  │
  ├─── short-lived feature branch (< 2 days)
  │     │
  │     └─── (quick merge)
  │
  ├─── short-lived feature branch
  │     │
  │     └─── (quick merge)
  │
  └─── (continuous integration)
```

**Key Principles:**

- Single main branch (trunk)
- Very short-lived feature branches
- Frequent integration (multiple times per day)
- Feature flags for incomplete features
- Strong CI/CD pipeline required

**When to Use:**

✅ Mature CI/CD practices
✅ Experienced teams
✅ Continuous deployment
✅ High automation

---

## 3. Branch Types

### 3.1 Main Branches

#### 3.1.1 main Branch

**Purpose:** Production-ready code

**Characteristics:**
- Always stable and deployable
- Protected branch
- Only accepts merges via PR
- Tagged for releases
- Never commit directly

**Protection Rules:**

```yaml
Branch: main
- Require pull request reviews: 1
- Require status checks to pass
- Require conversation resolution
- Require linear history (optional)
- Include administrators
- Restrict force pushes
- Restrict deletions
```

#### 3.1.2 develop Branch (GitFlow only)

**Purpose:** Integration branch for features

**Characteristics:**
- Latest development changes
- May be unstable
- Features merge here first
- Protected branch
- Tested before release

**Protection Rules:**

```yaml
Branch: develop
- Require pull request reviews: 1
- Require status checks to pass
- Allow force pushes (for maintainers only)
```

### 3.2 Supporting Branches

#### 3.2.1 Feature Branches

**Purpose:** Develop new features

**Naming Convention:**
```
feature/[issue-number]-[brief-description]
feature/123-user-authentication
feature/456-api-rate-limiting
```

**Lifecycle:**

```bash
# Create feature branch
git checkout main  # or develop for GitFlow
git pull origin main
git checkout -b feature/123-user-authentication

# Work on feature
# ... make changes ...
git add .
git commit -m "feat: implement user authentication"

# Keep updated with main
git fetch origin
git rebase origin/main

# Push to remote
git push origin feature/123-user-authentication

# Create pull request
# ... via GitHub UI ...

# After merge, delete branch
git checkout main
git pull origin main
git branch -d feature/123-user-authentication
```

**Best Practices:**

- ✅ Branch from latest main/develop
- ✅ Keep branches focused and small
- ✅ Update regularly from main/develop
- ✅ Delete after merge
- ❌ Don't let branches live too long
- ❌ Don't mix unrelated changes

#### 3.2.2 Bugfix Branches

**Purpose:** Fix bugs in development

**Naming Convention:**
```
bugfix/[issue-number]-[brief-description]
bugfix/789-fix-login-timeout
bugfix/012-resolve-memory-leak
```

**Similar to feature branches but for bug fixes.**

#### 3.2.3 Hotfix Branches

**Purpose:** Emergency fixes for production

**Naming Convention:**
```
hotfix/[issue-number]-[brief-description]
hotfix/345-fix-critical-security-issue
hotfix/678-patch-data-corruption
```

**Lifecycle:**

```bash
# Create hotfix from main
git checkout main
git pull origin main
git checkout -b hotfix/345-fix-critical-security-issue

# Fix the issue
# ... make changes ...
git add .
git commit -m "fix: resolve critical security vulnerability"

# Push and create PR
git push origin hotfix/345-fix-critical-security-issue

# After merge to main:
# 1. Tag new version
git checkout main
git pull origin main
git tag -a v1.2.1 -m "Hotfix: Critical security patch"
git push origin v1.2.1

# 2. Merge back to develop (if using GitFlow)
git checkout develop
git merge main
git push origin develop

# 3. Delete hotfix branch
git branch -d hotfix/345-fix-critical-security-issue
```

**Best Practices:**

- ✅ Branch from main (production)
- ✅ Keep changes minimal
- ✅ Test thoroughly
- ✅ Merge to both main and develop
- ✅ Tag immediately after merge
- ✅ Document in CHANGELOG

#### 3.2.4 Release Branches (GitFlow)

**Purpose:** Prepare for production release

**Naming Convention:**
```
release/v[version]
release/v1.2.0
release/v2.0.0-beta
```

**Lifecycle:**

```bash
# Create release branch from develop
git checkout develop
git pull origin develop
git checkout -b release/v1.2.0

# Prepare release
# - Update version numbers
# - Update CHANGELOG
# - Fix release-specific bugs
# - Update documentation

git add .
git commit -m "chore: prepare release v1.2.0"

# Push release branch
git push origin release/v1.2.0

# After testing and approval:
# 1. Merge to main
git checkout main
git merge release/v1.2.0
git tag -a v1.2.0 -m "Release version 1.2.0"
git push origin main --tags

# 2. Merge back to develop
git checkout develop
git merge release/v1.2.0
git push origin develop

# 3. Delete release branch
git branch -d release/v1.2.0
git push origin --delete release/v1.2.0
```

**Best Practices:**

- ✅ Only bug fixes and release prep
- ✅ No new features
- ✅ Update all version references
- ✅ Complete CHANGELOG
- ✅ Thorough testing
- ❌ Don't add new features

### 3.3 Branch Naming Rules

**Format:**
```
<type>/<issue-number>-<description>
```

**Types:**
- `feature/` - New features
- `bugfix/` - Bug fixes
- `hotfix/` - Production hotfixes
- `release/` - Release preparation
- `docs/` - Documentation only
- `refactor/` - Code refactoring
- `test/` - Test additions/changes
- `chore/` - Maintenance tasks

**Description Rules:**

✅ **Do:**
- Use lowercase
- Use hyphens for spaces
- Be descriptive but concise
- Include issue number
- Use present tense

❌ **Don't:**
- Use spaces or special characters
- Make it too long (> 50 chars)
- Use vague descriptions
- Include personal names

**Examples:**

✅ Good:
```
feature/123-add-jwt-authentication
bugfix/456-fix-memory-leak-in-cache
hotfix/789-patch-sql-injection
docs/012-update-api-documentation
```

❌ Bad:
```
my-feature
fix
john-work
feature_new_stuff
FEATURE-123-ADD-AUTHENTICATION
```

---

## 4. Workflow Processes

### 4.1 Feature Development Workflow

**Step-by-Step Process:**

#### Step 1: Plan the Feature

- [ ] Create issue describing feature
- [ ] Discuss approach with team
- [ ] Get approval from maintainer
- [ ] Assign issue to yourself

#### Step 2: Create Feature Branch

```bash
# Update local main
git checkout main
git pull origin main

# Create feature branch
git checkout -b feature/123-add-user-profile

# Verify branch
git branch
```

#### Step 3: Develop the Feature

```bash
# Make changes
# ... edit files ...

# Check status
git status

# Stage changes
git add src/profile.py tests/test_profile.py

# Commit with clear message
git commit -m "feat: add user profile management

- Implement profile CRUD operations
- Add profile validation
- Create profile API endpoints
- Add comprehensive tests

Closes #123"
```

#### Step 4: Keep Branch Updated

```bash
# Fetch latest changes
git fetch origin

# Rebase on main (preferred)
git rebase origin/main

# Or merge (if rebase causes issues)
git merge origin/main

# Resolve conflicts if any
# ... fix conflicts ...
git add .
git rebase --continue  # or git commit for merge
```

#### Step 5: Push and Create PR

```bash
# Push feature branch
git push origin feature/123-add-user-profile

# If rebased, may need force push
git push origin feature/123-add-user-profile --force-with-lease
```

**Create Pull Request:**

1. Go to GitHub repository
2. Click "Pull requests" → "New pull request"
3. Select your branch
4. Fill in PR template
5. Request reviewers
6. Link related issues

#### Step 6: Address Review Feedback

```bash
# Make requested changes
# ... edit files ...

# Commit changes
git add .
git commit -m "refactor: address review feedback

- Simplify profile validation logic
- Add error handling
- Update tests"

# Push updates
git push origin feature/123-add-user-profile
```

#### Step 7: Merge

**After approval:**

1. Ensure all checks pass
2. Resolve any conflicts
3. Squash commits if needed
4. Merge pull request
5. Delete feature branch

```bash
# After merge, update local main
git checkout main
git pull origin main

# Delete local feature branch
git branch -d feature/123-add-user-profile

# Delete remote branch (if not auto-deleted)
git push origin --delete feature/123-add-user-profile
```

### 4.2 Bug Fix Workflow

**Similar to feature workflow but:**

1. **Branch from:** main (or develop)
2. **Branch name:** `bugfix/[issue]-[description]`
3. **Commit prefix:** `fix:`
4. **Priority:** Higher than features
5. **Testing:** Include regression tests

**Example:**

```bash
# Create bugfix branch
git checkout main
git pull origin main
git checkout -b bugfix/456-fix-login-timeout

# Fix the bug
# ... make changes ...

# Add regression test
# ... add test ...

# Commit
git commit -m "fix: resolve login timeout issue

- Increase session timeout to 30 minutes
- Add connection retry logic
- Add regression test

Fixes #456"

# Push and create PR
git push origin bugfix/456-fix-login-timeout
```

### 4.3 Hotfix Workflow

**For critical production issues:**

1. **Branch from:** main (production)
2. **Branch name:** `hotfix/[issue]-[description]`
3. **Priority:** Highest
4. **Testing:** Thorough testing required
5. **Deployment:** Immediate after merge

**Process:**

```bash
# Create hotfix from main
git checkout main
git pull origin main
git checkout -b hotfix/789-fix-security-vulnerability

# Fix the issue
# ... make critical fix ...

# Test thoroughly
# ... run all tests ...

# Commit
git commit -m "fix: patch critical security vulnerability

- Sanitize user input in authentication
- Add input validation
- Update security tests

SECURITY: Fixes CVE-2025-XXXX
Fixes #789"

# Push and create PR
git push origin hotfix/789-fix-security-vulnerability

# After merge and deployment:
# Tag new version
git checkout main
git pull origin main
git tag -a v1.2.1 -m "Hotfix: Security patch"
git push origin v1.2.1

# Merge to develop (if using GitFlow)
git checkout develop
git merge main
git push origin develop
```

### 4.4 Release Workflow (GitFlow)

**For scheduled releases:**

```bash
# 1. Create release branch from develop
git checkout develop
git pull origin develop
git checkout -b release/v1.3.0

# 2. Prepare release
# Update version in:
# - package.json / setup.py / pom.xml
# - README.md
# - CHANGELOG.md

# 3. Commit release preparation
git add .
git commit -m "chore: prepare release v1.3.0

- Update version to 1.3.0
- Update CHANGELOG
- Update documentation"

# 4. Push release branch
git push origin release/v1.3.0

# 5. Test thoroughly
# - Run all tests
# - Perform manual testing
# - Fix any release-blocking bugs

# 6. Merge to main
git checkout main
git merge release/v1.3.0
git tag -a v1.3.0 -m "Release version 1.3.0"
git push origin main --tags

# 7. Merge back to develop
git checkout develop
git merge release/v1.3.0
git push origin develop

# 8. Delete release branch
git branch -d release/v1.3.0
git push origin --delete release/v1.3.0

# 9. Create GitHub Release
# - Go to Releases → Draft new release
# - Select tag v1.3.0
# - Add release notes from CHANGELOG
# - Publish release
```

---

## 5. Commit Guidelines

### 5.1 Commit Message Format

**Structure:**

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Example:**

```
feat(auth): implement JWT authentication

- Add JWT token generation
- Implement token validation middleware
- Add refresh token support
- Update API documentation

Closes #123
```

### 5.2 Commit Types

| Type | Description | Example |
|------|-------------|---------|
| `feat` | New feature | `feat: add user registration` |
| `fix` | Bug fix | `fix: resolve login timeout` |
| `docs` | Documentation only | `docs: update API guide` |
| `style` | Code style changes | `style: format code with prettier` |
| `refactor` | Code refactoring | `refactor: simplify auth logic` |
| `test` | Test additions/changes | `test: add integration tests` |
| `chore` | Maintenance tasks | `chore: update dependencies` |
| `perf` | Performance improvements | `perf: optimize database queries` |
| `ci` | CI/CD changes | `ci: add deployment workflow` |
| `build` | Build system changes | `build: update webpack config` |
| `revert` | Revert previous commit | `revert: revert "feat: add feature"` |

### 5.3 Commit Best Practices

✅ **Do:**

- Write clear, descriptive messages
- Use imperative mood ("add" not "added")
- Keep subject line under 50 characters
- Separate subject from body with blank line
- Wrap body at 72 characters
- Explain what and why, not how
- Reference issues and PRs
- Make atomic commits (one logical change)

❌ **Don't:**

- Write vague messages ("fix stuff", "updates")
- Include multiple unrelated changes
- Commit broken code
- Commit debugging code
- Use past tense
- Exceed character limits

**Good Examples:**

```
feat: add email notification system

Implement email notifications for:
- User registration
- Password reset
- Account updates

Uses SendGrid API for delivery.

Closes #234
```

```
fix: resolve memory leak in cache manager

The cache was not properly releasing memory when
items expired. Added explicit cleanup in the
expiration handler.

Fixes #567
```

**Bad Examples:**

```
fixed stuff
```

```
WIP
```

```
Updated files
```

### 5.4 Commit Frequency

**Guidelines:**

- Commit often (multiple times per day)
- Commit logical units of work
- Commit before switching tasks
- Don't commit broken code
- Don't wait until feature is complete

**When to Commit:**

✅ After completing a logical unit
✅ Before taking a break
✅ Before switching branches
✅ After fixing a bug
✅ After adding tests
✅ Before rebasing

---

## 6. Merge Strategies

### 6.1 Merge Methods

#### 6.1.1 Merge Commit

**Creates a merge commit:**

```
main:     A---B---C---D---E
                   \       \
feature:            F---G---H
```

**When to use:**
- Preserving branch history important
- Multiple developers on feature
- Long-lived feature branches

**Command:**
```bash
git checkout main
git merge feature/123-new-feature
```

#### 6.1.2 Squash and Merge

**Combines all commits into one:**

```
main:     A---B---C---D
                       \
feature:                E (squashed F+G+H)
```

**When to use:**
- Clean, linear history desired
- Many small commits in feature
- Single logical change
- **Recommended for most PRs**

**Command:**
```bash
git checkout main
git merge --squash feature/123-new-feature
git commit -m "feat: add new feature"
```

#### 6.1.3 Rebase and Merge

**Replays commits on top of main:**

```
main:     A---B---C---D---F'---G'---H'
```

**When to use:**
- Linear history required
- Clean commit history in feature
- Each commit is meaningful

**Command:**
```bash
git checkout feature/123-new-feature
git rebase main
git checkout main
git merge feature/123-new-feature
```

### 6.2 Merge Strategy Selection

**Default:** Squash and Merge

**Decision Matrix:**

| Scenario | Strategy | Reason |
|----------|----------|--------|
| Small feature, many commits | Squash | Clean history |
| Large feature, clean commits | Rebase | Preserve commits |
| Multiple developers | Merge commit | Preserve collaboration |
| Hotfix | Squash | Single logical fix |
| Release branch | Merge commit | Preserve release history |

### 6.3 Handling Merge Conflicts

**When conflicts occur:**

```bash
# 1. Update your branch
git fetch origin
git rebase origin/main

# 2. Git will pause at conflicts
# CONFLICT (content): Merge conflict in file.py

# 3. Open conflicted files
# Look for conflict markers:
<<<<<<< HEAD
current code
=======
incoming code
>>>>>>> branch-name

# 4. Resolve conflicts
# - Edit files to resolve
# - Remove conflict markers
# - Test the resolution

# 5. Stage resolved files
git add file.py

# 6. Continue rebase
git rebase --continue

# 7. Push (may need force push)
git push origin feature/123 --force-with-lease
```

**Conflict Resolution Tips:**

- ✅ Understand both changes
- ✅ Test after resolution
- ✅ Ask for help if unsure
- ✅ Communicate with team
- ❌ Don't blindly accept one side
- ❌ Don't leave conflict markers

---

## 7. Release Management

### 7.1 Versioning

**Use Semantic Versioning:**

```
MAJOR.MINOR.PATCH

Example: 1.2.3
```

**Version Increments:**

- **MAJOR (1.0.0 → 2.0.0):** Breaking changes
- **MINOR (1.0.0 → 1.1.0):** New features (backwards compatible)
- **PATCH (1.0.0 → 1.0.1):** Bug fixes (backwards compatible)

**Pre-release Versions:**

- `1.0.0-alpha.1` - Alpha release
- `1.0.0-beta.1` - Beta release
- `1.0.0-rc.1` - Release candidate

### 7.2 Release Process

**Steps:**

1. **Plan Release**
   - Review completed features
   - Check bug fixes
   - Update roadmap

2. **Prepare Release**
   - Create release branch (GitFlow)
   - Update version numbers
   - Update CHANGELOG
   - Update documentation

3. **Test Release**
   - Run all tests
   - Perform manual testing
   - Fix release-blocking bugs

4. **Create Release**
   - Merge to main
   - Tag version
   - Create GitHub release
   - Deploy to production

5. **Post-Release**
   - Merge back to develop
   - Announce release
   - Monitor for issues
   - Update project boards

### 7.3 CHANGELOG Management

**Format:**

```markdown
# Changelog

## [Unreleased]

### Added
- New features in development

### Changed
- Changes to existing features

### Fixed
- Bug fixes

## [1.2.0] - 2025-10-22

### Added
- User authentication with JWT
- API rate limiting
- Email notifications

### Changed
- Improved error handling
- Updated dependencies

### Fixed
- Fixed login timeout issue
- Resolved memory leak

### Security
- Patched SQL injection vulnerability
```

**Update CHANGELOG:**

- With every significant change
- Before each release
- Use clear, user-focused language
- Group by change type
- Link to issues/PRs

---

## 8. Best Practices

### 8.1 General Best Practices

✅ **Do:**

- Keep branches short-lived (< 2 weeks)
- Update from main/develop frequently
- Write clear commit messages
- Make atomic commits
- Test before pushing
- Review your own code first
- Delete merged branches
- Use branch protection rules
- Follow naming conventions
- Document significant decisions

❌ **Don't:**

- Commit directly to main
- Force push to shared branches
- Leave branches unmerged for long
- Mix unrelated changes
- Commit broken code
- Ignore CI failures
- Skip code review
- Rewrite published history

### 8.2 Code Review Best Practices

**For Authors:**

- Keep PRs small and focused
- Provide clear description
- Self-review before requesting review
- Respond to feedback promptly
- Test thoroughly
- Update documentation

**For Reviewers:**

- Review promptly (within 2 days)
- Be constructive and respectful
- Focus on important issues
- Explain reasoning
- Approve when satisfied
- Test if possible

### 8.3 Branch Hygiene

**Regular Maintenance:**

```bash
# List all branches
git branch -a

# Delete merged local branches
git branch --merged main | grep -v "main" | xargs git branch -d

# Delete remote branches that no longer exist
git fetch --prune

# Clean up references
git remote prune origin
```

**Automated Cleanup:**

Enable "Automatically delete head branches" in repository settings.

---

## 9. Common Scenarios

### 9.1 Starting New Feature

```bash
git checkout main
git pull origin main
git checkout -b feature/123-new-feature
# ... work on feature ...
git add .
git commit -m "feat: implement new feature"
git push origin feature/123-new-feature
# Create PR on GitHub
```

### 9.2 Updating Feature Branch

```bash
git checkout feature/123-new-feature
git fetch origin
git rebase origin/main
# Resolve conflicts if any
git push origin feature/123-new-feature --force-with-lease
```

### 9.3 Fixing Merge Conflicts

```bash
# During rebase
git rebase origin/main
# Fix conflicts in files
git add .
git rebase --continue
git push origin feature/123 --force-with-lease
```

### 9.4 Undoing Last Commit

```bash
# Keep changes
git reset --soft HEAD~1

# Discard changes
git reset --hard HEAD~1
```

### 9.5 Cherry-Picking Commits

```bash
# Pick specific commit to another branch
git checkout target-branch
git cherry-pick <commit-hash>
git push origin target-branch
```

### 9.6 Stashing Changes

```bash
# Save work in progress
git stash save "WIP: feature implementation"

# List stashes
git stash list

# Apply stash
git stash pop

# Apply specific stash
git stash apply stash@{0}
```

---

## 10. Troubleshooting

### 10.1 Common Issues

#### Issue: Accidentally Committed to Main

```bash
# Move commit to new branch
git branch feature/accidental-commit
git reset --hard HEAD~1
git checkout feature/accidental-commit
```

#### Issue: Need to Change Last Commit Message

```bash
git commit --amend -m "New commit message"
git push origin branch-name --force-with-lease
```

#### Issue: Pushed Sensitive Data

```bash
# Remove from history
git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch path/to/file' \
  --prune-empty --tag-name-filter cat -- --all

# Force push
git push origin --force --all

# Rotate exposed secrets immediately!
```

#### Issue: Merge Conflict During Rebase

```bash
# Fix conflicts in files
git add .
git rebase --continue

# Or abort rebase
git rebase --abort
```

#### Issue: Lost Commits

```bash
# Find lost commits
git reflog

# Recover commit
git checkout <commit-hash>
git checkout -b recovery-branch
```

### 10.2 Getting Help

**Resources:**

- [Git Documentation](https://git-scm.com/doc)
- [GitHub Guides](https://guides.github.com)
- Repository maintainers
- WP/Group leads
- Technical Coordinator

**When to Ask:**

- Unsure about workflow
- Complex merge conflicts
- Lost work
- Need to rewrite history
- Security concerns

---

## Appendices

### Appendix A: Quick Reference

**Common Commands:**

```bash
# Create branch
git checkout -b feature/123-name

# Update branch
git fetch origin
git rebase origin/main

# Commit
git add .
git commit -m "type: description"

# Push
git push origin feature/123-name

# Update from main
git checkout main
git pull origin main
git checkout feature/123-name
git rebase main

# Delete branch
git branch -d feature/123-name
```

### Appendix B: Git Aliases

**Useful aliases:**

```bash
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
git config --global alias.visual 'log --oneline --graph --all'
```

### Appendix C: Resources

**Learning Resources:**

- [Pro Git Book](https://git-scm.com/book)
- [GitHub Flow Guide](https://guides.github.com/introduction/flow/)
- [GitFlow Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)
- [Conventional Commits](https://www.conventionalcommits.org/)

---

**Document Control:**

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | October 2025 | Technical Coordinator | Initial draft |

**Next Review Date:** January 2026

---

*This document is maintained in the `webuild-policies` repository. For questions or suggestions, please open an issue or contact the Technical Coordinator.*