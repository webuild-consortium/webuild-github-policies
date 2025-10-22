# Glossary

This glossary provides definitions for terms and concepts used throughout the WEBUILD GitHub Policies and Guidelines documentation.

## A

### Access Control
The practice of restricting access to resources based on user identity and permissions. In GitHub, this includes repository permissions, team memberships, and organization roles.

### Admin
The highest permission level in GitHub repositories, granting full control including the ability to delete repositories, manage settings, and control access.

### Apache License 2.0
An open-source software license that allows users to freely use, modify, and distribute software while providing patent protection. The standard license for WEBUILD Consortium projects.

### API (Application Programming Interface)
A set of protocols and tools for building software applications. GitHub provides a REST API and GraphQL API for programmatic access.

### Audit Log
A record of all activities and changes within a GitHub organization or repository, used for security monitoring and compliance.

## B

### Branch
A parallel version of a repository that allows development work without affecting the main codebase. Common branches include `main`, `develop`, and feature branches.

### Branch Protection
Rules that enforce certain workflows before changes can be merged into protected branches, such as requiring pull request reviews or passing status checks.

### Breaking Change
A modification to code that is not backward compatible and may require users to update their implementations. Typically results in a major version increment.

## C

### CI/CD (Continuous Integration/Continuous Deployment)
Automated processes for building, testing, and deploying code. GitHub Actions is commonly used for CI/CD in WEBUILD projects.

### Clone
Creating a local copy of a remote repository on your computer using `git clone`.

### Code of Conduct
A document that establishes expectations for behavior and participation in a project community. Required for all WEBUILD repositories.

### Code Owner
A person or team designated as responsible for specific files or directories in a repository, automatically requested for review on relevant pull requests.

### Code Review
The systematic examination of source code by peers to identify bugs, improve quality, and share knowledge.

### Collaborator
A user who has been granted direct access to a repository, with permissions ranging from Read to Admin.

### Commit
A snapshot of changes to files in a repository, identified by a unique SHA hash. Commits form the history of a project.

### Commit Message
A description accompanying a commit that explains what changes were made and why. Should follow conventional commit format.

### Consortium
A group of organizations working together toward common goals. The WEBUILD Consortium consists of multiple partner organizations funded by the EU.

### Conventional Commits
A specification for commit messages that provides a structured format: `type(scope): description`. Examples: `feat:`, `fix:`, `docs:`.

### CODEOWNERS
A file that defines individuals or teams responsible for code in a repository, used to automatically request reviews.

## D

### Dependabot
GitHub's automated tool for keeping dependencies up-to-date and alerting about security vulnerabilities.

### Deploy Key
An SSH key that grants access to a single repository, typically used for automated deployments.

### Develop Branch
The main integration branch for ongoing development work, where feature branches are merged before being released to main.

### Diff
A comparison showing the differences between two versions of files, commonly used in pull requests to review changes.

## E

### EU (European Union)
The funding body for the WEBUILD Consortium project. All repositories must include appropriate EU funding acknowledgments.

### Environment Variable
A dynamic value that can affect running processes, often used to store configuration and secrets outside of code.

## F

### Feature Branch
A branch created to develop a specific feature or fix, typically named `feature/description` or `feature/issue-number-description`.

### Feature Freeze
A period before a release when no new features are accepted, only bug fixes and documentation updates.

### Fork
A personal copy of another user's repository that allows you to freely experiment without affecting the original project.

### Forking Workflow
A collaboration model where contributors fork a repository, make changes in their fork, and submit pull requests to the original repository.

## G

### Git
A distributed version control system that tracks changes in source code during software development.

### GitHub
A web-based platform for version control and collaboration using Git, hosting the WEBUILD Consortium repositories.

### GitHub Actions
GitHub's built-in CI/CD platform for automating workflows, testing, and deployments.

### GitHub CLI (gh)
A command-line tool for interacting with GitHub, allowing repository management and workflow automation from the terminal.

### GitHub Pages
A static site hosting service that publishes websites directly from GitHub repositories.

### GitFlow
A branching model that defines a strict branching structure designed around project releases, using main, develop, feature, release, and hotfix branches.

### .gitignore
A file specifying which files and directories Git should ignore and not track in version control.

