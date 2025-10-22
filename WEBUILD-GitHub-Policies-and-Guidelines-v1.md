# WEBUILD GitHub Policies and Guidelines

## Document Information

**Version:** 1.0
**Last Updated:** October 2025
**Status:** Active

---

## Introduction

The WEBUILD Consortium leverages GitHub as its primary platform for technology collaboration across all Work Packages (WPs). This document establishes the foundational policies and guidelines that govern how GitHub is utilized throughout the consortium to facilitate joint development, review, and management of technical artifacts.

GitHub serves as the central hub where consortium partners collaborate on specifications, interface definitions, test environments, source code, and other technical deliverables. By standardizing our approach to GitHub usage, we ensure that all partners can work together efficiently while maintaining the highest standards of transparency, security, and accountability.

---

## Purpose and Objectives

This policy framework serves multiple critical purposes within the WEBUILD Consortium:

### Primary Objectives

**Establish a Common Framework**
Create a unified approach to using GitHub that all consortium partners can follow, regardless of their individual organizational practices. This common framework reduces friction in cross-organizational collaboration and ensures that all partners understand the expected workflows and procedures.

**Support Collaborative Technical Work**
Enable seamless collaboration between partners on technical deliverables. GitHub's collaborative features—including pull requests, code reviews, and issue tracking—are leveraged to facilitate meaningful technical discussions and joint development efforts.

**Maintain Version Control Excellence**
Ensure that all technical artifacts are properly versioned, with clear histories of changes, contributors, and decision points. This version control discipline is essential for maintaining the integrity of technical work and understanding how solutions evolved over time.

**Enable Comprehensive Documentation**
Provide a structured environment where technical documentation lives alongside the artifacts it describes. This co-location of code and documentation ensures that information remains current and accessible to all partners.

**Ensure Traceability and Accountability**
Maintain clear records of who contributed what, when, and why. This traceability is essential for project governance, quality assurance, and demonstrating compliance with consortium agreements and funding requirements.

**Uphold Compliance Standards**
Ensure that all GitHub activities comply with project governance requirements, data protection regulations (including GDPR), and consortium-wide policies regarding intellectual property and information security.

---

## Governance and Organizational Structure

### Consortium GitHub Organization

The WEBUILD Consortium maintains a dedicated GitHub organization at `https://github.com/webuild-consortium/`. This organization serves as the authoritative location for all technical collaboration within the project. Hosting all repositories under a single organization provides several key benefits:

- **Centralized Access Management:** Simplifies the process of granting and revoking access as partners join or leave the consortium
- **Unified Visibility:** Enables consortium leadership to maintain oversight of all technical activities
- **Consistent Branding:** Presents a cohesive identity for the consortium's technical work
- **Simplified Archival:** Facilitates long-term preservation of project outputs at the conclusion of the consortium

### Repository Organization

Each Work Package (WP) and specialized groups within Work Packages maintain their own repositories within the consortium organization. This distributed ownership model recognizes that different technical areas require autonomy while still benefiting from the shared organizational infrastructure.

Repositories typically contain:

- **Technical Specifications:** Formal definitions of interfaces, protocols, and standards
- **API Definitions:** Machine-readable and human-readable API documentation
- **Test Tools and Environments:** Software and configurations for testing implementations
- **Example Implementations:** Reference code demonstrating how to implement specifications
- **Supporting Documentation:** Guides, tutorials, and explanatory materials

### Coordination and Oversight

**Technical Coordinator Role**
The Technical Coordinator serves as the primary authority for GitHub-related policies and practices across the consortium. This role ensures consistency in how repositories are structured and managed, facilitates knowledge sharing between Work Packages, and resolves any conflicts or ambiguities in GitHub usage.

**Work Package Lead Collaboration**
Repository management decisions are made collaboratively between the Technical Coordinator and relevant WP Leads. This collaborative approach ensures that governance policies are practical and aligned with the actual needs of technical work while maintaining consortium-wide consistency.

### Essential Repository Components

Every repository within the consortium organization must include these foundational documents:

**README File**
The README serves as the entry point for anyone accessing the repository. It should clearly explain the repository's purpose, provide orientation for new contributors, and link to other relevant documentation. A well-crafted README significantly reduces the barrier to entry for partners joining ongoing technical work.

**LICENSE File**
The LICENSE file specifies the legal terms under which the repository's contents can be used, modified, and distributed. Clear licensing is essential for ensuring that consortium outputs can be properly utilized by partners and, where appropriate, by the broader community.

**CONTRIBUTING Guide**
The CONTRIBUTING guide explains how partners can contribute to the repository. It should detail the expected workflow for proposing changes, coding standards or documentation conventions to follow, and the review process that contributions will undergo.

**Supporting Documentation**
Additional documentation may include architecture diagrams, decision records, meeting notes, or any other materials that help partners understand and contribute to the technical work effectively.

---

## Access Management and Role Definitions

