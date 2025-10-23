
# Security and Compliance

**Document Version:** 1.0
**Last Updated:** October 2025
**Status:** Draft for Review

---

## Table of Contents

1. [Introduction](#1-introduction)
2. [Security Principles](#2-security-principles)
3. [Access Control](#3-access-control)
4. [Secrets Management](#4-secrets-management)
5. [Code Security](#5-code-security)
6. [Dependency Security](#6-dependency-security)
7. [Data Protection](#7-data-protection)
8. [Incident Response](#8-incident-response)
9. [Compliance Requirements](#9-compliance-requirements)
10. [Security Best Practices](#10-security-best-practices)

---

## 1. Introduction

### 1.1 Purpose

This document establishes security policies and compliance requirements for all WEBUILD consortium repositories and development activities. It ensures the protection of code, data, and infrastructure while maintaining compliance with EU regulations and consortium agreements.

### 1.2 Scope

These guidelines apply to:

✅ All repositories in the organization
✅ All consortium members and contributors
✅ All development, testing, and production environments
✅ All code, documentation, and data
✅ All third-party integrations and services

### 1.3 Security Objectives

1. **Confidentiality:** Protect sensitive information from unauthorized access
2. **Integrity:** Ensure code and data are not tampered with
3. **Availability:** Maintain access to resources when needed
4. **Accountability:** Track and audit all activities
5. **Compliance:** Meet all legal and regulatory requirements

### 1.4 Shared Responsibility

Security is everyone's responsibility:

| Role | Security Responsibilities |
|------|--------------------------|
| **All Members** | Follow security policies, report incidents, protect credentials |
| **Contributors** | Write secure code, review for vulnerabilities, use secure practices |
| **Maintainers** | Enforce security policies, review security issues, manage access |
| **WP/Group Leads** | Oversee security compliance, coordinate responses, train team |
| **Technical Coordinator** | Set security policies, manage organization security, incident coordination |

---

## 2. Security Principles

### 2.1 Core Principles

#### 2.1.1 Defense in Depth

Implement multiple layers of security:

```
┌─────────────────────────────────┐
│  Organization Security          │
│  ├─ 2FA Required                │
│  ├─ Access Controls             │
│  └─ Audit Logging               │
└──────────────┬──────────────────┘
               │
┌──────────────▼──────────────────┐
│  Repository Security            │
│  ├─ Branch Protection           │
│  ├─ Required Reviews            │
│  └─ Status Checks               │
└──────────────┬──────────────────┘
               │
┌──────────────▼──────────────────┐
│  Code Security                  │
│  ├─ Secure Coding               │
│  ├─ Input Validation            │
│  └─ Security Testing            │
└──────────────┬──────────────────┘
               │
┌──────────────▼──────────────────┐
│  Infrastructure Security        │
│  ├─ Secrets Management          │
│  ├─ Encrypted Communications    │
│  └─ Secure Deployment           │
└─────────────────────────────────┘
```

#### 2.1.2 Least Privilege

Grant minimum necessary permissions:

✅ **Do:**
- Start with minimal access
- Grant additional access as needed
- Review permissions regularly
- Revoke unused access promptly

❌ **Don't:**
- Give admin access by default
- Share accounts or credentials
- Leave inactive accounts active
- Grant permanent access for temporary needs

#### 2.1.3 Secure by Default

Security should be the default state:

✅ **Default Settings:**
- 2FA required for all members
- Branch protection enabled
- Secret scanning active
- Dependency alerts enabled
- Private by default (then make public after review)

#### 2.1.4 Zero Trust

Never trust, always verify:

- Verify all access requests
- Authenticate all users
- Authorize all actions
- Audit all activities
- Encrypt all communications

### 2.2 Security Policies

#### 2.2.1 Mandatory Requirements

**All members MUST:**

- [ ] Enable two-factor authentication (2FA)
- [ ] Use strong, unique passwords
- [ ] Protect credentials and secrets
- [ ] Report security incidents immediately
- [ ] Follow secure coding practices
- [ ] Complete security training
- [ ] Review code for security issues
- [ ] Keep dependencies updated

#### 2.2.2 Prohibited Activities

**Never:**

❌ Commit secrets or credentials
❌ Store sensitive data in repositories
❌ Share accounts or credentials
❌ Disable security features
❌ Ignore security warnings
❌ Use weak or reused passwords
❌ Access unauthorized resources
❌ Bypass security controls

---

## 3. Access Control

### 3.1 Authentication

#### 3.1.1 Two-Factor Authentication (2FA)

**Required for all members.**

**Setup:**

1. Go to GitHub Settings → Password and authentication
2. Click "Enable two-factor authentication"
3. Choose method:
   - **Recommended:** Authenticator app (Google Authenticator, Authy, 1Password)
   - **Alternative:** Security key (YubiKey, etc.)
   - **Fallback:** SMS (least secure)
4. Save recovery codes securely
5. Verify 2FA is active

**Recovery Codes:**
- Store in secure password manager
- Keep offline backup
- Don't share with anyone
- Generate new codes if compromised

**Lost 2FA Device:**
1. Use recovery codes
2. Contact Technical Coordinator if codes unavailable
3. Verify identity through alternative means
4. Reset 2FA after regaining access

#### 3.1.2 SSH Keys

**Best Practices:**

```bash
# Generate strong SSH key
ssh-keygen -t ed25519 -C "your.email@organization.com"

# Use passphrase protection
# Enter strong passphrase when prompted

# Add to SSH agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Add public key to GitHub
cat ~/.ssh/id_ed25519.pub
# Copy and add to GitHub Settings → SSH Keys
```

**Key Management:**
- Use separate keys for different devices
- Protect private keys with passphrase
- Never share private keys
- Rotate keys annually
- Remove old/unused keys
- Report compromised keys immediately

#### 3.1.3 Personal Access Tokens (PATs)

**When to use:**
- API access
- CI/CD pipelines
- Automation scripts
- Command-line operations

**Creating secure PATs:**

1. Go to Settings → Developer settings → Personal access tokens
2. Click "Generate new token (classic)"
3. Set descriptive name: "CI/CD Pipeline - Project X"
4. Set expiration: 90 days maximum
5. Select minimum required scopes
6. Generate and copy token immediately
7. Store securely (never commit to code)

**Token Security:**
- ✅ Use fine-grained tokens when possible
- ✅ Set shortest practical expiration
- ✅ Limit scopes to minimum needed
- ✅ Rotate tokens regularly
- ✅ Revoke unused tokens
- ❌ Never commit tokens to code
- ❌ Don't share tokens
- ❌ Don't use tokens in URLs

### 3.2 Authorization

#### 3.2.1 Permission Levels

Follow least privilege principle:

| Level | Use For | Avoid For |
|-------|---------|-----------|
| **Read** | External collaborators, observers | Active contributors |
| **Triage** | Community managers | Developers |
| **Write** | Regular contributors | Maintainers |
| **Maintain** | Repository maintainers | Regular contributors |
| **Admin** | Group leads only | Everyone else |
| **Owner** | Technical Coordinator only | All others |

#### 3.2.2 Access Reviews

**Regular Reviews:**

**Monthly:**
- Review new access grants
- Check for anomalies
- Verify active users

**Quarterly:**
- Full access audit
- Remove inactive users
- Update permissions
- Document changes

**Annually:**
- Comprehensive security review
- Update access policies
- Refresh training
- Audit compliance

### 3.3 Session Security

**Best Practices:**

- ✅ Log out when finished
- ✅ Use private browsing for shared devices
- ✅ Lock screen when away
- ✅ Clear browser cache on shared devices
- ✅ Review active sessions regularly
- ❌ Stay logged in on public computers
- ❌ Save passwords in browsers on shared devices

**Review Active Sessions:**

1. Go to Settings → Sessions
2. Review active sessions
3. Revoke suspicious sessions
4. Report unauthorized access

---

## 4. Secrets Management

### 4.1 What Are Secrets?

**Secrets include:**

- API keys and tokens
- Passwords and passphrases
- Private keys and certificates
- Database credentials
- OAuth tokens
- Encryption keys
- Service account credentials
- Webhook secrets

### 4.2 Never Commit Secrets

#### 4.2.1 Prevention

**Use .gitignore:**

```gitignore
# Secrets and credentials
.env
.env.local
.env.*.local
secrets/
*.key
*.pem
*.p12
credentials.json
config/secrets.yml

# IDE files that may contain secrets
.vscode/settings.json
.idea/

# OS files
.DS_Store
Thumbs.db
```

**Pre-commit Hooks:**

```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/Yelp/detect-secrets
    rev: v1.4.0
    hooks:
      - id: detect-secrets
        args: ['--baseline', '.secrets.baseline']
```

**Git Hooks:**

```bash
# .git/hooks/pre-commit
#!/bin/sh
# Check for potential secrets
if git diff --cached | grep -E '(password|api_key|secret|token).*='; then
    echo "Error: Potential secret detected!"
    echo "Please remove secrets before committing."
    exit 1
fi
```

#### 4.2.2 Detection

**GitHub Secret Scanning:**

Automatically enabled for public repositories:
- Detects known secret patterns
- Alerts repository admins
- Notifies secret providers
- Blocks pushes with secrets (if push protection enabled)

**Enable Push Protection:**

1. Go to Settings → Code security and analysis
2. Enable "Secret scanning"
3. Enable "Push protection"

**Manual Scanning:**

```bash
# Using TruffleHog
trufflehog git file://. --only-verified

# Using git-secrets
git secrets --scan

# Using detect-secrets
detect-secrets scan
```

#### 4.2.3 If Secrets Are Committed

**Immediate Actions:**

1. **Rotate the secret immediately**
   - Generate new credentials
   - Update all services
   - Revoke old credentials

2. **Remove from history:**

```bash
# Using BFG Repo-Cleaner (recommended)
bfg --delete-files secrets.txt
bfg --replace-text passwords.txt

# Using git filter-branch
git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch path/to/secret' \
  --prune-empty --tag-name-filter cat -- --all

# Force push (coordinate with team!)
git push origin --force --all
git push origin --force --tags
```

3. **Notify:**
   - Technical Coordinator
   - Security team
   - Affected services
   - Team members

4. **Document:**
   - What was exposed
   - When it was exposed
   - Actions taken
   - Lessons learned

### 4.3 Secure Storage

#### 4.3.1 Environment Variables

**For local development:**

```bash
# .env (never commit!)
DATABASE_URL=postgresql://user:pass@localhost/db
API_KEY=your-api-key-here
SECRET_KEY=your-secret-key-here
```

**Load in application:**

```python
# Python
import os
from dotenv import load_dotenv

load_dotenv()
api_key = os.getenv('API_KEY')
```

```javascript
// Node.js
require('dotenv').config();
const apiKey = process.env.API_KEY;
```

#### 4.3.2 GitHub Secrets

**For CI/CD:**

1. Go to repository Settings → Secrets and variables → Actions
2. Click "New repository secret"
3. Add name and value
4. Click "Add secret"

**Use in workflows:**

```yaml
# .github/workflows/deploy.yml
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Deploy
        env:
          API_KEY: ${{ secrets.API_KEY }}
          DATABASE_URL: ${{ secrets.DATABASE_URL }}
        run: |
          ./deploy.sh
```

**Secret Scopes:**
- **Repository secrets:** Available to repository workflows
- **Environment secrets:** Scoped to specific environments
- **Organization secrets:** Shared across repositories

#### 4.3.3 Secret Management Services

**For production:**

Use dedicated secret management:

- **AWS Secrets Manager**
- **Azure Key Vault**
- **Google Secret Manager**
- **HashiCorp Vault**
- **Doppler**

**Benefits:**
- Centralized management
- Automatic rotation
- Access control
- Audit logging
- Encryption at rest

---

## 5. Code Security

### 5.1 Secure Coding Practices

#### 5.1.1 Input Validation

**Always validate and sanitize input:**

```python
# Bad: No validation
def process_user_input(user_id):
    query = f"SELECT * FROM users WHERE id = {user_id}"
    return execute_query(query)  # SQL injection risk!

# Good: Parameterized query
def process_user_input(user_id):
    if not isinstance(user_id, int):
        raise ValueError("Invalid user ID")
    query = "SELECT * FROM users WHERE id = ?"
    return execute_query(query, (user_id,))
```

**Validation Checklist:**

- [ ] Validate data type
- [ ] Check length/size limits
- [ ] Verify format (regex)
- [ ] Whitelist allowed values
- [ ] Sanitize special characters
- [ ] Encode output properly

#### 5.1.2 Authentication and Authorization

**Implement properly:**

```python
# Bad: Weak authentication
def login(username, password):
    user = db.query(f"SELECT * FROM users WHERE username='{username}'")
    if user and user.password == password:  # Plain text!
        return user

# Good: Secure authentication
import bcrypt
from functools import wraps

def login(username, password):
    user = User.query.filter_by(username=username).first()
    if user and bcrypt.checkpw(password.encode(), user.password_hash):
        return generate_token(user)
    return None

def require_auth(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = request.headers.get('Authorization')
        if not token or not verify_token(token):
            return {'error': 'Unauthorized'}, 401
        return f(*args, **kwargs)
    return decorated
```

**Security Requirements:**

- ✅ Use strong password hashing (bcrypt, Argon2)
- ✅ Implement rate limiting
- ✅ Use secure session management
- ✅ Implement proper authorization checks
- ✅ Use HTTPS for all communications
- ❌ Never store passwords in plain text
- ❌ Don't use weak hashing (MD5, SHA1)
- ❌ Don't trust client-side validation alone

#### 5.1.3 Error Handling

**Secure error handling:**

```python
# Bad: Exposes sensitive information
try:
    result = database.query(sql)
except Exception as e:
    return f"Database error: {str(e)}"  # Exposes DB structure!

# Good: Generic error message
try:
    result = database.query(sql)
except DatabaseError as e:
    logger.error(f"Database error: {str(e)}")  # Log details
    return "An error occurred. Please try again."  # Generic message
```

**Best Practices:**

- ✅ Log detailed errors server-side
- ✅ Return generic messages to users
- ✅ Don't expose stack traces
- ✅ Don't reveal system information
- ✅ Handle errors gracefully

#### 5.1.4 Cryptography

**Use established libraries:**

```python
# Bad: Custom encryption
def encrypt(data, key):
    return ''.join(chr(ord(c) ^ ord(key[i % len(key)]))
                   for i, c in enumerate(data))

# Good: Use established library
from cryptography.fernet import Fernet

def encrypt(data, key):
    f = Fernet(key)
    return f.encrypt(data.encode())

def decrypt(encrypted_data, key):
    f = Fernet(key)
    return f.decrypt(encrypted_data).decode()
```

**Cryptography Rules:**

- ✅ Use established libraries (cryptography, libsodium)
- ✅ Use strong algorithms (AES-256, RSA-2048+)
- ✅ Generate secure random keys
- ✅ Protect encryption keys
- ❌ Never implement your own crypto
- ❌ Don't use weak algorithms (DES, RC4)
- ❌ Don't hardcode keys

### 5.2 Code Review for Security

#### 5.2.1 Security Review Checklist

**During code review, check for:**

- [ ] **Input Validation:** All inputs validated and sanitized
- [ ] **Authentication:** Proper authentication implemented
- [ ] **Authorization:** Access controls enforced
- [ ] **Secrets:** No hardcoded credentials
- [ ] **Cryptography:** Secure algorithms used
- [ ] **Error Handling:** No information leakage
- [ ] **Dependencies:** No known vulnerabilities
- [ ] **Logging:** Sensitive data not logged
- [ ] **SQL Injection:** Parameterized queries used
- [ ] **XSS:** Output properly encoded
- [ ] **CSRF:** CSRF protection implemented
- [ ] **File Upload:** Proper validation and restrictions

#### 5.2.2 Common Vulnerabilities

**OWASP Top 10:**

1. **Broken Access Control**
2. **Cryptographic Failures**
3. **Injection** (SQL, Command, etc.)
4. **Insecure Design**
5. **Security Misconfiguration**
6. **Vulnerable Components**
7. **Authentication Failures**
8. **Software and Data Integrity Failures**
9. **Security Logging and Monitoring Failures**
10. **Server-Side Request Forgery (SSRF)**

**Review for these vulnerabilities in every PR.**

### 5.3 Security Testing

#### 5.3.1 Static Analysis

**Automated scanning:**

```yaml
# .github/workflows/security.yml
name: Security Scan

on: [push, pull_request]

jobs:
  security:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Run Bandit (Python)
        run: |
          pip install bandit
          bandit -r src/

      - name: Run ESLint Security (JavaScript)
        run: |
          npm install eslint-plugin-security
          eslint --plugin security src/

      - name: Run Semgrep
        uses: returntocorp/semgrep-action@v1
```

**Tools by Language:**

| Language | Tools |
|----------|-------|
| Python | Bandit, Safety, Semgrep |
| JavaScript | ESLint Security, npm audit |
| Java | SpotBugs, FindSecBugs |
| Go | gosec, staticcheck |
| Ruby | Brakeman, bundler-audit |

#### 5.3.2 Dynamic Analysis

**Runtime testing:**

- Penetration testing
- Fuzzing
- Security scanners (OWASP ZAP, Burp Suite)
- API security testing

#### 5.3.3 Dependency Scanning

**Automated scanning:**

```yaml
# .github/workflows/dependency-scan.yml
name: Dependency Scan

on:
  schedule:
    - cron: '0 0 * * 0'  # Weekly
  push:
    branches: [ main ]

jobs:
  scan:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Run Snyk
        uses: snyk/actions/node@master
        env:
          SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}
```

---

## 6. Dependency Security

### 6.1 Dependency Management

#### 6.1.1 Dependency Scanning

**Enable GitHub Features:**

1. Go to Settings → Code security and analysis
2. Enable "Dependency graph"
3. Enable "Dependabot alerts"
4. Enable "Dependabot security updates"

**Dependabot Configuration:**

```yaml
# .github/dependabot.yml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
    open-pull-requests-limit: 10

  - package-ecosystem: "pip"
    directory: "/"
    schedule:
      interval: "weekly"
```

#### 6.1.2 Vulnerability Response

**When vulnerability detected:**

```
┌─────────────────┐
│  Alert          │
│  Received       │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Assess         │
│  Severity       │
└────────┬────────┘
         │
    ┌────┴────┐
    │         │
    ▼         ▼
┌────────┐ ┌──────────┐
│Critical│ │ Low/Med  │
│  High  │ │          │
└───┬────┘ └────┬─────┘
    │           │
    ▼           ▼
┌────────┐ ┌──────────┐
│Immediate│ │ Schedule │
│  Fix    │ │   Fix    │
└───┬────┘ └────┬─────┘
    │           │
    └─────┬─────┘
          │
          ▼
    ┌──────────┐
    │   Test   │
    │  & Deploy│
    └────┬─────┘
         │
         ▼
    ┌──────────┐
    │  Verify  │
    │   Fix    │
    └──────────┘
```

**Response Times:**

| Severity | Response Time | Action |
|----------|--------------|--------|
| Critical | 24 hours | Immediate patch |
| High | 7 days | Priority fix |
| Medium | 30 days | Scheduled update |
| Low | 90 days | Regular maintenance |

#### 6.1.3 Dependency Updates

**Regular Updates:**

```bash
# Python
pip list --outdated
pip install --upgrade package-name

# Node.js
npm outdated
npm update

# Check for security issues
npm audit
npm audit fix
```

**Update Strategy:**

- **Patch versions:** Update automatically (1.2.3 → 1.2.4)
- **Minor versions:** Review and test (1.2.0 → 1.3.0)
- **Major versions:** Careful review and testing (1.0.0 → 2.0.0)

### 6.2 Supply Chain Security

#### 6.2.1 Verify Dependencies

**Before adding dependency:**

- [ ] Check package popularity and maintenance
- [ ] Review package source code
- [ ] Verify package signatures
- [ ] Check for known vulnerabilities
- [ ] Review license compatibility
- [ ] Assess necessity (avoid unnecessary dependencies)

#### 6.2.2 Lock Files

**Use lock files:**

```bash
# Python
pip freeze > requirements.txt
# Or use Pipfile.lock with pipenv

# Node.js
# package-lock.json (npm)
# yarn.lock (yarn)

# Java
# Use dependency management in pom.xml or build.gradle
```

**Commit lock files to repository.**

#### 6.2.3 Private Package Registries

**For internal packages:**

- Use private npm registry
- Use private PyPI server
- Use private Maven repository
- Implement access controls
- Scan private packages too

---

## 7. Data Protection

### 7.1 GDPR Compliance

#### 7.1.1 Personal Data

**Never store in repositories:**

❌ Names and contact information
❌ Email addresses
❌ Phone numbers
❌ Physical addresses
❌ IP addresses
❌ User IDs (if personally identifiable)
❌ Any other personal data

**If personal data needed for testing:**

✅ Use synthetic/fake data
✅ Anonymize real data
✅ Use data generators
✅ Obtain explicit consent (if real data required)

#### 7.1.2 Data Minimization

**Collect only what's necessary:**

- Minimize data collection
- Limit data retention
- Delete data when no longer needed
- Anonymize where possible

#### 7.1.3 Data Subject Rights

**Support GDPR rights:**

- Right to access
- Right to rectification
- Right to erasure
- Right to data portability
- Right to object

### 7.2 Sensitive Data

#### 7.2.1 Classification

**Data Classification:**

| Level | Examples | Handling |
|-------|----------|----------|
| **Public** | Published docs, open source code | No restrictions |
| **Internal** | Internal docs, non-sensitive code | Consortium only |
| **Confidential** | Partner data, unpublished research | Restricted access |
| **Restricted** | Credentials, personal data | Never in repos |

#### 7.2.2 Handling Guidelines

**For each classification:**

**Public:**
- Can be in public repositories
- No special handling required

**Internal:**
- Private repositories only
- Consortium member access
- Standard security practices

**Confidential:**
- Private repositories
- Restricted team access
- Additional access controls
- Encryption recommended

**Restricted:**
- Never in repositories
- Use secret management
- Encrypt at rest and in transit
- Strict access controls

### 7.3 Data Encryption

#### 7.3.1 Encryption Requirements

**Encrypt:**

✅ Data at rest (databases, files)
✅ Data in transit (HTTPS, TLS)
✅ Backups
✅ Sensitive configuration
✅ Communication channels

#### 7.3.2 Encryption Standards

**Use strong encryption:**

- **Symmetric:** AES-256
- **Asymmetric:** RSA-2048 or higher, ECC
- **Hashing:** SHA-256 or higher
- **Password Hashing:** bcrypt, Argon2, scrypt
- **TLS:** TLS 1.2 or higher

---

## 8. Incident Response

### 8.1 Security Incidents

#### 8.1.1 What is a Security Incident?

**Examples:**

- Unauthorized access to repositories
- Compromised credentials
- Data breach or exposure
- Malware or malicious code
- Denial of service attack
- Social engineering attempt
- Insider threat
- Vulnerability exploitation

#### 8.1.2 Incident Response Process

```
┌─────────────────┐
│   Detection     │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   Reporting     │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   Assessment    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Containment    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Eradication    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   Recovery      │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Lessons Learned │
└─────────────────┘
```

#### 8.1.3 Reporting Incidents

**Immediate Actions:**

1. **Don't panic**
2. **Document everything**
3. **Report immediately:**
   - Technical Coordinator
   - WP/Group Lead
   - Security team

**Report via:**
- Email: [security contact]
- Emergency: [phone number]
- GitHub Security Advisory (for vulnerabilities)

**Include in report:**
- What happened
- When it happened
- What was affected
- Current status
- Actions taken
- Evidence collected

### 8.2 Vulnerability Disclosure

#### 8.2.1 Responsible Disclosure

**For security researchers:**

**Do:**
- ✅ Report privately first
- ✅ Provide detailed information
- ✅ Allow time for fix (90 days)
- ✅ Coordinate disclosure

**Don't:**
- ❌ Publicly disclose immediately
- ❌ Exploit vulnerabilities
- ❌ Access unauthorized data
- ❌ Disrupt services

#### 8.2.2 Reporting Vulnerabilities

**Create SECURITY.md:**

```markdown
# Security Policy

## Reporting a Vulnerability

**Please do not report security vulnerabilities through public GitHub issues.**

Instead, please report them via:
- Email: security@webuild-consortium.eu
- GitHub Security Advisory (preferred)

Include:
- Description of vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if any)

## Response Timeline

- **Acknowledgment:** Within 48 hours
- **Initial Assessment:** Within 7 days
- **Fix Development:** Depends on severity
- **Disclosure:** Coordinated with reporter

## Supported Versions

| Version | Supported |
|---------|-----------|
| 1.x.x   | ✅ Yes    |
| < 1.0   | ❌ No     |
```

#### 8.2.3 Security Advisories

**Creating Advisory:**

1. Go to repository → Security → Advisories
2. Click "New draft security advisory"
3. Fill in details:
   - Title
   - Description
   - Severity
   - Affected versions
   - Patched versions
4. Request CVE (if applicable)
5. Collaborate privately on fix
6. Publish when fixed

### 8.3 Incident Documentation

**Document:**

- Incident timeline
- Actions taken
- Root cause analysis
- Impact assessment
- Lessons learned
- Preventive measures

**Template:**

```markdown
# Security Incident Report

## Incident Summary
- **Date:** [YYYY-MM-DD]
- **Severity:** [Critical/High/Medium/Low]
- **Status:** [Resolved/Ongoing]

## Description
[What happened]

## Timeline
- [Time]: [Event]
- [Time]: [Action taken]

## Impact
- [What was affected]
- [Scope of impact]

## Root Cause
[Why it happened]

## Resolution
[How it was fixed]

## Lessons Learned
[What we learned]

## Preventive Measures
[How to prevent recurrence]
```

---

## 9. Compliance Requirements

### 9.1 EU Regulations

#### 9.1.1 GDPR (General Data Protection Regulation)

**Key Requirements:**

- **Lawful Basis:** Have legal basis for data processing
- **Consent:** Obtain explicit consent when required
- **Data Minimization:** Collect only necessary data
- **Purpose Limitation:** Use data only for stated purpose
- **Storage Limitation:** Delete data when no longer needed
- **Security:** Implement appropriate security measures
- **Accountability:** Document compliance efforts

**Implementation:**

- [ ] Data protection impact assessment
- [ ] Privacy by design
- [ ] Data processing records
- [ ] Data breach procedures
- [ ] Data subject rights procedures

#### 9.1.2 NIS2 Directive (Network an