## H

### HEAD
A reference to the current commit in the working directory, typically pointing to the tip of the current branch.

### Hotfix
An urgent fix for a critical bug in production, typically branched from main and merged back to both main and develop.

### Hotfix Branch
A branch created from main to quickly patch production issues, named `hotfix/version` or `hotfix/description`.

## I

### Issue
A GitHub feature for tracking bugs, enhancements, tasks, and questions. Issues can be labeled, assigned, and linked to pull requests.

### Issue Template
A predefined format for creating issues, ensuring consistent information is provided. Common templates include bug reports and feature requests.

## L

### Label
A tag applied to issues and pull requests for categorization and filtering, such as `bug`, `enhancement`, or `documentation`.

### License
Legal terms under which software can be used, modified, and distributed. WEBUILD projects use Apache License 2.0.

### Linter
A tool that analyzes code for potential errors, style violations, and suspicious constructs. Examples: ESLint, Pylint, Checkstyle.

## M

### Main Branch
The primary branch containing production-ready code. Previously called `master`, now standardized as `main`.

### Maintainer
A team member with Maintain permission level, able to manage repository settings and workflows but not delete the repository.

### Markdown
A lightweight markup language used for formatting text in README files, documentation, and GitHub comments.

### Merge
Combining changes from one branch into another, integrating the work from different development streams.

### Merge Conflict
A situation where Git cannot automatically merge changes because the same lines were modified differently in two branches.

### Milestone
A collection of issues and pull requests grouped together, typically representing a release or project phase.

### MCP (Model Context Protocol)
A protocol for managing context in AI models, relevant for AI-assisted development in WEBUILD projects.

## O

### OAuth
An open standard for access delegation, commonly used for secure authorization without sharing passwords.

### Open Source
Software with source code that anyone can inspect, modify, and enhance, distributed under an open-source license.

### Organization
A GitHub account that can own repositories and have multiple members with different permission levels. WEBUILD Consortium is an organization.

## P

### PAT (Personal Access Token)
A token used instead of a password for authenticating to GitHub via HTTPS or the API, with configurable scopes and expiration.

### Patch
A small update that fixes bugs without adding new features, resulting in a patch version increment (X.Y.Z).

### Permission Level
The level of access a user has to a repository: Read, Triage, Write, Maintain, or Admin.

### PR (Pull Request)
A request to merge changes from one branch into another, enabling code review and discussion before integration.

### PR Template
A predefined format for pull request descriptions, ensuring consistent information about changes, testing, and review requirements.

### Protected Branch
A branch with rules that prevent force pushes, require reviews, or enforce status checks before merging.

## R

### README
A markdown file (README.md) that provides essential information about a project, including description, installation, and usage instructions.

### Rebase
Reapplying commits from one branch onto another, creating a linear history. Alternative to merging.

### Release
A specific version of software packaged for distribution, typically tagged in Git and published on GitHub with release notes.

### Release Branch
A branch created to prepare a new release, allowing final testing and bug fixes while development continues on develop.

### Remote
A version of a repository hosted on a server (like GitHub), referenced by name (typically `origin`).

### Repository (Repo)
A storage location for a project, containing all files, history, and branches. Can be public or private.

### Reviewer
A person assigned to review a pull request, providing feedback and approval before merging.

## S

### Semantic Versioning (SemVer)
A versioning scheme using MAJOR.MINOR.PATCH format (e.g., 1.2.3) to communicate the nature of changes.

### SHA (Secure Hash Algorithm)
A unique identifier for each commit, generated from the commit's content. Example: `a3f2b1c`.

### Squash
Combining multiple commits into a single commit, often done when merging pull requests to maintain a clean history.

### SSH (Secure Shell)
A cryptographic network protocol for secure communication, commonly used for Git operations with SSH keys.

### SSH Key
A cryptographic key pair used for authentication, allowing secure access to repositories without passwords.

### Staging Area
An intermediate area where changes are prepared before committing, also called the "index".

### Status Check
An automated test or validation that runs on pull requests, such as CI builds or linting checks.

## T

### Tag
A reference to a specific commit, typically used to mark release points (e.g., v1.0.0).

### Team
A group of organization members with shared access to repositories, simplifying permission management.

