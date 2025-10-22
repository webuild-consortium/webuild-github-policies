
# Repository Management

**Document Version:** 1.0
**Last Updated:** October 2025
**Status:** Draft for Review

---

## Table of Contents

1. [Introduction](#1-introduction)
2. [Repository Lifecycle](#2-repository-lifecycle)
3. [Creating New Repositories](#3-creating-new-repositories)
4. [Repository Configuration](#4-repository-configuration)
5. [Maintaining Repositories](#5-maintaining-repositories)
6. [Repository Templates](#6-repository-templates)
7. [Archiving and Deprecation](#7-archiving-and-deprecation)
8. [Repository Deletion](#8-repository-deletion)
9. [Best Practices](#9-best-practices)
10. [Troubleshooting](#10-troubleshooting)

---

## 1. Introduction

### 1.1 Purpose

This document provides comprehensive guidelines for managing repositories throughout their lifecycle in the WEBUILD consortium, from creation to archival or deletion.

### 1.2 Scope

These guidelines apply to:

✅ All repositories in the `webuild-consortium` organization
✅ All repository types (code, documentation, specifications)
✅ All Work Packages and groups
✅ All stages of repository lifecycle

### 1.3 Roles and Responsibilities

| Role | Responsibilities |
|------|-----------------|
| **Technical Coordinator** | Organization-level repository management, policy enforcement |
| **WP Lead** | WP-level repository oversight, creation approval |
| **Group Lead** | Day-to-day repository management, maintenance |
| **Repository Maintainer** | Active maintenance, issue management, releases |
| **Contributors** | Code contributions, issue reporting |

---

## 2. Repository Lifecycle

### 2.1 Lifecycle Stages

```
┌──────────┐
│ Planning │ ─────┐
└──────────┘      │
                  ▼
┌──────────┐   ┌──────────┐
│ Creation │◄──│ Approval │
└────┬─────┘   └──────────┘
     │
     ▼
┌──────────┐
│  Setup   │
└────┬─────┘
     │
     ▼
┌──────────┐
│  Active  │◄─────┐
└────┬─────┘      │
     │            │
     ├────────────┘
     │
     ▼
┌──────────┐   ┌────────────┐
│Deprecated│──▶│  Archived  │
└──────────┘   └────────────┘
     │
     ▼
┌──────────┐
│ Deleted  │
└──────────┘
```

### 2.2 Stage Descriptions

#### 2.2.1 Planning
- Identify need for new repository
- Define purpose and scope
- Determine ownership and team
- Plan initial structure

#### 2.2.2 Approval
- Submit creation request
- Review by WP/Group lead
- Approval by Technical Coordinator
- Resource allocation

#### 2.2.3 Creation
- Repository created in organization
- Initial structure set up
- Access permissions configured
- Basic files added

#### 2.2.4 Setup
- Complete configuration
- Add required files
- Configure branch protection
- Set up CI/CD (if needed)
- Add team members

#### 2.2.5 Active
- Regular development activity
- Issue management
- Pull request reviews
- Release management
- Documentation updates
- Community engagement

#### 2.2.6 Deprecated
- No longer actively maintained
- Security updates only
- Migration path provided
- Clear deprecation notice
- Scheduled for archival

#### 2.2.7 Archived
- Read-only status
- No further changes
- Preserved for reference
- Clear archival notice
- Historical record maintained

#### 2.2.8 Deleted
- Permanently removed
- Only in exceptional cases
- Full backup maintained
- Documented reason for deletion

### 2.3 Lifecycle Duration

**Typical Timelines:**

| Stage | Duration | Notes |
|-------|----------|-------|
| Planning | 1-2 weeks | Varies by complexity |
| Approval | 2-5 days | Depends on availability |
| Creation | 1 day | Quick process |
| Setup | 1-3 days | Initial configuration |
| Active | Ongoing | Project duration |
| Deprecated | 3-6 months | Before archival |
| Archived | Indefinite | Permanent preservation |

---

## 3. Creating New Repositories

### 3.1 When to Create a New Repository

Create a new repository when:

✅ **Starting a new component or service**
✅ **Separating concerns** (e.g., API from UI)
✅ **Creating standalone tools or libraries**
✅ **Establishing new group workspace**
✅ **Developing specifications or standards**
✅ **Setting up test frameworks**

❌ **Don't create new repository for:**
- Small features (use branches instead)
- Temporary experiments (use personal repos)
- Duplicate functionality
- Single files or scripts

### 3.2 Repository Creation Request

#### 3.2.1 Request Template

Submit to WP/Group lead:

```markdown
## Repository Creation Request

### Basic Information
- **Repository Name:** wp4-trust-api
- **Purpose:** Trust infrastructure API implementation
- **Type:** Code Repository
- **Work Package:** WP4
- **Group:** Trust Infrastructure
- **Visibility:** Public

### Justification
Explain why this repository is needed and how it fits into the project architecture.

### Scope
- What will be included
- What will NOT be included
- Boundaries and interfaces

### Team
- **Owner:** [Group Lead Name]
- **Maintainers:** [List names]
- **Initial Contributors:** [List names]

### Technical Details
- **Primary Language:** Python
- **Framework:** FastAPI
- **Dependencies:** [Key dependencies]
- **Integration Points:** [Other repos/services]

### Initial Structure
```
wp4-trust-api/
├── src/
├── tests/
├── docs/
├── README.md
├── LICENSE
└── CONTRIBUTING.md
```

### Timeline
- **Requested Start Date:** [YYYY-MM-DD]
- **Expected First Release:** [YYYY-MM-DD]

### Resources Required
- CI/CD pipeline: Yes
- External services: [List if any]
- Special permissions: [List if any]

### Approvals
- [ ] Group Lead: [Name]
- [ ] WP Lead: [Name]
- [ ] Technical Coordinator: [Pending]
```

#### 3.2.2 Approval Process

```
┌─────────────────┐
│ Submit Request  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Group Lead     │
│  Reviews        │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  WP Lead        │
│  Approves       │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Tech Coord     │
│  Final Approval │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Repository     │
│  Created        │
└─────────────────┘
```

**Approval Criteria:**
- Clear purpose and scope
- No duplication of existing repos
- Appropriate team identified
- Resources available
- Aligns with project goals
- Follows naming conventions

### 3.3 Creating the Repository

#### 3.3.1 For Technical Coordinator

**Steps to create repository:**

1. **Navigate to Organization:**
   - Go to [https://github.com/webuild-consortium](https://github.com/webuild-consortium)
   - Click "New repository"

2. **Configure Repository:**
   ```
   Repository name: wp4-trust-api
   Description: Trust infrastructure API implementation for WEBUILD
   Visibility: Public
   Initialize with:
   ☑ README
   ☑ .gitignore (select template)
   ☑ License: Apache License 2.0
   ```

3. **Create Repository:**
   - Click "Create repository"
   - Note repository URL

4. **Initial Configuration:**
   - Add topics/tags
   - Configure settings
   - Set up branch protection
   - Add teams

5. **Notify Requestor:**
   - Send repository URL
   - Confirm access granted
   - Provide next steps

#### 3.3.2 Using GitHub CLI

```bash
# Create repository
gh repo create webuild-consortium/wp4-trust-api \
  --public \
  --description "Trust infrastructure API implementation" \
  --license apache-2.0 \
  --gitignore Python

# Clone locally
gh repo clone webuild-consortium/wp4-trust-api

# Set up initial structure
cd wp4-trust-api
mkdir -p src tests docs
touch CONTRIBUTING.md
git add .
git commit -m "chore: initial repository structure"
git push origin main
```

### 3.4 Post-Creation Setup

#### 3.4.1 Required Files Checklist

- [ ] **README.md** - Project overview and documentation
- [ ] **LICENSE** - Apache 2.0 license file
- [ ] **CONTRIBUTING.md** - Contribution guidelines
- [ ] **.gitignore** - Files to ignore
- [ ] **CODE_OF_CONDUCT.md** - Community standards
- [ ] **SECURITY.md** - Security policy
- [ ] **.github/** - GitHub-specific configs

#### 3.4.2 README.md Template

```markdown
# [Repository Name]

Brief description of the repository purpose.

## Overview

Detailed description of what this repository contains and its role in the WEBUILD project.

## Features

- Feature 1
- Feature 2
- Feature 3

## Getting Started

### Prerequisites

- Requirement 1
- Requirement 2

### Installation

```bash
# Installation commands
```

### Usage

```bash
# Usage examples
```

## Documentation

- [API Documentation](docs/api.md)
- [Architecture](docs/architecture.md)
- [Contributing Guidelines](CONTRIBUTING.md)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

Licensed under the Apache License 2.0 - see [LICENSE](LICENSE) file for details.

## Funding

![Co-funded by the European Union](https://github.com/EWC-consortium/ewc-wiki/assets/455274/1ac9b4e3-06b9-4c3c-a2af-ec5fbf584517)

The WEBUILD project is co-funded by the European Union. However, the views and opinions expressed are those of the author(s) only and do not necessarily reflect those of the European Union or the granting authority. Neither the European Union nor the granting authority can be held responsible.

## Contact

For questions and support, please open an issue or contact the maintainers.
```

---

## 4. Repository Configuration

### 4.1 General Settings

#### 4.1.1 Repository Details

**Navigate to:** Settings → General

**Configure:**
```
Name: wp4-trust-api
Description: Trust infrastructure API implementation for WEBUILD
Website: https://webuild-consortium.eu (if applicable)
Topics: webuild-consortium, eudi-wallet, trust-infrastructure, api
```

**Features:**
- ☑ Issues
- ☑ Projects (if used)
- ☐ Wiki (use docs/ instead)
- ☑ Discussions (optional)
- ☑ Sponsorships (disabled)

**Pull Requests:**
- ☑ Allow merge commits
- ☑ Allow squash merging (recommended)
- ☑ Allow rebase merging
- ☑ Always suggest updating pull request branches
- ☑ Automatically delete head branches

### 4.2 Branch Protection Rules

#### 4.2.1 Protect Main Branch

**Navigate to:** Settings → Branches → Add rule

**Branch name pattern:** `main`

**Protection Rules:**

✅ **Require pull request reviews before merging**
- Required approving reviews: 1
- Dismiss stale pull request approvals when new commits are pushed
- Require review from Code Owners (if CODEOWNERS file exists)

✅ **Require status checks to pass before merging**
- Require branches to be up to date before merging
- Status checks: (add CI/CD checks)

✅ **Require conversation resolution before merging**

✅ **Require signed commits** (optional, recommended)

✅ **Require linear history** (optional)

✅ **Include administrators**

❌ **Allow force pushes** (disabled)

❌ **Allow deletions** (disabled)

#### 4.2.2 Protect Develop Branch (if using GitFlow)

**Branch name pattern:** `develop`

**Similar rules to main, but:**
- May allow force pushes for maintainers
- May have different status check requirements

### 4.3 Access and Permissions

#### 4.3.1 Team Access

**Navigate to:** Settings → Collaborators and teams

**Add Teams:**

| Team | Permission Level | Purpose |
|------|-----------------|---------|
| `@webuild-consortium/wp4-trust` | Write | Group members |
| `@webuild-consortium/wp4-all` | Read | WP visibility |
| `@webuild-consortium/trust-maintainers` | Maintain | Repository maintainers |

#### 4.3.2 Individual Collaborators

Only add individual collaborators for:
- External contributors
- Temporary access
- Special cases

**Prefer team-based access for consortium members.**

### 4.4 Security Settings

#### 4.4.1 Security Features

**Navigate to:** Settings → Security & analysis

**Enable:**

✅ **Dependency graph**
- Automatically enabled for public repos
- Shows repository dependencies

✅ **Dependabot alerts**
- Get notified of security vulnerabilities
- Automatic security updates

✅ **Dependabot security updates**
- Automatically create PRs for security fixes

✅ **Secret scanning**
- Detect committed secrets
- Receive alerts for exposed secrets

✅ **Code scanning** (if applicable)
- Automated code security analysis
- Configure via GitHub Actions

#### 4.4.2 Security Policy

Create `SECURITY.md`:

```markdown
# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 1.x.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

**Do not report security vulnerabilities through public GitHub issues.**

Instead, please report them via:
1. Email to [security contact]
2. Private security advisory on GitHub

Include:
- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if any)

We will respond within 48 hours and provide updates on the fix timeline.

## Security Update Process

1. Vulnerability reported
2. Assessment and verification
3. Fix development
4. Security advisory published
5. Patch released
6. Public disclosure
```

### 4.5 Automation and Integrations

#### 4.5.1 GitHub Actions

**Create:** `.github/workflows/ci.yml`

```yaml
name: CI

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main, develop ]

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3

    - name: Set up environment
      uses: actions/setup-python@v4
      with:
        python-version: '3.11'

    - name: Install dependencies
      run: |
        pip install -r requirements.txt
        pip install -r requirements-dev.txt

    - name: Run linter
      run: |
        flake8 src/

    - name: Run tests
      run: |
        pytest tests/ --cov=src/

    - name: Upload coverage
      uses: codecov/codecov-action@v3
```

#### 4.5.2 Issue Templates

**Create:** `.github/ISSUE_TEMPLATE/bug_report.md`

```markdown
---
name: Bug Report
about: Create a report to help us improve
title: '[BUG] '
labels: bug
assignees: ''
---

## Description
A clear description of the bug.

## Steps to Reproduce
1. Step one
2. Step two
3. ...

## Expected Behavior
What should happen.

## Actual Behavior
What actually happens.

## Environment
- OS: [e.g., Ubuntu 22.04]
- Version: [e.g., 1.2.3]
- Browser: [if applicable]

## Additional Context
Any other relevant information.
```

#### 4.5.3 Pull Request Template

**Create:** `.github/PULL_REQUEST_TEMPLATE.md`

```markdown
## Description
Brief description of changes.

## Related Issues
Closes #

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Tests pass locally
- [ ] New tests added
- [ ] Manual testing completed

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] No new warnings
```

---

## 5. Maintaining Repositories

### 5.1 Regular Maintenance Tasks

#### 5.1.1 Daily/Weekly Tasks

**For Active Repositories:**

- [ ] **Monitor Issues:**
  - Triage new issues
  - Respond to questions
  - Label appropriately
  - Assign to team members

- [ ] **Review Pull Requests:**
  - Review new PRs within 2 days
  - Provide constructive feedback
  - Approve or request changes
  - Merge approved PRs

- [ ] **Check CI/CD:**
  - Monitor build status
  - Fix failing builds
  - Update dependencies
  - Review security alerts

#### 5.1.2 Monthly Tasks

- [ ] **Dependency Updates:**
  - Review Dependabot PRs
  - Update dependencies
  - Test compatibility
  - Merge updates

- [ ] **Security Review:**
  - Check security alerts
  - Review access permissions
  - Audit recent changes
  - Update security policy

- [ ] **Documentation:**
  - Update README if needed
  - Review and update docs
  - Check for broken links
  - Update examples

- [ ] **Cleanup:**
  - Close stale issues
  - Delete merged branches
  - Archive old discussions
  - Update milestones

#### 5.1.3 Quarterly Tasks

- [ ] **Access Review:**
  - Review team members
  - Remove inactive users
  - Update permissions
  - Verify access levels

- [ ] **Performance Review:**
  - Analyze repository metrics
  - Review contribution patterns
  - Identify bottlenecks
  - Plan improvements

- [ ] **Strategic Planning:**
  - Review roadmap
  - Update milestones
  - Plan next release
  - Gather feedback

### 5.2 Issue Management

#### 5.2.1 Issue Triage Process

```
┌─────────────┐
│  New Issue  │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Review    │
│   Content   │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│    Label    │
│   & Assign  │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Prioritize │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Action    │
└─────────────┘
```

**Triage Checklist:**

1. **Understand the issue:**
   - Read description carefully
   - Ask clarifying questions
   - Reproduce if bug report

2. **Categorize:**
   - Add type label (bug, enhancement, etc.)
   - Add priority label (high, medium, low)
   - Add component label (api, docs, tests)

3. **Assign:**
   - Assign to appropriate team member
   - Add to project board
   - Link to milestone

4. **Respond:**
   - Acknowledge receipt
   - Provide timeline estimate
   - Ask for additional info if needed

#### 5.2.2 Issue Labels

**Standard Labels:**

| Label | Color | Description |
|-------|-------|-------------|
| `bug` | #d73a4a | Something isn't working |
| `enhancement` | #a2eeef | New feature or request |
| `documentation` | #0075ca | Documentation improvements |
| `question` | #d876e3 | Further information requested |
| `help wanted` | #008672 | Extra attention needed |
| `good first issue` | #7057ff | Good for newcomers |
| `wontfix` | #ffffff | This will not be worked on |
| `duplicate` | #cfd3d7 | Duplicate of another issue |
| `invalid` | #e4e669 | Invalid issue |
| `security` | #ee0701 | Security-related |

**Priority Labels:**

- `priority: high` - Critical, needs immediate attention
- `priority: medium` - Important, should be addressed soon
- `priority: low` - Nice to have, can wait

### 5.3 Release Management

#### 5.3.1 Release Process

```
┌─────────────┐
│   Plan      │
│   Release   │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Create    │
│   Branch    │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Test &    │
│   Fix       │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Update    │
│   Changelog │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Tag &     │
│   Release   │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Deploy    │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Announce   │
└─────────────┘
```

#### 5.3.2 Semantic Versioning

Follow [Semantic Versioning 2.0.0](https://semver.org/):

**Format:** `MAJOR.MINOR.PATCH`

- **MAJOR:** Incompatible API changes
- **MINOR:** Backwards-compatible new features
- **PATCH:** Backwards-compatible bug fixes

**Examples:**
- `1.0.0` - Initial release
- `1.1.0` - New feature added
- `1.1.1` - Bug fix
- `2.0.0` - Breaking changes

**Pre-release versions:**
- `1.0.0-alpha.1` - Alpha release
- `1.0.0-beta.1` - Beta release
- `1.0.0-rc.1` - Release candidate

#### 5.3.3 Creating a Release

**Steps:**

1. **Prepare Release Branch:**
```bash
git checkout develop
git pull origin develop
git checkout -b release/v1.2.0
```

2. **Update Version:**
```bash
# Update version in package.json, setup.py, etc.
# Update CHANGELOG.md
git add .
git commit -m "chore: prepare release v1.2.0"
```

3. **Test Release:**
```bash
# Run all tests
# Perform manual testing
# Fix any issues
```

4. **Merge to Main:**
```bash
git checkout main
git merge release/v1.2.0
git push origin main
```

5. **Create Tag:**
```bash
git tag -a v1.2.0 -m "Release version 1.2.0"
git push origin v1.2.0
```

6. **Create GitHub Release:**
   - Go to repository → Releases
   - Click "Draft a new release"
   - Select tag: v1.2.0
   - Title: "Version 1.2.0"
   - Description: Copy from CHANGELOG
   - Attach binaries if applicable
   - Click "Publish release"

7. **Merge Back to Develop:**
```bash
git checkout develop
git merge main
git push origin develop
```

8. **Clean Up:**
```bash
git branch -d release/v1.2.0
git push origin --delete release/v1.2.0
```

#### 5.3.4 CHANGELOG.md Format

```markdown
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/),
and this project adheres to [Semantic Versioning](https://semver.org/).

## [Unreleased]

### Added
- New features in development

### Changed
- Changes to existing features

### Deprecated
- Features to be removed

### Removed
- Removed features

### Fixed
- Bug fixes

### Security
- Security fixes

## [1.2.0] - 2025-10-22

### Added
- User authentication with JWT
- API rate limiting
- Comprehensive API documentation

### Changed
- Improved error handling
- Updated dependencies

### Fixed
- Fixed login timeout issue
- Resolved memory leak in cache

## [1.1.0] - 2025-09-15

...
```

### 5.4 Documentation Maintenance

#### 5.4.1 Documentation Structure

```
docs/
├── README.md              # Documentation index
├── getting-started.md     # Quick start guide
├── installation.md        # Installation instructions
├── configuration.md       # Configuration guide
├── api/                   # API documentation
│   ├── README.md
│   ├── authentication.md
│   └── endpoints.md
├── architecture/          # Architecture docs
│   ├── overview.md
│   └── components.md
├── guides/                # How-to guides
│   ├── deployment.md
│   └── troubleshooting.md
└── contributing/          # Contribution docs
    ├── development.md
    └── testing.md
```

#### 5.4.2 Documentation Review

**Regular Reviews:**

- [ ] Check for accuracy
- [ ] Update outdated information
- [ ] Fix broken links
- [ ] Improve clarity
- [ ] Add missing sections
- [ ] Update examples
- [ ] Review screenshots

---

## 6. Repository Templates

### 6.1 Using Templates

**Benefits of templates:**
- Consistent structure
- Required files included
- Faster repository creation
- Best practices enforced

### 6.2 Creating a Template Repository

**Steps:**

1. Create repository with ideal structure
2. Add all required files
3. Configure settings
4. Go to Settings → Template repository
5. Check "Template repository"

**Template Contents:**

```
template-repo/
├── .github/
│   ├── workflows/
│   │   └── ci.yml
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.md
│   │   └── feature_request.md
│   └── PULL_REQUEST_TEMPLATE.md
├── docs/
│   └── README.md
├── src/
│   └── .gitkeep
├── tests/
│   └── .gitkeep
├── .gitignore
├── .editorconfig
├── README.md
├── LICENSE
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
└── SECURITY.md
```

### 6.3 Using a Template

**Create from template:**

1. Go to template repository
2. Click "Use this template"
3. Enter repository name
4. Choose visibility
5. Click "Create repository from template"
6. Customize for specific needs

---

## 7. Archiving and Deprecation

### 7.1 When to Archive

Archive a repository when:

✅ Project completed
✅ No longer maintained
✅ Replaced by newer version
✅ End of project phase
✅ Historical reference only

### 7.2 Deprecation Process

#### 7.2.1 Deprecation Notice

**Add to README.md:**

```markdown
# ⚠️ DEPRECATED

**This repository is deprecated and no longer maintained.**

**Reason:** [Explain why deprecated]

**Alternative:** Please use [new-repository](https://github.com/webuild-consortium/new-repository) instead.

**Migration Guide:** See [MIGRATION.md](MIGRATION.md) for migration instructions.

**Support:** Security fixes only until [date]. No new features will be added.

---

[Original README content follows...]
```

#### 7.2.2 Deprecation Checklist

- [ ] Add deprecation notice to README
- [ ] Create migration guide
- [ ] Update documentation
- [ ] Notify users (issues, discussions)
- [ ] Add deprecation label to issues
- [ ] Update related repositories
- [ ] Set deprecation timeline
- [ ] Plan archival date

### 7.3 Archiving Process

#### 7.3.1 Pre-Archive Checklist

- [ ] All issues resolved or transferred
- [ ] All PRs merged or closed
- [ ] Documentation complete
- [ ] Migration guide available
- [ ] Users notified
- [ ] Alternative solution documented
- [ ] Final release tagged
- [ ] Backup created

#### 7.3.2 Archive Repository

**Steps:**

1. **Final Update:**
```bash
# Add archive notice
echo "# ARCHIVED\n\nThis repository has been archived..." > ARCHIVE.md
git add ARCHIVE.md
git commit -m "chore: archive repository"
git push origin main
```

2. **Create Final Release:**
   - Tag final version
   - Create GitHub release
   - Mark as "archived" in release notes

3. **Archive on GitHub:**
   - Go to Settings → General
   - Scroll to "Danger Zone"
   - Click "Archive this repository"
   - Confirm archival

**Effects of archiving:**
- Repository becomes read-only
- No new issues or PRs
- No new commits
- Existing content preserved
- Still visible and clonable
- Can be unarchived if needed

#### 7.3.3 Post-Archive

- [ ] Update organization documentation
- [ ] Remove from active project lists
- [ ] Update related repositories
- [ ] Notify stakeholders
- [ ] Document archival reason
- [ ] Update website/documentation

---

## 8. Repository Deletion

### 8.1 When Deletion is Appropriate

⚠️ **Deletion is rare and requires strong justification.**

**Valid reasons:**
- Created by mistake
- Duplicate repository
- Contains sensitive data (after cleanup)
- Legal requirement
- Security incident

**Invalid reasons:**
- No longer needed (use archival instead)
- Low activity (use archival instead)
- Outdated (use archival instead)

### 8.2 Deletion Process

#### 8.2.1 Pre-Deletion Requirements

**Must have:**
- [ ] Written justification
- [ ] Approval from WP lead
- [ ] Approval from Technical Coordinator
- [ ] Full backup created
- [ ] No active dependencies
- [ ] Users notified (if applicable)
- [ ] Alternative documented (if applicable)

#### 8.2.2 Backup Creation

```bash
# Clone with full history
git clone --mirror git@github.com:webuild-consortium/repo-name.git

# Create archive
tar -czf repo-name-backup-$(date +%Y%m%d).tar.gz repo-name.git/

# Store backup securely
# Document backup location
```

#### 8.2.3 Delete Repository

**Steps:**

1. **Final Verification:**
   - Confirm backup exists
   - Verify no dependencies
   - Check all approvals

2. **Delete on GitHub:**
   - Go to Settings → General
   - Scroll to "Danger Zone"
   - Click "Delete this repository"
   - Type repository name to confirm
   - Click "I understand, delete this repository"

3. **Document Deletion:**
```markdown
## Repository Deletion Log

Date: [YYYY-MM-DD]
Repository: webuild-consortium/repo-name
Reason: [Detailed reason]
Approved By:
- WP Lead: [Name]
- Technical Coordinator: [Name]
Backup Location: [Path/URL]
Deleted By: [Name]
```

---

## 9. Best Practices

### 9.1 Repository Organization

✅ **Do:**
- Use clear, descriptive names
- Follow naming conventions