### Account Requirements

All consortium members participating in GitHub activities must use their own personal GitHub accounts. This requirement serves several important purposes:

- **Individual Accountability:** Ensures that all actions can be traced to specific individuals
- **Audit Trail Integrity:** Maintains the authenticity of contribution histories
- **Security Best Practices:** Prevents the security risks associated with shared accounts
- **Professional Recognition:** Allows individuals to receive proper credit for their contributions

Partners should use professional email addresses associated with their organizations when configuring their GitHub accounts for consortium work.

### Role Hierarchy and Responsibilities

The consortium employs a tiered access model that balances the need for broad participation with appropriate controls:

**Organization Owners**
Owners have full administrative control over the consortium GitHub organization. This role is typically reserved for project leadership and the Technical Coordinator. Owners can manage organization-wide settings, create new repositories, and manage access for all members.

**Repository Administrators**
Administrators (typically WP Leads and Group Leads) have full control over specific repositories. They can modify repository settings, manage access for their repositories, merge pull requests, and create releases. This role carries significant responsibility for maintaining the quality and integrity of technical outputs.

**Maintainers**
Maintainers have write access to repositories and can merge pull requests after appropriate review. They play a crucial role in keeping technical work moving forward while ensuring that quality standards are maintained. Maintainers are typically experienced contributors who understand the technical domain and the consortium's quality expectations.

**Contributors**
Contributors can create issues, comment on discussions, and submit pull requests. This role is appropriate for most consortium members who are actively participating in technical work. While contributors cannot directly modify repository contents, they can propose changes through the pull request process.

### Access Review and Maintenance

Access rights are reviewed on a regular basis to ensure that:

- Permissions remain appropriate for each member's current role in the consortium
- Former partners or members who have left the consortium have their access revoked
- New partners receive appropriate access in a timely manner
- The principle of least privilege is maintained (members have only the access they need)

These regular reviews are essential for maintaining security and ensuring compliance with consortium governance requirements.

---

## Working Practices and Workflows

### Branch Strategy

The consortium employs a structured branching strategy that balances stability with the need for ongoing development:

**Main Branch**
The `main` branch represents the stable, production-ready state of the repository. Content in the main branch should be thoroughly reviewed, tested, and approved. This branch serves as the authoritative source for released versions of specifications, stable APIs, and production-ready code.

**Develop Branch**
The `develop` branch serves as the integration point for ongoing work. Features and improvements are merged into develop first, where they can be tested together before being promoted to main. This branch allows for continuous integration of work from multiple contributors while protecting the stability of the main branch.

**Feature Branches**
Feature branches are created for specific pieces of work—whether implementing a new capability, fixing a bug, or drafting a section of a specification. Feature branches are typically short-lived and are deleted after their changes have been merged. Naming conventions for feature branches should clearly indicate their purpose (e.g., `feature/authentication-api`, `fix/typo-in-section-3`, `docs/deployment-guide`).

This branching strategy provides clear separation between stable outputs, integrated work in progress, and individual contributions, making it easier to manage complex collaborative efforts.

### Pull Request Workflow

All contributions to repositories must follow the pull request (PR) workflow. This requirement is fundamental to maintaining quality and fostering collaboration:

**Why Pull Requests Matter**
Pull requests serve multiple critical functions. They provide a structured mechanism for proposing changes, create a forum for technical discussion and review, maintain a permanent record of what changed and why, and ensure that at least two people (the author and a reviewer) have examined every change.

**Pull Request Requirements**
Every pull request should:

- Be linked to a relevant issue that explains the motivation for the change
- Include a clear description of what is being changed and why
- Be reviewed and approved by at least one other consortium partner before merging
- Pass any automated checks or tests that have been configured for the repository
- Address any feedback or concerns raised during the review process

**Cross-Partner Review**
The requirement that pull requests be reviewed by another partner (not just another person from the same organization) is particularly important. This cross-partner review ensures that technical decisions consider multiple perspectives and that knowledge is shared across organizational boundaries.

### Issue Tracking

GitHub Issues serve as the primary mechanism for tracking technical work, documenting decisions, and managing discussions:

**Issue Purposes**
Issues are used to:

- **Track Technical Progress:** Break down large technical efforts into manageable, trackable pieces of work
- **Document Discussions:** Capture technical discussions and decisions in a searchable, permanent format
- **Manage Updates:** Coordinate changes to specifications, APIs, or implementations
- **Report Problems:** Document bugs, inconsistencies, or areas needing improvement
- **Propose Enhancements:** Suggest new features or improvements to existing work

**Issue Best Practices**
Effective issue management requires:

- Clear, descriptive titles that summarize the issue at a glance
- Detailed descriptions that provide sufficient context for others to understand the issue
- Appropriate labels to categorize and prioritize issues
- Assignment to specific individuals when someone is actively working on the issue
- Regular updates to keep other partners informed of progress
- Closure with a summary of the resolution when work is complete

