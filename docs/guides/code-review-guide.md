# Guide: Code Review Best Practices

This guide provides comprehensive instructions for conducting effective code reviews in WEBUILD Consortium projects.

## Table of Contents

- [Overview](#overview)
- [Why Code Reviews Matter](#why-code-reviews-matter)
- [Code Review Process](#code-review-process)
- [Reviewer Guidelines](#reviewer-guidelines)
- [Author Guidelines](#author-guidelines)
- [Review Checklist](#review-checklist)
- [Common Issues](#common-issues)
- [Best Practices](#best-practices)
- [Tools and Automation](#tools-and-automation)

## Overview

### Purpose

Code reviews serve multiple purposes:

- **Quality Assurance**: Catch bugs and issues early
- **Knowledge Sharing**: Spread understanding across team
- **Consistency**: Maintain coding standards
- **Mentorship**: Help developers improve skills
- **Documentation**: Create discussion history
- **Security**: Identify security vulnerabilities

### Principles

Effective code reviews follow these principles:

1. **Constructive**: Focus on improvement, not criticism
2. **Timely**: Review promptly to maintain momentum
3. **Thorough**: Check all aspects systematically
4. **Respectful**: Maintain professional tone
5. **Educational**: Explain reasoning behind feedback
6. **Collaborative**: Work together toward better code

## Why Code Reviews Matter

### Benefits for Code Quality

- **Bug Detection**: Find issues before production
- **Design Improvements**: Identify better approaches
- **Performance Optimization**: Spot inefficiencies
- **Security Hardening**: Catch vulnerabilities
- **Maintainability**: Ensure code is understandable

### Benefits for Team

- **Knowledge Transfer**: Share expertise across team
- **Skill Development**: Learn from each other
- **Team Cohesion**: Build collaborative culture
- **Code Ownership**: Shared responsibility
- **Consistency**: Align on standards and practices

### Benefits for Project

- **Reduced Technical Debt**: Prevent accumulation
- **Better Documentation**: Improve code clarity
- **Faster Onboarding**: Clearer codebase
- **Higher Confidence**: Trust in code quality
- **EU Compliance**: Meet quality requirements

## Code Review Process

### Step 1: Preparation (Author)

Before requesting review:

1. **Self-Review**
   ```bash
   # Review your own changes first
   git diff main...feature-branch

   # Check for common issues
   - Debug statements
   - Commented code
   - TODO comments
   - Console logs
   - Hardcoded values
   ```

2. **Run Tests**
   ```bash
   # Ensure all tests pass
   npm test
   # or
   pytest
   # or
   mvn test
   ```

3. **Check Code Quality**
   ```bash
   # Run linter
   npm run lint

   # Check formatting
   npm run format:check

   # Run static analysis
   npm run analyze
   ```

4. **Update Documentation**
   - Update README if needed
   - Add/update code comments
   - Update API documentation
   - Add changelog entry

5. **Write Clear PR Description**
   - Use the PR template
   - Explain what and why
   - Link related issues
   - Highlight areas needing attention

### Step 2: Request Review

1. **Create Pull Request**
   - Use descriptive title
   - Fill out PR template completely
   - Add appropriate labels
   - Link related issues

2. **Request Reviewers**
   - Select 1-2 reviewers
   - Choose reviewers with relevant expertise
   - Consider workload distribution
   - Tag in comments if urgent

3. **Provide Context**
   ```markdown
   ## Review Focus Areas

   Please pay special attention to:
   - [ ] Error handling in `src/api/handler.ts`
   - [ ] Performance of new algorithm in `src/utils/processor.ts`
   - [ ] Security implications of authentication changes

   ## Testing Notes

   Tested on:
   - Chrome 120
   - Firefox 121
   - Safari 17

   ## Questions for Reviewers

   1. Is the error handling approach appropriate?
   2. Should we add more tests for edge cases?
   ```

### Step 3: Conduct Review (Reviewer)

1. **Understand Context**
   - Read PR description thoroughly
   - Review linked issues
   - Understand the problem being solved
   - Check acceptance criteria

2. **Review Code Systematically**
   - Start with high-level structure
   - Then dive into details
   - Check each file methodically
   - Use review checklist

3. **Test Changes Locally**
   ```bash
   # Checkout PR branch
   gh pr checkout [PR-NUMBER]
   # or
   git fetch origin pull/[PR-NUMBER]/head:pr-[PR-NUMBER]
   git checkout pr-[PR-NUMBER]

   # Install dependencies
   npm install

   # Run tests
   npm test

   # Test manually
   npm start
   ```

4. **Provide Feedback**
   - Use inline comments for specific issues
   - Use general comments for overall feedback
   - Be specific and actionable
   - Explain reasoning
   - Suggest improvements

### Step 4: Address Feedback (Author)

1. **Review All Comments**
   - Read all feedback carefully
   - Ask for clarification if needed
   - Prioritize critical issues
   - Plan changes

2. **Make Changes**
   ```bash
   # Make requested changes
   git add .
   git commit -m "fix: address review feedback

   - Improve error handling
   - Add missing tests
   - Update documentation"

   # Push changes
   git push origin feature-branch
   ```

3. **Respond to Comments**
   - Mark resolved comments
   - Explain changes made
   - Discuss alternative approaches
   - Thank reviewers for feedback

4. **Request Re-review**
   - Tag reviewers when ready
   - Summarize changes made
   - Highlight remaining questions

### Step 5: Approval and Merge

1. **Obtain Approval**
   - Wait for required approvals
   - Address any final comments
   - Ensure CI/CD passes

2. **Final Checks**
   - [ ] All conversations resolved
   - [ ] All tests passing
   - [ ] Branch up-to-date with main
   - [ ] No merge conflicts
   - [ ] Documentation updated

3. **Merge**
   ```bash
   # Squash and merge (recommended)
   # or
   # Merge commit
   # or
   # Rebase and merge
   ```

4. **Clean Up**
   ```bash
   # Delete feature branch
   git branch -d feature-branch
   git push origin --delete feature-branch
   ```

## Reviewer Guidelines

### What to Look For

#### 1. Functionality

- [ ] **Correctness**: Does the code do what it's supposed to?
- [ ] **Edge Cases**: Are edge cases handled?
- [ ] **Error Handling**: Are errors handled properly?
- [ ] **Logic**: Is the logic sound and efficient?
- [ ] **Requirements**: Does it meet acceptance criteria?

#### 2. Design and Architecture

- [ ] **Design Patterns**: Are appropriate patterns used?
- [ ] **Modularity**: Is code properly modularized?
- [ ] **Reusability**: Can code be reused?
- [ ] **Coupling**: Is coupling minimized?
- [ ] **Cohesion**: Is cohesion maximized?
- [ ] **SOLID Principles**: Are SOLID principles followed?

#### 3. Code Quality

- [ ] **Readability**: Is code easy to understand?
- [ ] **Naming**: Are names clear and descriptive?
- [ ] **Complexity**: Is complexity reasonable?
- [ ] **Duplication**: Is there unnecessary duplication?
- [ ] **Comments**: Are comments helpful and current?
- [ ] **Formatting**: Does code follow style guide?

#### 4. Testing

- [ ] **Test Coverage**: Are tests comprehensive?
- [ ] **Test Quality**: Are tests meaningful?
- [ ] **Edge Cases**: Are edge cases tested?
- [ ] **Test Clarity**: Are tests easy to understand?
- [ ] **Test Isolation**: Are tests independent?

#### 5. Security

- [ ] **Input Validation**: Is input validated?
- [ ] **Authentication**: Is auth implemented correctly?
- [ ] **Authorization**: Are permissions checked?
- [ ] **Data Protection**: Is sensitive data protected?
- [ ] **Injection Prevention**: Are injections prevented?
- [ ] **Dependencies**: Are dependencies secure?

#### 6. Performance

- [ ] **Efficiency**: Are algorithms efficient?
- [ ] **Resource Usage**: Is resource usage reasonable?
- [ ] **Scalability**: Will it scale?
- [ ] **Caching**: Is caching used appropriately?
- [ ] **Database**: Are queries optimized?

#### 7. Documentation

- [ ] **Code Comments**: Are complex parts explained?
- [ ] **API Documentation**: Is API documented?
- [ ] **README**: Is README updated?
- [ ] **Changelog**: Is changelog updated?
- [ ] **Examples**: Are examples provided?

### How to Provide Feedback

#### Use Clear Language

**Good**:
```markdown
Consider extracting this logic into a separate function for better
reusability and testability.

Suggestion:
```typescript
function validateUserInput(input: UserInput): ValidationResult {
  // validation logic here
}
```
```

**Avoid**:
```markdown
This is wrong.
```

#### Be Specific

**Good**:
```markdown
Line 45: This function could throw an error if `user` is null.
Consider adding a null check:

if (!user) {
  throw new Error('User not found');
}
```

**Avoid**:
```markdown
Add error handling.
```

#### Explain Reasoning

**Good**:
```markdown
Using `const` instead of `let` here would prevent accidental
reassignment and make the code's intent clearer. Since this
value is never reassigned, `const` is more appropriate.
```

**Avoid**:
```markdown
Use const.
```

#### Offer Alternatives

**Good**:
```markdown
This approach works, but have you considered using the built-in
`Array.reduce()` method? It would be more concise and potentially
more performant:

```javascript
const sum = numbers.reduce((acc, num) => acc + num, 0);
```

What do you think?
```

**Avoid**:
```markdown
This is inefficient.
```

#### Distinguish Severity

Use labels to indicate importance:

- **[CRITICAL]**: Must be fixed (security, bugs)
- **[IMPORTANT]**: Should be fixed (design issues)
- **[SUGGESTION]**: Nice to have (improvements)
- **[QUESTION]**: Seeking clarification
- **[NITPICK]**: Minor style issues

**Example**:
```markdown
[CRITICAL] This SQL query is vulnerable to injection attacks.
Use parameterized queries instead.

[SUGGESTION] Consider adding a helper function to reduce duplication.

[NITPICK] Missing space after comma on line 23.
```

### Review Etiquette

#### Do's

✅ **Be respectful and professional**
✅ **Focus on the code, not the person**
✅ **Assume good intentions**
✅ **Ask questions rather than make demands**
✅ **Praise good work**
✅ **Provide constructive feedback**
✅ **Explain your reasoning**
✅ **Offer to discuss complex issues**

#### Don'ts

❌ **Don't be condescending**
❌ **Don't use sarcasm**
❌ **Don't make it personal**
❌ **Don't nitpick excessively**
❌ **Don't block on style preferences**
❌ **Don't approve without reviewing**
❌ **Don't delay reviews unnecessarily**

### Example Comments

#### Positive Feedback

```markdown
Great job handling this edge case! This will prevent the bug we
saw in production last week.
```

```markdown
Nice refactoring! This is much more readable than the previous
implementation.
```

```markdown
Excellent test coverage. I especially like how you tested the
error scenarios.
```

#### Constructive Feedback

```markdown
This function is doing too many things. Consider breaking it into
smaller, focused functions:

1. `validateInput()` - validate the input
2. `processData()` - process the data
3. `saveResult()` - save the result

This would make the code easier to test and maintain.
```

```markdown
I notice this pattern is repeated in several places. Could we
extract it into a utility function? This would make it easier to
maintain and test.
```

```markdown
The variable name `temp` doesn't convey much meaning. Could you
rename it to something more descriptive like `processedUserData`?
```

## Author Guidelines

### Preparing for Review

1. **Keep PRs Small**
   - Aim for < 400 lines changed
   - One logical change per PR
   - Break large features into smaller PRs
   - Easier to review thoroughly

2. **Write Clear Descriptions**
   - Explain what and why
   - Provide context
   - Link related issues
   - Highlight important changes

3. **Self-Review First**
   - Review your own code
   - Fix obvious issues
   - Add missing tests
   - Update documentation

4. **Make It Easy to Review**
   - Clean commit history
   - Logical commit messages
   - Remove debug code
   - Format code properly

### Responding to Feedback

1. **Be Open-Minded**
   - Consider all feedback
   - Don't take it personally
   - Ask for clarification
   - Be willing to learn

2. **Respond Promptly**
   - Address feedback quickly
   - Don't let PRs go stale
   - Communicate delays
   - Keep reviewers updated

3. **Engage in Discussion**
   - Explain your reasoning
   - Ask questions
   - Propose alternatives
   - Seek consensus

4. **Make Changes Thoughtfully**
   - Address all feedback
   - Make requested changes
   - Add tests for changes
   - Update documentation

### Example Responses

#### Accepting Feedback

```markdown
Good catch! I've updated the code to handle the null case.
Added a test for this scenario as well.
```

```markdown
You're right, this is more readable. I've refactored it as
suggested. Thanks!
```

#### Asking for Clarification

```markdown
Could you elaborate on what you mean by "more efficient"?
Are you concerned about time complexity or memory usage?
```

```markdown
I'm not sure I understand the suggested approach. Could you
provide a code example?
```

#### Proposing Alternatives

```markdown
I see your point about extracting this into a function. However,
this logic is only used here and is tightly coupled to this
component's state. What if we kept it inline but added more
comments to explain the logic?
```

```markdown
While I agree this could be more efficient, the current
implementation is clearer and the performance difference is
negligible for our use case. Could we keep it as is for now
and optimize if it becomes a bottleneck?
```

## Review Checklist

### Quick Review Checklist

Use this for fast reviews:

- [ ] Code compiles/runs without errors
- [ ] Tests pass
- [ ] No obvious bugs
- [ ] Follows coding standards
- [ ] Documentation updated
- [ ] No security issues
- [ ] PR description is clear

### Comprehensive Review Checklist

Use this for thorough reviews:

#### Functionality
- [ ] Code works as intended
- [ ] Meets acceptance criteria
- [ ] Edge cases handled
- [ ] Error handling implemented
- [ ] No regressions introduced

#### Code Quality
- [ ] Code is readable and maintainable
- [ ] Names are clear and descriptive
- [ ] Functions are focused and small
- [ ] No unnecessary complexity
- [ ] No code duplication
- [ ] Comments are helpful
- [ ] Follows style guide

#### Testing
- [ ] Tests are comprehensive
- [ ] Tests are meaningful
- [ ] Edge cases tested
- [ ] Error cases tested
- [ ] Tests are maintainable
- [ ] Coverage is adequate

#### Security
- [ ] Input is validated
- [ ] Output is sanitized
- [ ] Authentication works correctly
- [ ] Authorization is enforced
- [ ] No sensitive data exposed
- [ ] Dependencies are secure
- [ ] No injection vulnerabilities

#### Performance
- [ ] Algorithms are efficient
- [ ] No unnecessary operations
- [ ] Resources used appropriately
- [ ] Queries are optimized
- [ ] Caching used where appropriate

#### Documentation
- [ ] README updated
- [ ] API documented
- [ ] Complex code explained
- [ ] Examples provided
- [ ] Changelog updated

#### Git Hygiene
- [ ] Commit messages are clear
- [ ] No merge commits (if squashing)
- [ ] No debug commits
- [ ] Branch is up-to-date

## Common Issues

### Issue: Large Pull Requests

**Problem**: PR has 1000+ lines changed

**Solutions**:
- Ask author to split into smaller PRs
- Review in multiple sessions
- Focus on high-level design first
- Use automated tools for style/formatting

### Issue: Unclear Changes

**Problem**: Can't understand what the code does

**Solutions**:
- Ask for better PR description
- Request code comments
- Ask author to explain in discussion
- Schedule pairing session

### Issue: Missing Tests

**Problem**: No tests for new functionality

**Solutions**:
- Request tests before approval
- Suggest specific test cases
- Offer to help write tests
- Block merge until tests added

### Issue: Style Violations

**Problem**: Code doesn't follow style guide

**Solutions**:
- Use automated formatters
- Configure pre-commit hooks
- Don't block on minor style issues
- Focus on substantive issues

### Issue: Disagreement on Approach

**Problem**: Reviewer and author disagree

**Solutions**:
- Discuss pros and cons
- Seek third opinion
- Escalate to tech lead
- Document decision
- Move forward with consensus

## Best Practices

### For Reviewers

1. **Review Promptly**
   - Within 24 hours for urgent
   - Within 48 hours normally
   - Communicate if delayed

2. **Be Thorough But Efficient**
   - Use checklist
   - Focus on important issues
   - Don't nitpick excessively
   - Automate what you can

3. **Provide Actionable Feedback**
   - Be specific
   - Explain reasoning
   - Suggest solutions
   - Offer examples

4. **Maintain Positive Tone**
   - Be respectful
   - Praise good work
   - Focus on learning
   - Build team culture

### For Authors

1. **Keep PRs Small**
   - < 400 lines ideal
   - One feature per PR
   - Break up large changes
   - Easier to review

2. **Write Clear Descriptions**
   - Explain what and why
   - Provide context
   - Link issues
   - Highlight concerns

3. **Respond Promptly**
   - Address feedback quickly
   - Keep PR moving
   - Communicate delays
   - Be responsive

4. **Be Open to Feedback**
   - Don't take it personally
   - Consider suggestions
   - Ask questions
   - Learn and improve

### For Teams

1. **Establish Standards**
   - Define coding standards
   - Create review guidelines
   - Set expectations
   - Document processes

2. **Use Automation**
   - Automated testing
   - Code formatting
   - Static analysis
   - Security scanning

3. **Foster Learning Culture**
   - Share knowledge
   - Mentor junior developers
   - Discuss best practices
   - Celebrate improvements

4. **Measure and Improve**
   - Track review metrics
   - Identify bottlenecks
   - Gather feedback
   - Continuously improve

## Tools and Automation

### Code Review Tools

- **GitHub Pull Requests**: Built-in review features
- **GitLab Merge Requests**: Similar to GitHub
- **Gerrit**: Advanced code review
- **Review Board**: Standalone review tool

### Static Analysis

```bash
# JavaScript/TypeScript
npm install --save-dev eslint
eslint src/

# Python
pip install pylint
pylint src/

# Java
mvn checkstyle:check

# Go
golangci-lint run
```

### Code Formatting

```bash
# JavaScript/TypeScript
npm install --save-dev prettier
prettier --write src/

# Python
pip install black
black src/

# Java
mvn formatter:format

# Go
gofmt -w .
```

### Security Scanning

```bash
# Dependency scanning
npm audit
pip-audit
mvn dependency-check:check

# Code scanning
npm install --save-dev snyk
snyk test
```

### Test Coverage

```bash
# JavaScript
npm test -- --coverage

# Python
pytest --cov=src

# Java
mvn test jacoco:report

# Go
go test -cover ./...
```

## Related Documentation

- [Contribution Guidelines](../02-contribution-guidelines.md)
- [Branching and Workflow](../07-branching-and-workflow.md)
- [GitHub Policies and Guidelines](../01-github-policies-and-guidelines.md)
- [Creating New Repository Guide](./creating-new-repository.md)

---

**WEBUILD Consortium Project**

This project is funded by the European Union under [GRANT NUMBER/PROGRAM]. Views and opinions expressed are however those of the author(s) only and do not necessarily reflect those of the European Union or [FUNDING AGENCY]. Neither the European Union nor the granting authority can be held responsible for them.