# Guide: Creating a New Repository

This guide provides step-by-step instructions for creating a new repository in the WEBUILD Consortium GitHub organization.

## Table of Contents

- [Before You Start](#before-you-start)
- [Repository Creation Process](#repository-creation-process)
- [Initial Setup](#initial-setup)
- [Adding Required Files](#adding-required-files)
- [Configuring Repository Settings](#configuring-repository-settings)
- [Setting Up Branch Protection](#setting-up-branch-protection)
- [Adding Team Access](#adding-team-access)
- [Best Practices](#best-practices)
- [Troubleshooting](#troubleshooting)

## Before You Start

### Prerequisites

Before creating a new repository, ensure you have:

- [ ] **GitHub Account** with access to the WEBUILD Consortium organization
- [ ] **Appropriate Permissions** (Owner or Admin role)
- [ ] **Clear Purpose** for the repository
- [ ] **Approval** from project coordinator (if required)
- [ ] **Repository Name** following naming conventions
- [ ] **License Decision** (typically Apache 2.0)

### Planning Checklist

- [ ] Define repository purpose and scope
- [ ] Identify target audience (developers, researchers, etc.)
- [ ] Determine visibility (public or private initially)
- [ ] Plan repository structure
- [ ] Identify required collaborators
- [ ] Review naming conventions
- [ ] Check for existing similar repositories

### Naming Conventions

Follow these naming conventions for WEBUILD repositories:

**Format**: `[wp-number]-[component-name]`

**Examples**:
- `wp4-interop-test-bed` - WP4 Interoperability Test Bed
- `wp4-qtsp-group` - WP4 QTSP Group
- `wp4-semantics-group` - WP4 Semantics Group
- `wp4-trust-group` - WP4 Trust Group
- `wp4-wallets-group` - WP4 Wallets Group

**Rules**:
- Use lowercase letters
- Use hyphens to separate words
- Include work package number if applicable
- Be descriptive but concise
- Avoid abbreviations unless widely known

## Repository Creation Process

### Step 1: Navigate to Organization

1. Go to [https://github.com/webuild-consortium](https://github.com/webuild-consortium)
2. Click on the **"Repositories"** tab
3. Click the green **"New repository"** button

### Step 2: Configure Basic Settings

Fill in the repository details:

#### Repository Name
```
[wp-number]-[component-name]
```

**Example**: `wp4-interop-test-bed`

#### Description

Provide a clear, concise description (50-100 characters):

```
[Brief description of the repository purpose and main functionality]
```

**Example**: "WEBUILD WP4 Interoperability Test Bed for digital identity solutions"

#### Visibility

Choose the appropriate visibility:

- **Private**: For initial development (recommended)
  - Use for work in progress
  - Use for sensitive or incomplete code
  - Can be made public later

- **Public**: For open collaboration
  - Use for stable, documented code
  - Use when ready for community contributions
  - Requires approval from project coordinator

**Recommendation**: Start with **Private** and make public when ready.

#### Initialize Repository

Select the following options:

- [x] **Add a README file**
  - Provides initial documentation
  - Required for all repositories

- [x] **Add .gitignore**
  - Select template based on your technology stack
  - Common options: Node, Python, Java, Go, etc.

- [x] **Choose a license**
  - Select **Apache License 2.0**
  - Required for all WEBUILD repositories

### Step 3: Create Repository

1. Review all settings
2. Click **"Create repository"**
3. Wait for repository creation confirmation

## Initial Setup

### Step 1: Clone Repository Locally

```bash
# Clone the repository
git clone https://github.com/webuild-consortium/[REPOSITORY-NAME].git

# Navigate to repository directory
cd [REPOSITORY-NAME]

# Verify remote
git remote -v
```

### Step 2: Set Up Local Configuration

```bash
# Configure user information (if not already set)
git config user.name "Your Name"
git config user.email "your.email@example.com"

# Set default branch name
git config init.defaultBranch main

# Enable automatic line ending conversion
git config core.autocrlf input  # For Mac/Linux
git config core.autocrlf true   # For Windows
```

### Step 3: Create Initial Branch Structure

```bash
# Ensure you're on main branch
git checkout main

# Create and push develop branch
git checkout -b develop
git push -u origin develop

# Return to main
git checkout main
```

## Adding Required Files

### Step 1: Update README.md

Use the [README template](../templates/README-template.md):

```bash
# Copy template
cp docs/templates/README-template.md README.md

# Edit with your project details
# Replace all [PLACEHOLDERS] with actual values
```

**Required sections**:
- Project overview
- Installation instructions
- Usage examples
- Contributing guidelines
- License information
- EU funding acknowledgment

### Step 2: Add CONTRIBUTING.md

Use the [CONTRIBUTING template](../templates/CONTRIBUTING-template.md):

```bash
# Copy template
cp docs/templates/CONTRIBUTING-template.md CONTRIBUTING.md

# Customize for your project
```

### Step 3: Add CODE_OF_CONDUCT.md

Use the [Code of Conduct template](../templates/CODE_OF_CONDUCT.md):

```bash
# Copy template
cp docs/templates/CODE_OF_CONDUCT.md CODE_OF_CONDUCT.md

# Update contact information
```

### Step 4: Add SECURITY.md

Use the [Security Policy template](../templates/SECURITY.md):

```bash
# Copy template
cp docs/templates/SECURITY-template.md SECURITY.md

# Update security contacts and procedures
```

### Step 5: Add Issue Templates

```bash
# Create .github directory structure
mkdir -p .github/ISSUE_TEMPLATE

# Copy issue templates
cp docs/templates/ISSUE_TEMPLATE/bug_report.md .github/ISSUE_TEMPLATE/
cp docs/templates/ISSUE_TEMPLATE/feature_request.md .github/ISSUE_TEMPLATE/
cp docs/templates/ISSUE_TEMPLATE/question.md .github/ISSUE_TEMPLATE/
```

### Step 6: Add Pull Request Template

```bash
# Copy PR template
cp docs/templates/PULL_REQUEST_TEMPLATE.md .github/PULL_REQUEST_TEMPLATE.md
```

### Step 7: Commit and Push

```bash
# Add all files
git add .

# Commit with descriptive message
git commit -m "docs: add required documentation files

- Add README with project overview
- Add CONTRIBUTING guidelines
- Add CODE_OF_CONDUCT
- Add SECURITY policy
- Add issue and PR templates"

# Push to remote
git push origin main
```

## Configuring Repository Settings

### Step 1: Access Repository Settings

1. Navigate to your repository on GitHub
2. Click **"Settings"** tab
3. Review and configure the following sections

### Step 2: General Settings

#### Features

Enable the following features:

- [x] **Issues** - For bug tracking and feature requests
- [x] **Projects** - For project management (optional)
- [ ] **Wiki** - Disable (use docs/ directory instead)
- [x] **Discussions** - For community discussions (optional)

#### Pull Requests

Configure PR settings:

- [x] **Allow squash merging** - Recommended
- [ ] **Allow merge commits** - Optional
- [ ] **Allow rebase merging** - Optional
- [x] **Automatically delete head branches** - Recommended

#### Archives

- [ ] **Do not archive this repository** - Keep active

### Step 3: Collaborators and Teams

Add appropriate teams:

1. Go to **Settings** > **Collaborators and teams**
2. Click **"Add teams"**
3. Add relevant teams with appropriate permissions:

| Team | Permission Level | Purpose |
|------|-----------------|---------|
| [WP-Team] | Write | Development team |
| [Reviewers] | Write | Code reviewers |
| [Admins] | Admin | Repository administrators |

### Step 4: Branch Protection Rules

See [Setting Up Branch Protection](#setting-up-branch-protection) section below.

### Step 5: Security Settings

1. Go to **Settings** > **Security**
2. Enable **Dependabot alerts**
3. Enable **Dependabot security updates**
4. Enable **Code scanning** (if available)
5. Configure **Secret scanning**

## Setting Up Branch Protection

### Protecting Main Branch

1. Go to **Settings** > **Branches**
2. Click **"Add rule"**
3. Configure the following:

#### Branch Name Pattern
```
main
```

#### Protection Rules

- [x] **Require a pull request before merging**
  - [x] Require approvals: **1** (minimum)
  - [x] Dismiss stale pull request approvals when new commits are pushed
  - [x] Require review from Code Owners (if CODEOWNERS file exists)

- [x] **Require status checks to pass before merging**
  - [x] Require branches to be up to date before merging
  - Select required status checks (CI/CD pipelines)

- [x] **Require conversation resolution before merging**

- [x] **Require signed commits** (optional but recommended)

- [x] **Include administrators** (enforce rules for admins too)

- [ ] **Allow force pushes** (keep disabled)

- [ ] **Allow deletions** (keep disabled)

4. Click **"Create"** to save the rule

### Protecting Develop Branch

Repeat the process for the `develop` branch with similar settings.

## Adding Team Access

### Step 1: Identify Required Teams

Determine which teams need access:

- **Core Development Team**: Write access
- **Review Team**: Write access
- **Documentation Team**: Write access
- **Project Management**: Admin access

### Step 2: Add Teams

1. Go to **Settings** > **Collaborators and teams**
2. Click **"Add teams"**
3. Search for team name
4. Select permission level:
   - **Read**: View and clone
   - **Triage**: Manage issues and PRs
   - **Write**: Push to repository
   - **Maintain**: Manage repository settings
   - **Admin**: Full access

5. Click **"Add [team-name] to this repository"**

### Step 3: Verify Access

1. Ask team members to verify they can access the repository
2. Test permissions by having team members perform typical actions
3. Adjust permissions if needed

## Best Practices

### Repository Structure

Organize your repository with a clear structure:

```
repository-name/
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.md
│   │   ├── feature_request.md
│   │   └── question.md
│   ├── workflows/
│   │   └── ci.yml
│   └── PULL_REQUEST_TEMPLATE.md
├── docs/
│   ├── architecture.md
│   ├── api-reference.md
│   └── user-guide.md
├── src/
│   └── [source code]
├── tests/
│   └── [test files]
├── .gitignore
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── LICENSE
├── README.md
└── SECURITY.md
```

### Documentation

- **Keep README updated**: Reflect current state of the project
- **Document architecture**: Explain design decisions
- **Provide examples**: Include code samples and use cases
- **Maintain changelog**: Track all significant changes
- **Update regularly**: Review and update docs with each release

### Version Control

- **Use meaningful commit messages**: Follow conventional commits
- **Keep commits atomic**: One logical change per commit
- **Write descriptive PR descriptions**: Explain what and why
- **Reference issues**: Link commits and PRs to issues
- **Tag releases**: Use semantic versioning

### Security

- **Never commit secrets**: Use environment variables
- **Review dependencies**: Keep dependencies updated
- **Enable security features**: Use Dependabot and scanning
- **Follow security policy**: Report vulnerabilities properly
- **Use signed commits**: Verify commit authenticity

### Collaboration

- **Communicate clearly**: Use issues and discussions
- **Review code thoroughly**: Provide constructive feedback
- **Be responsive**: Reply to issues and PRs promptly
- **Welcome contributors**: Be friendly and helpful
- **Acknowledge contributions**: Credit contributors properly

## Troubleshooting

### Common Issues

#### Issue: Cannot Create Repository

**Symptoms**: "You don't have permission to create repositories"

**Solution**:
1. Verify you're a member of the WEBUILD organization
2. Check your role (must be Owner or Admin)
3. Contact organization administrator for access

#### Issue: Branch Protection Not Working

**Symptoms**: Can push directly to protected branch

**Solution**:
1. Verify branch protection rules are saved
2. Check if "Include administrators" is enabled
3. Ensure you're not using a personal access token with admin override

#### Issue: Team Members Cannot Access Repository

**Symptoms**: Team members get 404 error

**Solution**:
1. Verify team has been added to repository
2. Check team members are part of the team
3. Ensure repository visibility matches team access level
4. Ask members to accept organization invitation

#### Issue: Templates Not Appearing

**Symptoms**: Issue/PR templates don't show up

**Solution**:
1. Verify templates are in `.github/ISSUE_TEMPLATE/` directory
2. Check file names match exactly
3. Ensure YAML frontmatter is correct
4. Wait a few minutes for GitHub to process changes
5. Clear browser cache and reload

### Getting Help

If you encounter issues not covered here:

1. **Check Documentation**: Review [GitHub Policies and Guidelines](../01-github-policies-and-guidelines.md)
2. **Search Issues**: Look for similar problems in existing issues
3. **Ask the Team**: Post in GitHub Discussions or team chat
4. **Contact Admins**: Reach out to repository administrators
5. **GitHub Support**: For platform-specific issues

## Checklist

Use this checklist to ensure you've completed all steps:

### Pre-Creation
- [ ] Obtained necessary approvals
- [ ] Determined repository name following conventions
- [ ] Decided on initial visibility (private/public)
- [ ] Identified required collaborators

### Creation
- [ ] Created repository in WEBUILD organization
- [ ] Added README, .gitignore, and LICENSE
- [ ] Cloned repository locally
- [ ] Set up local Git configuration

### Documentation
- [ ] Updated README with project details
- [ ] Added CONTRIBUTING guidelines
- [ ] Added CODE_OF_CONDUCT
- [ ] Added SECURITY policy
- [ ] Added issue templates
- [ ] Added PR template

### Configuration
- [ ] Enabled required features (Issues, Projects, etc.)
- [ ] Configured PR settings
- [ ] Set up branch protection for main
- [ ] Set up branch protection for develop
- [ ] Added teams with appropriate permissions
- [ ] Enabled security features (Dependabot, etc.)

### Verification
- [ ] Verified all documentation is complete
- [ ] Tested branch protection rules
- [ ] Confirmed team access works
- [ ] Reviewed repository settings
- [ ] Notified team members

## Next Steps

After creating your repository:

1. **Set Up CI/CD**: Configure automated testing and deployment
2. **Create Project Board**: Set up project management tools
3. **Add Initial Code**: Begin development work
4. **Invite Contributors**: Onboard team members
5. **Plan First Release**: Define milestones and goals

## Related Documentation

- [GitHub Policies and Guidelines](../01-github-policies-and-guidelines.md)
- [Repository Management](../04-repository-management.md)
- [Making Repository Public Guide](./making-repository-public.md)
- [Access Management Guide](./access-management.md)
- [Onboarding Procedures](../03-onboarding-procedures.md)

---

**WEBUILD Consortium Project**

This project is funded by the European Union under [GRANT NUMBER/PROGRAM]. Views and opinions expressed are however those of the author(s) only and do not necessarily reflect those of the European Union or [FUNDING AGENCY]. Neither the European Union nor the granting authority can be held responsible for them.