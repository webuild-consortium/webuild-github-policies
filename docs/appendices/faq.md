# Frequently Asked Questions (FAQ)

This document answers common questions about GitHub usage, policies, and procedures for the WEBUILD Consortium.

## Table of Contents

- [General Questions](#general-questions)
- [Repository Management](#repository-management)
- [Access and Permissions](#access-and-permissions)
- [Branching and Workflow](#branching-and-workflow)
- [Pull Requests and Code Review](#pull-requests-and-code-review)
- [Security and Compliance](#security-and-compliance)
- [Licensing](#licensing)
- [Troubleshooting](#troubleshooting)

## General Questions

### What is the WEBUILD Consortium?

The WEBUILD Consortium is an EU-funded project focused on [project objectives]. The consortium uses GitHub for collaborative software development and project management across multiple partner organizations.

### Why do we use GitHub?

GitHub provides:
- Version control with Git
- Collaborative development tools
- Issue tracking and project management
- CI/CD integration
- Security features
- Open source community engagement
- EU compliance capabilities

### Who can access WEBUILD repositories?

Access depends on repository visibility:
- **Public repositories**: Anyone can view and clone
- **Private repositories**: Only authorized consortium members
- **Specific access**: Granted based on role and work package

### How do I join the WEBUILD organization?

1. Create a GitHub account if you don't have one
2. Request access from your work package leader
3. Provide your GitHub username
4. Accept the organization invitation
5. Complete onboarding procedures

See [Onboarding Procedures](../03-onboarding-procedures.md) for details.

## Repository Management

### How do I create a new repository?

Follow these steps:
1. Obtain approval from project coordinator
2. Follow naming conventions: `wp[number]-[component-name]`
3. Use the repository creation guide
4. Add required documentation files
5. Configure repository settings

See [Creating New Repository Guide](../guides/creating-new-repository.md) for detailed instructions.

### What files are required in every repository?

Every repository must include:
- ✅ **README.md** - Project overview and documentation
- ✅ **LICENSE** - Apache License 2.0
- ✅ **CONTRIBUTING.md** - Contribution guidelines
- ✅ **CODE_OF_CONDUCT.md** - Community standards
- ✅ **SECURITY.md** - Security policy
- ✅ **.gitignore** - Files to ignore
- ✅ **Issue templates** - Bug reports, feature requests
- ✅ **PR template** - Pull request template

### Can I make a private repository public?

Yes, but you must:
1. Complete security review
2. Remove any sensitive information
3. Ensure documentation is complete
4. Obtain approval from project coordinator
5. Follow the publication process

See [Making Repository Public Guide](../guides/making-repository-public.md).

### How do I archive a repository?

To archive a repository:
1. Ensure all work is complete
2. Document final state
3. Get approval from work package leader
4. Go to Settings > General
5. Scroll to "Danger Zone"
6. Click "Archive this repository"

**Note**: Archived repositories are read-only.

### What naming conventions should I follow?

**Repositories**:
- Format: `wp[number]-[component-name]`
- Example: `wp4-interop-test-bed`
- Use lowercase and hyphens

**Branches**:
- `feature/[issue-number]-description`
- `bugfix/[issue-number]-description`
- `hotfix/[issue-number]-description`

**Commits**:
- Follow Conventional Commits
- Format: `type(scope): description`
- Example: `feat(auth): add OAuth2 support`

## Access and Permissions

### What are the different permission levels?

GitHub provides five permission levels:

1. **Read**: View and clone only
2. **Triage**: Manage issues and PRs
3. **Write**: Push commits and merge PRs
4. **Maintain**: Manage settings and workflows
5. **Admin**: Full control

See [Access Management Guide](../guides/access-management.md) for details.

### How do I request access to a repository?

1. Identify the repository you need access to
2. Contact the repository owner or work package leader
3. Provide justification for access
4. Specify required permission level
5. Wait for approval and invitation

### How long does it take to get access?

Typically:
- **Standard requests**: 1-2 business days
- **Urgent requests**: Same day (if justified)
- **External collaborators**: Up to 1 week (requires additional approval)

### Can external collaborators access repositories?

Yes, but with restrictions:
- Must be approved by project coordinator
- Usually granted Read or Triage access
- Must sign confidentiality agreement (if applicable)
- Access reviewed quarterly

### How do I enable two-factor authentication (2FA)?

1. Go to GitHub Settings
2. Click "Password and authentication"
3. Click "Enable two-factor authentication"
4. Choose method (app or SMS)
5. Follow setup instructions
6. Save recovery codes

**Note**: 2FA is mandatory for WEBUILD organization members.

## Branching and Workflow

### What branching strategy do we use?

WEBUILD uses GitFlow:
- **main**: Production-ready code
- **develop**: Integration branch
- **feature/***: New features
- **bugfix/***: Bug fixes
- **hotfix/***: Emergency fixes
- **release/***: Release preparation

See [Branching and Workflow](../07-branching-and-workflow.md) for details.

### When should I create a new branch?

Create a new branch when:
- Starting work on a new feature
- Fixing a bug
- Making any changes to code
- Experimenting with ideas

**Never commit directly to main or develop.**

### How do I keep my branch up-to-date?

```bash
# Fetch latest changes
git fetch origin

# Rebase on develop
git checkout feature/my-feature
git rebase origin/develop

# Or merge
git merge origin/develop

# Push updates
git push origin feature/my-feature --force-with-lease
```

### What should I do if I have merge conflicts?

1. **Don't panic** - conflicts are normal
2. **Fetch latest changes**: `git fetch origin`
3. **Rebase or merge**: `git rebase origin/develop`
4. **Resolve conflicts**: Edit conflicting files
5. **Test thoroughly**: Ensure everything works
6. **Commit resolution**: `git add . && git commit`
7. **Push changes**: `git push --force-with-lease`

### How often should I commit?

- **Commit frequently**: After each logical change
- **Keep commits small**: One change per commit
- **Write clear messages**: Explain what and why
- **Don't commit broken code**: Ensure tests pass

### Can I force push?

**Generally no**, but exceptions exist:
- ✅ Your own feature branch
- ✅ After rebasing (use `--force-with-lease`)
- ❌ Shared branches (main, develop)
- ❌ Other people's branches

## Pull Requests and Code Review

### How do I create a pull request?

1. Push your branch to GitHub
2. Go to repository on GitHub
3. Click "Pull requests" tab
4. Click "New pull request"
5. Select your branch
6. Fill out PR template
7. Request reviewers
8. Submit PR

### What makes a good pull request?

A good PR:
- ✅ Is small and focused (< 400 lines)
- ✅ Has clear description
- ✅ Links related issues
- ✅ Includes tests
- ✅ Updates documentation
- ✅ Passes all checks
- ✅ Has meaningful commits

### How long should code review take?

Target timeframes:
- **Small PRs** (< 100 lines): 1-2 hours
- **Medium PRs** (100-400 lines): 4-8 hours
- **Large PRs** (> 400 lines): 1-2 days

**Note**: Break large PRs into smaller ones when possible.

### Who should review my code?

Request reviews from:
- Team members familiar with the code
- Subject matter experts
- At least one senior developer
- Code owners (if defined)

**Minimum**: 1 approval required before merging.

### What if reviewers disagree?

1. **Discuss**: Have a conversation
2. **Explain**: Share reasoning
3. **Compromise**: Find middle ground
4. **Escalate**: Involve tech lead if needed
5. **Document**: Record decision

### Can I merge my own PR?

**Generally no**, unless:
- ✅ Emergency hotfix (with notification)
- ✅ Documentation-only changes
- ✅ Explicitly approved by maintainer

**Always get at least one review for code changes.**

## Security and Compliance

### How do I report a security vulnerability?

**DO NOT** create a public issue. Instead:
1. Email security team: [SECURITY-EMAIL@example.com]
2. Include detailed description
3. Provide reproduction steps
4. Wait for acknowledgment
5. Follow coordinated disclosure

See [Security Policy](../06-security-and-compliance.md) for details.

### What should I do if I accidentally commit a secret?

**Act immediately**:
1. **Rotate the secret**: Change password/key immediately
2. **Remove from history**: Use BFG Repo-Cleaner or git-filter-repo
3. **Notify security team**: Report the incident
4. **Force push**: Update remote repository
5. **Document**: Record what happened

```bash
# Remove secret from history
bfg --replace-text secrets.txt
git reflog expire --expire=now --all
git gc --prune=now --aggressive
git push --force
```

### Are there automated security checks?

Yes, we use:
- **Dependabot**: Dependency vulnerability scanning
- **Secret scanning**: Detects committed secrets
- **Code scanning**: Static analysis (CodeQL)
- **Security advisories**: Vulnerability tracking

### How often should I update dependencies?

- **Security updates**: Immediately
- **Minor updates**: Monthly
- **Major updates**: Quarterly (with testing)

Use Dependabot for automated updates.

### What data can I store in repositories?

**Allowed**:
- ✅ Source code
- ✅ Documentation
- ✅ Configuration templates
- ✅ Test data (non-sensitive)
- ✅ Public information

**NOT allowed**:
- ❌ Passwords or API keys
- ❌ Personal data (GDPR)
- ❌ Proprietary information
- ❌ Large binary files
- ❌ Confidential data

## Licensing

### What license do we use?

All WEBUILD projects use **Apache License 2.0**.

### Why Apache 2.0?

Apache 2.0:
- ✅ Permissive open source license
- ✅ Allows commercial use
- ✅ Provides patent protection
- ✅ Compatible with EU requirements
- ✅ Well-understood and widely used

### Do I need to add license headers?

Yes, add license headers to all source files:

```javascript
/*
 * Copyright [YEAR] [COPYRIGHT HOLDER]
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
```

### Can I use third-party code?

Yes, if:
- ✅ License is compatible with Apache 2.0
- ✅ License is documented
- ✅ Attribution is provided
- ✅ No GPL or copyleft licenses (without approval)

### What about EU funding acknowledgment?

All repositories must include:

```markdown
This project is funded by the European Union under [GRANT NUMBER/PROGRAM].
Views and opinions expressed are however those of the author(s) only and do
not necessarily reflect those of the European Union or [FUNDING AGENCY].
Neither the European Union nor the granting authority can be held responsible
for them.
```

## Troubleshooting

### I can't push to the repository

**Possible causes**:
1. **No write access**: Request access from maintainer
2. **Protected branch**: Create PR instead of direct push
3. **Authentication failed**: Check credentials or token
4. **Large files**: Use Git LFS for large files

### My PR checks are failing

**Steps to fix**:
1. **Check error messages**: Read CI/CD logs
2. **Run tests locally**: `npm test` or equivalent
3. **Fix issues**: Address failing tests
4. **Commit fixes**: Push updated code
5. **Request help**: Ask in PR comments if stuck

### I accidentally pushed to main

**Fix immediately**:
```bash
# Revert the commit
git revert [commit-hash]
git push origin main

# Or reset (if no one pulled yet)
git reset --hard HEAD~1
git push --force origin main
```

**Then**: Notify team and create proper PR.

### How do I undo a commit?

**Before pushing**:
```bash
# Undo last commit, keep changes
git reset --soft HEAD~1

# Undo last commit, discard changes
git reset --hard HEAD~1
```

**After pushing**:
```bash
# Create revert commit
git revert [commit-hash]
git push origin [branch]
```

### I need to change commit history

**For your branch only**:
```bash
# Interactive rebase
git rebase -i HEAD~3

# Amend last commit
git commit --amend

# Force push
git push --force-with-lease
```

**Never rewrite history on shared branches!**

### Where can I get help?

1. **Documentation**: Check this documentation first
2. **Team**: Ask in team chat or discussions
3. **Issues**: Search existing issues
4. **Maintainers**: Contact repository maintainers
5. **Support**: Email [SUPPORT-EMAIL@example.com]

## Quick Reference

### Common Commands

```bash
# Start new feature
git checkout develop
git pull origin develop
git checkout -b feature/123-my-feature

# Commit changes
git add .
git commit -m "feat: add new feature"

# Push and create PR
git push -u origin feature/123-my-feature
gh pr create

# Update branch
git fetch origin
git rebase origin/develop

# Merge PR (after approval)
gh pr merge --squash
```

### Useful Links

- [GitHub Policies](../01-github-policies-and-guidelines.md)
- [Contribution Guidelines](../02-contribution-guidelines.md)
- [Onboarding Procedures](../03-onboarding-procedures.md)
- [Repository Management](../04-repository-management.md)
- [Security and Compliance](../06-security-and-compliance.md)
- [Branching and Workflow](../07-branching-and-workflow.md)

### Contact Information

- **Technical Support**: [SUPPORT-EMAIL@example.com]
- **Security Issues**: [SECURITY-EMAIL@example.com]
- **Project Coordinator**: [COORDINATOR-EMAIL@example.com]
- **GitHub Organization**: https://github.com/webuild-consortium

## Still Have Questions?

If your question isn't answered here:

1. **Search documentation**: Use search function
2. **Check guides**: Review relevant guides
3. **Ask team**: Post in GitHub Discussions
4. **Create issue**: Use question template
5. **Contact support**: Email support team

---

**WEBUILD Consortium Project**

This project is funded by the European Union under [GRANT NUMBER/PROGRAM]. Views and opinions expressed are however those of the author(s) only and do not necessarily reflect those of the European Union or [FUNDING AGENCY]. Neither the European Union nor the granting authority can be held responsible for them.