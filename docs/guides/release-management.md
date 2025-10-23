# Guide: Release Management

This guide provides comprehensive instructions for managing releases in WEBUILD Consortium projects.

## Table of Contents

- [Overview](#overview)
- [Versioning Strategy](#versioning-strategy)
- [Release Process](#release-process)
- [Release Types](#release-types)
- [Creating a Release](#creating-a-release)
- [Release Notes](#release-notes)
- [Hotfix Releases](#hotfix-releases)
- [Best Practices](#best-practices)
- [Troubleshooting](#troubleshooting)

## Overview

### Purpose

Effective release management ensures:

- **Predictability**: Regular, planned releases
- **Quality**: Thoroughly tested releases
- **Traceability**: Clear version history
- **Communication**: Stakeholders informed
- **Compliance**: EU deliverable requirements met

### Release Philosophy

WEBUILD projects follow these principles:

1. **Semantic Versioning**: Clear version numbers
2. **Regular Cadence**: Predictable release schedule
3. **Quality First**: Never compromise on quality
4. **Clear Communication**: Transparent release notes
5. **Backward Compatibility**: Minimize breaking changes

## Versioning Strategy

### Semantic Versioning

We use [Semantic Versioning 2.0.0](https://semver.org/):

```
MAJOR.MINOR.PATCH[-PRERELEASE][+BUILD]
```

**Format**: `X.Y.Z`

- **MAJOR (X)**: Incompatible API changes
- **MINOR (Y)**: New features, backward compatible
- **PATCH (Z)**: Bug fixes, backward compatible

**Examples**:
- `1.0.0` - Initial stable release
- `1.1.0` - New features added
- `1.1.1` - Bug fixes
- `2.0.0` - Breaking changes
- `1.2.0-beta.1` - Pre-release version
- `1.2.0+20240115` - Build metadata

### Version Increment Rules

#### MAJOR Version (X.0.0)

Increment when making incompatible API changes:

- Breaking API changes
- Removing deprecated features
- Major architecture changes
- Incompatible data format changes

**Example**: `1.5.3` → `2.0.0`

#### MINOR Version (X.Y.0)

Increment when adding functionality in a backward-compatible manner:

- New features
- New API endpoints
- Deprecating features (not removing)
- Significant improvements

**Example**: `1.5.3` → `1.6.0`

#### PATCH Version (X.Y.Z)

Increment when making backward-compatible bug fixes:

- Bug fixes
- Security patches
- Performance improvements
- Documentation updates

**Example**: `1.5.3` → `1.5.4`

### Pre-release Versions

Use pre-release identifiers for unstable versions:

- **alpha**: `1.0.0-alpha.1` - Early testing
- **beta**: `1.0.0-beta.1` - Feature complete, testing
- **rc**: `1.0.0-rc.1` - Release candidate

**Progression**:
```
1.0.0-alpha.1
1.0.0-alpha.2
1.0.0-beta.1
1.0.0-beta.2
1.0.0-rc.1
1.0.0
```

### Initial Development

- Start with `0.1.0` for initial development
- Use `0.x.y` for pre-1.0 versions
- Anything may change at any time
- Public API should not be considered stable

**Example progression**:
```
0.1.0 - Initial development
0.2.0 - More features
0.3.0 - API stabilizing
1.0.0 - First stable release
```

## Release Process

### Release Cycle

Typical release cycle:

```
Development → Testing → Staging → Production
     ↓           ↓          ↓          ↓
  Feature    Integration  User      Stable
  Branches     Testing   Testing   Release
```

### Release Schedule

Recommended schedule:

- **Major Releases**: Annually or as needed
- **Minor Releases**: Quarterly (every 3 months)
- **Patch Releases**: As needed (bug fixes)
- **Hotfix Releases**: Immediately (critical issues)

### Release Timeline

Typical 2-week release cycle:

```
Week 1:
├── Monday: Feature freeze
├── Tuesday-Thursday: Testing
└── Friday: Release candidate

Week 2:
├── Monday-Wednesday: Final testing
├── Thursday: Release preparation
└── Friday: Release deployment
```

## Release Types

### Feature Release (Minor)

**When**: Adding new features

**Process**:
1. Feature development complete
2. All tests passing
3. Documentation updated
4. Release notes prepared
5. Version bumped (X.Y.0)

**Example**: `1.2.0` → `1.3.0`

### Maintenance Release (Patch)

**When**: Bug fixes only

**Process**:
1. Bug fixes merged
2. Tests passing
3. Changelog updated
4. Version bumped (X.Y.Z)

**Example**: `1.3.0` → `1.3.1`

### Major Release

**When**: Breaking changes

**Process**:
1. Migration guide prepared
2. Deprecation warnings in place
3. Extensive testing
4. Communication plan
5. Version bumped (X.0.0)

**Example**: `1.9.5` → `2.0.0`

### Hotfix Release

**When**: Critical bugs in production

**Process**:
1. Create hotfix branch from release tag
2. Fix critical issue
3. Test thoroughly
4. Fast-track release
5. Backport to develop

**Example**: `1.3.0` → `1.3.1` (emergency)

## Creating a Release

### Step 1: Prepare Release Branch

```bash
# Ensure you're on develop branch
git checkout develop
git pull origin develop

# Create release branch
git checkout -b release/1.3.0

# Push release branch
git push -u origin release/1.3.0
```

### Step 2: Update Version Numbers

Update version in all relevant files:

**package.json** (Node.js):
```json
{
  "version": "1.3.0"
}
```

**setup.py** (Python):
```python
setup(
    version="1.3.0"
)
```

**pom.xml** (Java):
```xml
<version>1.3.0</version>
```

**Cargo.toml** (Rust):
```toml
[package]
version = "1.3.0"
```

### Step 3: Update Changelog

Update `CHANGELOG.md`:

```markdown
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.3.0] - 2024-01-15

### Added
- New user authentication system (#123)
- Support for OAuth2 providers (#145)
- API rate limiting (#156)

### Changed
- Improved error messages (#134)
- Updated dependencies to latest versions (#167)

### Fixed
- Fixed memory leak in data processor (#142)
- Resolved race condition in async handler (#159)

### Security
- Patched XSS vulnerability in input validation (#178)

## [1.2.0] - 2023-12-01
...
```

### Step 4: Run Final Tests

```bash
# Run all tests
npm test

# Run integration tests
npm run test:integration

# Run end-to-end tests
npm run test:e2e

# Check code coverage
npm run test:coverage

# Run linter
npm run lint

# Build project
npm run build
```

### Step 5: Create Release Commit

```bash
# Stage changes
git add .

# Commit with version bump
git commit -m "chore: bump version to 1.3.0

- Update version in package.json
- Update CHANGELOG.md
- Prepare for release"

# Push changes
git push origin release/1.3.0
```

### Step 6: Merge to Main

```bash
# Create PR from release/1.3.0 to main
gh pr create --base main --head release/1.3.0 \
  --title "Release v1.3.0" \
  --body "Release version 1.3.0

See CHANGELOG.md for details."

# After approval, merge to main
gh pr merge --squash

# Switch to main and pull
git checkout main
git pull origin main
```

### Step 7: Create Git Tag

```bash
# Create annotated tag
git tag -a v1.3.0 -m "Release version 1.3.0

Features:
- New user authentication system
- OAuth2 support
- API rate limiting

Bug fixes:
- Fixed memory leak
- Resolved race condition

Security:
- Patched XSS vulnerability"

# Push tag
git push origin v1.3.0
```

### Step 8: Create GitHub Release

1. Go to repository on GitHub
2. Click **"Releases"**
3. Click **"Draft a new release"**
4. Configure release:
   - **Tag**: Select `v1.3.0`
   - **Title**: `v1.3.0 - [Release Name]`
   - **Description**: Copy from CHANGELOG
   - **Attach binaries**: If applicable
   - **Pre-release**: Check if pre-release
5. Click **"Publish release"**

Or use GitHub CLI:

```bash
gh release create v1.3.0 \
  --title "v1.3.0 - Authentication Update" \
  --notes-file RELEASE_NOTES.md \
  --latest
```

### Step 9: Merge Back to Develop

```bash
# Merge main back to develop
git checkout develop
git merge main
git push origin develop

# Delete release branch
git branch -d release/1.3.0
git push origin --delete release/1.3.0
```

### Step 10: Announce Release

Send release announcement:

```
Subject: [WEBUILD] Release v1.3.0 Available

Dear WEBUILD Team,

We're pleased to announce the release of [PROJECT-NAME] v1.3.0.

🎉 What's New:
- New user authentication system
- OAuth2 provider support
- API rate limiting

🐛 Bug Fixes:
- Fixed memory leak in data processor
- Resolved race condition in async handler

🔒 Security:
- Patched XSS vulnerability

📦 Download:
https://github.com/webuild-consortium/[REPO]/releases/tag/v1.3.0

📖 Full Changelog:
https://github.com/webuild-consortium/[REPO]/blob/main/CHANGELOG.md

🙏 Thanks to all contributors!

Best regards,
[Your Name]
```

## Release Notes

### Structure

Good release notes include:

1. **Summary**: Brief overview
2. **Highlights**: Key features/changes
3. **Breaking Changes**: If any
4. **New Features**: What's new
5. **Improvements**: Enhancements
6. **Bug Fixes**: What's fixed
7. **Security**: Security updates
8. **Deprecations**: What's deprecated
9. **Migration Guide**: If needed
10. **Contributors**: Who helped

### Template

```markdown
# Release v1.3.0 - Authentication Update

Released: 2024-01-15

## Summary

This release introduces a new authentication system with OAuth2 support,
along with several bug fixes and security improvements.

## Highlights

- 🔐 New authentication system with OAuth2 support
- ⚡ API rate limiting to prevent abuse
- 🐛 Fixed critical memory leak
- 🔒 Security vulnerability patched

## Breaking Changes

None in this release.

## New Features

### User Authentication System (#123)

Implemented a new authentication system with support for:
- Email/password authentication
- OAuth2 providers (Google, GitHub)
- JWT token management
- Session handling

```typescript
// Example usage
const auth = new AuthService();
await auth.login(email, password);
```

### API Rate Limiting (#156)

Added rate limiting to prevent API abuse:
- 100 requests per minute per user
- 1000 requests per hour per IP
- Configurable limits per endpoint

## Improvements

- Improved error messages for better debugging (#134)
- Updated all dependencies to latest versions (#167)
- Enhanced logging for better observability (#172)

## Bug Fixes

- Fixed memory leak in data processor (#142)
- Resolved race condition in async handler (#159)
- Corrected timezone handling in date formatter (#163)

## Security

- **[CRITICAL]** Patched XSS vulnerability in input validation (#178)
- Updated dependencies with security vulnerabilities
- Improved input sanitization

## Deprecations

None in this release.

## Migration Guide

No migration needed for this release.

## Contributors

Thank you to all contributors:

- @user1 - Authentication system
- @user2 - Rate limiting
- @user3 - Bug fixes
- @user4 - Documentation

## Installation

```bash
npm install [package-name]@1.3.0
```

## Documentation

- [User Guide](https://docs.example.com/user-guide)
- [API Reference](https://docs.example.com/api)
- [Migration Guide](https://docs.example.com/migration)

## Support

For issues or questions:
- GitHub Issues: https://github.com/webuild-consortium/[repo]/issues
- Email: support@example.com

---

**WEBUILD Consortium Project**

This project is funded by the European Union.
```

### Writing Good Release Notes

**Do's**:
- ✅ Be clear and concise
- ✅ Use bullet points
- ✅ Include code examples
- ✅ Link to issues/PRs
- ✅ Highlight breaking changes
- ✅ Thank contributors
- ✅ Provide migration guides

**Don'ts**:
- ❌ Use technical jargon
- ❌ Be vague or unclear
- ❌ Forget breaking changes
- ❌ Omit security fixes
- ❌ Skip migration guides
- ❌ Ignore contributors

## Hotfix Releases

### When to Create Hotfix

Create hotfix for:

- **Critical bugs** in production
- **Security vulnerabilities**
- **Data loss issues**
- **Service outages**
- **Compliance violations**

### Hotfix Process

```bash
# 1. Create hotfix branch from main
git checkout main
git pull origin main
git checkout -b hotfix/1.3.1

# 2. Fix the issue
# ... make changes ...

# 3. Test thoroughly
npm test

# 4. Update version and changelog
# ... update files ...

# 5. Commit fix
git add .
git commit -m "fix: resolve critical security vulnerability

- Patch XSS vulnerability in user input
- Add input sanitization
- Update security tests

Fixes #999"

# 6. Merge to main
git checkout main
git merge hotfix/1.3.1
git push origin main

# 7. Tag release
git tag -a v1.3.1 -m "Hotfix: Security vulnerability"
git push origin v1.3.1

# 8. Merge to develop
git checkout develop
git merge hotfix/1.3.1
git push origin develop

# 9. Delete hotfix branch
git branch -d hotfix/1.3.1
```

### Hotfix Communication

Communicate hotfix urgently:

```
Subject: [URGENT] Security Hotfix v1.3.1 Released

Dear WEBUILD Team,

A critical security hotfix (v1.3.1) has been released.

⚠️ SEVERITY: HIGH
🔒 TYPE: Security Vulnerability
📦 VERSION: 1.3.1

ISSUE:
XSS vulnerability in user input validation

ACTION REQUIRED:
Please update to v1.3.1 immediately:
npm install [package]@1.3.1

DETAILS:
https://github.com/webuild-consortium/[repo]/releases/tag/v1.3.1

For questions, contact: security@example.com

Best regards,
Security Team
```

## Best Practices

### Planning

1. **Release Calendar**
   - Plan releases in advance
   - Communicate schedule
   - Allow buffer time
   - Coordinate with stakeholders

2. **Feature Freeze**
   - Set clear freeze date
   - No new features after freeze
   - Only bug fixes allowed
   - Communicate to team

3. **Testing Period**
   - Adequate testing time
   - Multiple test environments
   - User acceptance testing
   - Performance testing

### Execution

1. **Automation**
   - Automate version bumping
   - Automate changelog generation
   - Automate release creation
   - Automate deployment

2. **Documentation**
   - Update all documentation
   - Create migration guides
   - Update API docs
   - Update examples

3. **Communication**
   - Announce in advance
   - Provide release notes
   - Notify stakeholders
   - Gather feedback

### Post-Release

1. **Monitoring**
   - Monitor for issues
   - Track error rates
   - Check performance
   - Gather metrics

2. **Support**
   - Be available for questions
   - Address issues quickly
   - Provide assistance
   - Update documentation

3. **Retrospective**
   - Review release process
   - Identify improvements
   - Document lessons learned
   - Update procedures

## Troubleshooting

### Issue: Version Conflict

**Problem**: Version already exists

**Solution**:
```bash
# Delete local tag
git tag -d v1.3.0

# Delete remote tag
git push origin :refs/tags/v1.3.0

# Create new tag
git tag -a v1.3.0 -m "Release v1.3.0"
git push origin v1.3.0
```

### Issue: Failed Release

**Problem**: Release process failed

**Solution**:
1. Identify failure point
2. Fix the issue
3. Restart from that point
4. Document the issue
5. Update process to prevent recurrence

### Issue: Need to Rollback

**Problem**: Critical issue in release

**Solution**:
```bash
# Revert to previous version
git revert [commit-hash]

# Create hotfix
git checkout -b hotfix/1.3.1

# Fix and release
# ... follow hotfix process ...
```

## Checklist

### Pre-Release
- [ ] All features complete
- [ ] All tests passing
- [ ] Documentation updated
- [ ] Changelog updated
- [ ] Version bumped
- [ ] Migration guide prepared (if needed)
- [ ] Stakeholders notified

### Release
- [ ] Release branch created
- [ ] Final testing complete
- [ ] Merged to main
- [ ] Tag created
- [ ] GitHub release published
- [ ] Merged back to develop
- [ ] Release announced

### Post-Release
- [ ] Monitoring active
- [ ] No critical issues
- [ ] Documentation deployed
- [ ] Stakeholders updated
- [ ] Retrospective scheduled

## Related Documentation

- [Branching and Workflow](../07-branching-and-workflow.md)
- [GitHub Policies and Guidelines](../01-github-policies-and-guidelines.md)
- [Code Review Guide](./code-review-guide.md)
- [Repository Management](../04-repository-management.md)

---

**WEBUILD Consortium Project**

This project is funded by the European Union under [GRANT NUMBER/PROGRAM]. Views and opinions expressed are however those of the author(s) only and do not necessarily reflect those of the European Union or [FUNDING AGENCY]. Neither the European Union nor the granting authority can be held responsible for them.