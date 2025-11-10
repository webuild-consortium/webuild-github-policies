## How to contribute via GitHub

This guide explains how to contribute to a project through GitHub – from asking questions to proposing changes and participating in the review and merge process.

### 1. Start with an issue

Before writing code or suggesting edits, check if there’s already an open issue about your topic.  
If not, open a new issue to describe your question or idea.

Use an issue for:

- Asking a question or starting a discussion
- Proposing a new feature
- Reporting a bug
- Suggesting documentation changes

### 2. Discuss and decide on the next step

Once the issue is open, project maintainers and contributors will discuss it. Together, it will be decided how to move forward – for example:

- Whether a Pull Request (PR) should be opened
- Who will open it (you or a project lead)
- Whether the PR should start as a draft (work in progress) or a regular PR (ready for review)

### 3. Open a Pull Request (PR)

If you’re the one implementing the change:

1. Create a new branch on your fork
2. Commit your changes and push them
3.  Open a Pull Request linking to the issue

### 4. Review and collaboration process

When the PR is ready, the review process begins. Start by clicking on the “Files changed” tab at the top. This shows you all the code differences (diffs) introduced by the PR. There are two main ways to provide feedback.

**Option 1:** Leave quick feedback

Point your cursor over a line number so that a blue “+” icon will appear. Click the “+” to open a comment box on that specific line. At this point, you can:

1. **Write a comment**: just type your message, then click “Add single comment”

2. **Make a suggestion**: if you want to propose an actual edit to that line of code or text, add a code suggestion block using markdown syntax. GitHub automatically formats this as a suggested change box in your comment. When the PR author sees it, they’ll have a button labeled “Apply suggestion”. Clicking it automatically updates the code with your suggestion, with no manual editing needed

**Option 2:** Start a review (with “Submit review”)

If you want to review several changes together:

1. Click “Add review comment” on multiple lines
2. When finished, click “Review changes”  “Submit review”, then choose:
    - Comment: general feedback
    - Approve: ready to merge
    - Request changes: needs updates before merging

**Advanced tip:** Use GitHub’s web IDE

At any time, you can open the repository directly in a web-based editor by pressing the “.” (dot) key on your keyboard. This launches github.dev, a lightweight VS Code environment in your browser – perfect for quick edits, applying suggestions, or writing documentation.

### 5. Respond to feedback

As a contributor, you should:

- Reply to comments to clarify or explain your choices
- Commit updates to address feedback
-   Mark discussions as resolved once they’re handled

### 6. Final review and merge

Once all comments are resolved:
- The project leads or assigned maintainers will perform a final review
- If everything looks good, they’ll merge the PR into the main branch
- The related issue can then be closed