### Version Tagging and Releases

Version tags mark important milestones in the evolution of technical artifacts. Tags should follow semantic versioning principles (e.g., v1.0.0, v1.1.0, v2.0.0) where appropriate:

**When to Create Tags**
Tags should be created for:

- **Major Releases:** Significant versions of specifications or software that represent substantial milestones
- **Stable Snapshots:** Points in time when the repository contents are known to be stable and suitable for reference
- **Deliverable Submissions:** Versions that correspond to formal project deliverables
- **Breaking Changes:** Versions that introduce incompatible changes to APIs or interfaces

**Tag Documentation**
Each tag should be accompanied by release notes that explain what has changed since the previous version, highlight any breaking changes or important updates, and acknowledge contributors to that release.

---

## Security and Compliance

### Repository Visibility

**Default Privacy**
All repositories within the consortium organization are private by default. This default privacy setting protects consortium intellectual property, prevents premature disclosure of work in progress, allows partners to work freely without external scrutiny during development, and ensures compliance with consortium agreements regarding information sharing.

**Public Repository Approval**
Repositories may be made public only after explicit approval through the appropriate governance channels. The decision to make a repository public should consider:

- Whether the content is ready for external consumption
- Whether making the content public aligns with consortium dissemination strategies
- Whether all partners have agreed to public release
- Whether the content contains any sensitive information that should not be disclosed

### Data Protection

**Prohibited Content**
GitHub repositories must never contain:

- **Personal Data:** Information that can identify individuals (names, email addresses, phone numbers, etc.) beyond what is necessary for attribution of contributions
- **Sensitive Business Information:** Confidential business data from consortium partners
- **Credentials or Secrets:** Passwords, API keys, certificates, or other authentication credentials
- **Regulated Data:** Any data subject to special regulatory protections

**Why These Restrictions Matter**
These restrictions are not merely bureaucratic requirements—they are essential for:

- Compliance with GDPR and other data protection regulations
- Maintaining trust between consortium partners
- Preventing security breaches that could compromise partner systems
- Ensuring that the consortium meets its legal and contractual obligations

### Compliance Requirements

All partners participating in GitHub activities must:

- **Follow Consortium Data Management Policies:** Adhere to the consortium's broader policies regarding data handling and information security
- **Respect GDPR Requirements:** Ensure that any processing of personal data complies with GDPR principles
- **Honor Intellectual Property Agreements:** Respect the intellectual property rights defined in consortium agreements
- **Maintain Confidentiality:** Protect confidential information shared by other partners
- **Report Security Concerns:** Promptly report any suspected security issues or policy violations

---

## Archival and Long-Term Preservation

### Ongoing Maintenance Responsibilities

Each Work Package Lead bears responsibility for:

**Repository Structure Maintenance**
Ensuring that repositories remain well-organized, with clear directory structures, up-to-date documentation, and appropriate use of GitHub features like wikis or project boards.

**Documentation Currency**
Keeping README files, CONTRIBUTING guides, and other documentation current as the repository evolves. Outdated documentation can be more harmful than no documentation, as it misleads contributors.

**Change Documentation**
Ensuring that significant changes are properly documented through commit messages, pull request descriptions, and release notes. This documentation creates a narrative of how the technical work evolved.

**Quality Assurance**
Maintaining the quality and integrity of repository contents through consistent application of review processes and quality standards.

### Project Closure and Archival

At the conclusion of the WEBUILD project, all repositories will be archived under the consortium GitHub organization. This archival process ensures:

**Long-Term Preservation**
Technical outputs remain accessible for future reference, even after the consortium has concluded its active work. This preservation is important for demonstrating project impact and enabling future work to build on consortium achievements.

**Historical Record**
The complete history of technical collaboration is preserved, including all commits, issues, pull requests, and discussions. This historical record has value for understanding how technical decisions were made and how solutions evolved.

**Compliance with Funding Requirements**
Many funding agencies require that project outputs remain accessible for specified periods after project completion. Archival in the consortium GitHub organization helps meet these requirements.

**Continued Access**
Archived repositories remain readable, allowing former partners and the broader community (for public repositories) to access the technical outputs of the consortium's work.

---

## Conclusion

These policies and guidelines establish the foundation for effective, secure, and compliant use of GitHub within the WEBUILD Consortium. By following these practices, partners can collaborate effectively across organizational boundaries while maintaining the quality, security, and integrity of technical work.

Success in collaborative technical work requires more than just tools—it requires shared understanding of how those tools should be used. These guidelines provide that shared understanding, enabling partners to focus on the technical challenges at hand rather than on process questions.

As the consortium's work evolves, these policies may be refined based on practical experience and changing needs. Partners are encouraged to provide feedback on these guidelines to help ensure they remain practical and effective.

---

## Document History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | October 2025 | Initial version based on Project Management Handbook | WEBUILD Technical Coordination |
