# Guide: Making a Repository Public

This guide provides step-by-step instructions for transitioning a private WEBUILD Consortium repository to public visibility.

## Table of Contents

- [Overview](#overview)
- [Before You Start](#before-you-start)
- [Pre-Publication Checklist](#pre-publication-checklist)
- [Security Review](#security-review)
- [Documentation Review](#documentation-review)
- [Making Repository Public](#making-repository-public)
- [Post-Publication Steps](#post-publication-steps)
- [Best Practices](#best-practices)
- [Troubleshooting](#troubleshooting)

## Overview

### Why Make Repositories Public?

Making repositories public supports:

- **Open Source Principles**: Transparency and collaboration
- **EU Funding Requirements**: Public dissemination of results
- **Community Engagement**: Broader participation and feedback
- **Knowledge Sharing**: Contributing to the wider ecosystem
- **Project Visibility**: Showcasing WEBUILD achievements

### When to Make Public

Consider making a repository public when:

- ✅ Code is stable and well-documented
- ✅ Security review is complete
- ✅ No sensitive information is present
- ✅ Project coordinator approval obtained
- ✅ Documentation is comprehensive
- ✅ License is properly applied
- ✅ EU funding acknowledgments are in place

### When to Keep Private

Keep repositories private if:

- ❌ Contains work in progress or experimental code
- ❌ Includes sensitive or proprietary information
- ❌ Not yet ready for external contributions
- ❌ Under embargo or confidentiality agreement
- ❌ Requires additional security hardening
- ❌ Documentation is incomplete

## Before You Start

### Required Approvals

Obtain approval from:

1. **Project Coordinator**: Overall project approval
2. **Work Package Leader**: WP-specific approval
3. **Technical Lead**: Technical readiness confirmation
4. **Legal/Compliance**: IP and licensing clearance (if required)

### Approval Template

Use this template to request approval:

```
Subject: Request to Make [REPOSITORY-NAME] Public

Dear [Coordinator/Leader],

I am requesting approval to make the following repository public:

Repository: https://github.com/webuild-consortium/[REPOSITORY-NAME]
Work Package: WP[X]
Purpose: [Brief description]

Readiness Checklist:
✅ Security review completed
✅ Documentation complete
✅ No sensitive information
✅ License properly applied
✅ EU acknowledgments in place

Reason for making public:
[Explain why this should be public now]

Target date: [DATE]

Please review and approve.

Best regards,
[Your Name]
```

### Timeline

Plan for the following timeline:

- **Week 1**: Complete pre-publication checklist
- **Week 2**: Security and documentation review
- **Week 3**: Obtain approvals
- **Week 4**: Make public and announce

## Pre-Publication Checklist

### Code Quality

- [ ] **Code is stable**: No major bugs or issues
- [ ] **Tests pass**: All automated tests succeed
- [ ] **Code is clean**: No debug code or commented-out sections
- [ ] **Dependencies updated**: All dependencies are current and secure
- [ ] **Build succeeds**: Project builds without errors
- [ ] **Performance acceptable**: No obvious performance issues

### Documentation

- [ ] **README complete**: Comprehensive project overview
- [ ] **Installation instructions**: Clear setup steps
- [ ] **Usage examples**: Working code examples
- [ ] **API documentation**: Complete API reference (if applicable)
- [ ] **Architecture docs**: System design documented
- [ ] **Contributing guide**: Clear contribution guidelines
- [ ] **Changelog**: Version history documented

### Legal and Compliance

- [ ] **License file present**: Apache 2.0 license included
- [ ] **License headers**: All source files have license headers
- [ ] **Copyright notices**: Proper copyright attribution
- [ ] **Third-party licenses**: All dependencies properly licensed
- [ ] **EU acknowledgment**: Funding acknowledgment in README
- [ ] **No proprietary code**: No code under restrictive licenses

### Security

- [ ] **No secrets**: No API keys, passwords, or tokens
- [ ] **No sensitive data**: No personal or confidential information
- [ ] **Security review**: Vulnerability assessment completed
- [ ] **Dependencies scanned**: No known security vulnerabilities
- [ ] **Security policy**: SECURITY.md file present
- [ ] **Access controls**: Appropriate permissions configured

### Community

- [ ] **Code of Conduct**: CODE_OF_CONDUCT.md present
- [ ] **Contributing guide**: CONTRIBUTING.md present
- [ ] **Issue templates**: Bug report and feature request templates
- [ ] **PR template**: Pull request template configured
- [ ] **Discussion guidelines**: Clear communication channels

## Security Review

### Step 1: Scan for Secrets

Use tools to scan for accidentally committed secrets:

```bash
# Install git-secrets (if not already installed)
brew install git-secrets  # macOS
# or
apt-get install git-secrets  # Linux

# Initialize git-secrets
cd [REPOSITORY-PATH]
git secrets --install
git secrets --register-aws

# Scan entire history
git secrets --scan-history

# Scan current files
git secrets --scan
```

### Step 2: Review Commit History

Check for sensitive information in commit history:

```bash
# Search for potential secrets
git log --all --full-history --source --pretty=format:"%h %s" | grep -i "password\|secret\|key\|token\|api"

# Review specific files
git log --all --full-history -- path/to/sensitive/file

# Check for large files that might contain data
git rev-list --objects --all | \
  git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' | \
  awk '/^blob/ {print substr($0,6)}' | sort -n -k 2 | tail -20
```

### Step 3: Remove Sensitive Data

If sensitive data is found, remove it from history:

```bash
# Using BFG Repo-Cleaner (recommended)
# Download from https://rtyley.github.io/bfg-repo-cleaner/

# Remove passwords
bfg --replace-text passwords.txt [REPOSITORY-PATH]

# Remove specific files
bfg --delete-files sensitive-file.txt [REPOSITORY-PATH]

# Clean up
cd [REPOSITORY-PATH]
git reflog expire --expire=now --all
git gc --prune=now --aggressive

# Force push (coordinate with team first!)
git push --force
```

### Step 4: Dependency Audit

Check for vulnerable dependencies:

```bash
# For Node.js projects
npm audit
npm audit fix

# For Python projects
pip-audit
safety check

# For Java projects
mvn dependency-check:check

# For Go projects
go list -json -m all | nancy sleuth
```

### Step 5: Security Checklist

- [ ] No hardcoded credentials
- [ ] No API keys or tokens
- [ ] No database connection strings
- [ ] No private keys or certificates
- [ ] No internal URLs or IPs
- [ ] No personal information
- [ ] No confidential business data
- [ ] All dependencies are secure
- [ ] Security policy is in place

## Documentation Review

### README.md Review

Ensure README includes:

- [ ] **Project title and description**
- [ ] **Badges** (license, build status, etc.)
- [ ] **Table of contents**
- [ ] **Installation instructions**
- [ ] **Usage examples**
- [ ] **API documentation** (or link to it)
- [ ] **Contributing guidelines** (or link)
- [ ] **License information**
- [ ] **EU funding acknowledgment**
- [ ] **Contact information**
- [ ] **Links to related projects**

### CONTRIBUTING.md Review

Ensure contributing guide includes:

- [ ] **Code of Conduct** reference
- [ ] **How to get started**
- [ ] **Development setup**
- [ ] **Coding standards**
- [ ] **Testing requirements**
- [ ] **Pull request process**
- [ ] **Issue guidelines**
- [ ] **Communication channels**

### Additional Documentation

- [ ] **Architecture documentation**
- [ ] **API reference**
- [ ] **User guides**
- [ ] **Developer guides**
- [ ] **Deployment instructions**
- [ ] **Troubleshooting guide**
- [ ] **FAQ**
- [ ] **Changelog**

## Making Repository Public

### Step 1: Final Verification

Before making public, verify one last time:

```bash
# Pull latest changes
git pull origin main

# Run all tests
[TEST-COMMAND]

# Build project
[BUILD-COMMAND]

# Verify documentation
ls -la README.md CONTRIBUTING.md CODE_OF_CONDUCT.md SECURITY.md LICENSE
```

### Step 2: Backup Repository

Create a backup before making changes:

```bash
# Clone repository to backup location
git clone --mirror https://github.com/webuild-consortium/[REPOSITORY-NAME].git [REPOSITORY-NAME]-backup

# Or create a backup branch
git checkout -b backup-before-public
git push origin backup-before-public
```

### Step 3: Change Visibility

1. Navigate to repository on GitHub
2. Click **"Settings"** tab
3. Scroll to **"Danger Zone"** section
4. Click **"Change repository visibility"**
5. Click **"Change visibility"**
6. Select **"Make public"**
7. Read the warning carefully
8. Type repository name to confirm
9. Click **"I understand, change repository visibility"**

### Step 4: Verify Public Status

1. Log out of GitHub (or use incognito mode)
2. Navigate to repository URL
3. Verify repository is accessible
4. Check all files are visible
5. Test clone without authentication:

```bash
git clone https://github.com/webuild-consortium/[REPOSITORY-NAME].git
```

## Post-Publication Steps

### Step 1: Update Repository Settings

After making public, review and update:

1. **Features**
   - Enable Issues (if not already)
   - Enable Discussions (recommended)
   - Disable Wiki (use docs/ instead)

2. **Social Preview**
   - Add repository image
   - Verify description
   - Add topics/tags

3. **About Section**
   - Add website URL
   - Add relevant topics
   - Update description

### Step 2: Configure Community Health Files

Ensure these are visible and accessible:

- [ ] README.md
- [ ] CONTRIBUTING.md
- [ ] CODE_OF_CONDUCT.md
- [ ] SECURITY.md
- [ ] LICENSE
- [ ] Issue templates
- [ ] PR template

### Step 3: Set Up Integrations

Configure useful integrations:

- [ ] **CI/CD**: GitHub Actions or other CI
- [ ] **Code coverage**: Codecov, Coveralls
- [ ] **Documentation**: ReadTheDocs, GitHub Pages
- [ ] **Dependency monitoring**: Dependabot
- [ ] **Code quality**: SonarCloud, CodeClimate

### Step 4: Announce Publication

Announce the public repository:

#### Internal Announcement

```
Subject: [REPOSITORY-NAME] is Now Public

Dear WEBUILD Team,

The [REPOSITORY-NAME] repository is now publicly available:
https://github.com/webuild-consortium/[REPOSITORY-NAME]

This repository provides [brief description].

Key features:
- [Feature 1]
- [Feature 2]
- [Feature 3]

We welcome contributions from the community. Please share this with
relevant stakeholders and encourage participation.

Documentation: [LINK]
Contributing Guide: [LINK]

Best regards,
[Your Name]
```

#### External Announcement

- Post on project website
- Share on social media
- Announce in relevant forums
- Update project documentation
- Notify consortium partners

### Step 5: Monitor Initial Activity

After publication, monitor:

- [ ] **Issues**: Respond to new issues promptly
- [ ] **Pull requests**: Review and merge contributions
- [ ] **Discussions**: Engage with community
- [ ] **Stars/Forks**: Track repository popularity
- [ ] **Traffic**: Monitor repository analytics
- [ ] **Security alerts**: Address any vulnerabilities

## Best Practices

### Ongoing Maintenance

After making public:

1. **Respond Promptly**
   - Reply to issues within 48 hours
   - Review PRs within 1 week
   - Engage in discussions regularly

2. **Keep Documentation Updated**
   - Update README with new features
   - Maintain changelog
   - Keep examples current

3. **Maintain Code Quality**
   - Review all contributions
   - Enforce coding standards
   - Keep tests passing

4. **Security Vigilance**
   - Monitor security alerts
   - Update dependencies regularly
   - Review access permissions

5. **Community Building**
   - Welcome new contributors
   - Recognize contributions
   - Foster inclusive environment

### Communication

- **Be transparent**: Share roadmap and decisions
- **Be responsive**: Reply to community feedback
- **Be welcoming**: Help newcomers get started
- **Be professional**: Maintain consortium standards
- **Be appreciative**: Thank contributors

### Quality Standards

Maintain high standards:

- **Code quality**: Clean, well-tested code
- **Documentation**: Comprehensive and current
- **Security**: Regular audits and updates
- **Performance**: Monitor and optimize
- **Accessibility**: Follow best practices

## Troubleshooting

### Issue: Cannot Change Visibility

**Symptoms**: "Change visibility" button is disabled

**Solution**:
1. Verify you have admin permissions
2. Check organization settings allow public repositories
3. Ensure no active security alerts
4. Contact organization owner if needed

### Issue: Sensitive Data Discovered After Publication

**Symptoms**: Secrets or sensitive data found in public repository

**Immediate Actions**:
1. **Rotate all exposed credentials immediately**
2. **Make repository private again**
3. **Remove sensitive data from history**
4. **Notify security team**
5. **Assess impact and notify affected parties**
6. **Document incident**

**Recovery Steps**:
```bash
# Make private immediately via Settings

# Remove sensitive data
bfg --replace-text secrets.txt
git reflog expire --expire=now --all
git gc --prune=now --aggressive
git push --force

# Verify clean
git secrets --scan-history

# Only make public again after thorough review
```

### Issue: Unexpected Traffic or Issues

**Symptoms**: Sudden spike in issues or traffic

**Solution**:
1. Review new issues and PRs
2. Enable issue templates if not already
3. Add more detailed contributing guidelines
4. Consider adding a FAQ
5. Engage with community respectfully

### Issue: Spam or Abuse

**Symptoms**: Spam issues, inappropriate content

**Solution**:
1. **Lock conversations** on problematic issues
2. **Block users** who violate Code of Conduct
3. **Report abuse** to GitHub
4. **Update Code of Conduct** if needed
5. **Enable interaction limits** temporarily

## Checklist

### Pre-Publication
- [ ] Obtained all required approvals
- [ ] Completed security review
- [ ] Verified no sensitive information
- [ ] Documentation is complete
- [ ] License properly applied
- [ ] EU acknowledgments in place
- [ ] Tests pass
- [ ] Code is clean and stable

### Publication
- [ ] Created backup
- [ ] Changed visibility to public
- [ ] Verified public access
- [ ] Updated repository settings
- [ ] Configured integrations
- [ ] Announced publication

### Post-Publication
- [ ] Monitoring issues and PRs
- [ ] Responding to community
- [ ] Maintaining documentation
- [ ] Updating dependencies
- [ ] Tracking analytics

## Related Documentation

- [GitHub Policies and Guidelines](../01-github-policies-and-guidelines.md)
- [Repository Management](../04-repository-management.md)
- [Security and Compliance](../06-security-and-compliance.md)
- [Creating New Repository Guide](./creating-new-repository.md)
- [Access Management Guide](./access-management.md)

---

**WEBUILD Consortium Project**

This project is funded by the European Union under [GRANT NUMBER/PROGRAM]. Views and opinions expressed are however those of the author(s) only and do not necessarily reflect those of the European Union or [FUNDING AGENCY]. Neither the European Union nor the granting authority can be held responsible for them.