### Template Repository
A repository marked as a template, allowing users to create new repositories with the same directory structure and files.

### Two-Factor Authentication (2FA)
An additional security layer requiring a second form of verification beyond a password, mandatory for WEBUILD organization members.

## U

### Upstream
The original repository from which a fork was created, or the remote repository being tracked by a local branch.

## V

### Version Control
A system for tracking changes to files over time, allowing multiple people to collaborate and revert to previous versions.

### Vulnerability
A security weakness that could be exploited to compromise a system. GitHub provides automated vulnerability scanning.

## W

### WEBUILD
The EU-funded consortium project for which these GitHub policies and guidelines are created.

### Webhook
An HTTP callback that sends real-time notifications when specific events occur in a repository.

### Work Package (WP)
A major division of work in the WEBUILD project, such as WP1, WP2, WP3, WP4, each with specific objectives and deliverables.

### Workflow
An automated process defined in GitHub Actions, triggered by events like pushes or pull requests.

### Write Permission
A permission level allowing users to push commits, create branches, and merge pull requests, but not modify repository settings.

## Acronyms and Abbreviations

| Acronym | Full Term | Description |
|---------|-----------|-------------|
| API | Application Programming Interface | Interface for software interaction |
| CI/CD | Continuous Integration/Continuous Deployment | Automated build and deployment |
| CLI | Command Line Interface | Text-based interface for commands |
| CODEOWNERS | Code Owners File | File defining code ownership |
| CONTRIBUTING | Contributing Guidelines | File with contribution instructions |
| CRUD | Create, Read, Update, Delete | Basic data operations |
| CSS | Cascading Style Sheets | Styling language for web pages |
| CVE | Common Vulnerabilities and Exposures | Security vulnerability database |
| CVSS | Common Vulnerability Scoring System | Vulnerability severity rating |
| EU | European Union | Funding organization |
| FAQ | Frequently Asked Questions | Common questions and answers |
| GDPR | General Data Protection Regulation | EU data protection law |
| HTML | HyperText Markup Language | Web page structure language |
| HTTP | HyperText Transfer Protocol | Web communication protocol |
| HTTPS | HTTP Secure | Encrypted HTTP |
| IDE | Integrated Development Environment | Software development tool |
| IP | Intellectual Property | Legal rights to creations |
| JSON | JavaScript Object Notation | Data interchange format |
| JWT | JSON Web Token | Authentication token format |
| MCP | Model Context Protocol | AI context management |
| OAuth | Open Authorization | Authorization framework |
| OS | Operating System | System software |
| PAT | Personal Access Token | GitHub authentication token |
| PR | Pull Request | Code review request |
| README | Read Me File | Project documentation file |
| REST | Representational State Transfer | API architectural style |
| SAML | Security Assertion Markup Language | Authentication standard |
| SCIM | System for Cross-domain Identity Management | User provisioning standard |
| SDK | Software Development Kit | Development tools package |
| SemVer | Semantic Versioning | Version numbering scheme |
| SHA | Secure Hash Algorithm | Cryptographic hash function |
| SSH | Secure Shell | Secure network protocol |
| SSL | Secure Sockets Layer | Security protocol |
| TLS | Transport Layer Security | Cryptographic protocol |
| UI | User Interface | User interaction layer |
| URL | Uniform Resource Locator | Web address |
| UX | User Experience | User interaction design |
| VCS | Version Control System | Change tracking system |
| WP | Work Package | Project work division |
| XML | eXtensible Markup Language | Markup language |
| YAML | YAML Ain't Markup Language | Data serialization format |

## Related Documentation

- [GitHub Policies and Guidelines](../01-github-policies-and-guidelines.md)
- [Contribution Guidelines](../02-contribution-guidelines.md)
- [Repository Management](../04-repository-management.md)
- [Tools and Resources](./tools-and-resources.md)
- [FAQ](./faq.md)

---

**WEBUILD Consortium Project**

This project is funded by the European Union under [GRANT NUMBER/PROGRAM]. Views and opinions expressed are however those of the author(s) only and do not necessarily reflect those of the European Union or [FUNDING AGENCY]. Neither the European Union nor the granting authority can be held responsible for them.