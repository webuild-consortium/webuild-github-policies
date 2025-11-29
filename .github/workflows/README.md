# GitHub Actions Workflows

This directory contains GitHub Actions workflows and supporting scripts for automated document conversion.

## Overview

The primary workflow in this directory automatically converts the `GITHUB_POLICIES_AND_GUIDELINES.md` markdown file into a professionally styled `.docx` document with rendered Mermaid diagrams, and publishes it as a GitHub Release.

## Workflows

### [`build-docx.yml`](build-docx.yml)

**Purpose:** Automated conversion of markdown to DOCX with Mermaid diagram rendering and release publishing.

**Triggers:**
- **Push to `main` branch** when `GITHUB_POLICIES_AND_GUIDELINES.md` is modified
- **Manual dispatch** via GitHub Actions UI

**What it does:**

1. **Version Extraction** - Extracts document version from the markdown file
2. **Mermaid Diagram Rendering** - Converts all Mermaid diagrams to PNG images using Docker
3. **Markdown Processing** - Replaces Mermaid code blocks with image references
4. **DOCX Conversion** - Uses Pandoc to convert markdown to DOCX with custom styling
5. **Table Enhancement** - Adds borders and styling to all tables
6. **Artifact Upload** - Uploads the generated DOCX as a workflow artifact
7. **Release Creation** - Creates a GitHub Release with the DOCX file attached

**Workflow Steps:**

```yaml
jobs:
  build-and-release:
    runs-on: ubuntu-24.04
    steps:
      - Checkout repository
      - Set up Python 3.13
      - Install Python dependencies
      - Prepare for conversion (extract version, date, commit hash)
      - Extract and render Mermaid diagrams (using Docker)
      - Process markdown with rendered diagrams
      - Convert to DOCX using Pandoc
      - Add table borders
      - Upload artifact
      - Create GitHub Release
```

**Release Naming Convention:**
- **Tag:** `v{VERSION}-{YYYYMM}-{SHORT_SHA}`
- **Example:** `v1.0.0-202411-a1b2c3d`

**Permissions Required:**
- `contents: write` - For creating releases and uploading assets

## Supporting Scripts

### [`create_styled_conversion.py`](create_styled_conversion.py)

**Purpose:** Main conversion script that processes markdown and creates custom styling.

**Key Functions:**

- **`create_reference_docx()`** - Creates a custom reference document with:
  - Code block styling (gray background, Consolas font)
  - Inline code styling (reddish color, Consolas font)
  - Table styling (grid borders, gray headers)

- **`extract_mermaid_blocks()`** - Extracts all Mermaid code blocks from markdown

- **`process_markdown_with_mermaid()`** - Replaces Mermaid blocks with image references

**Usage:**
```bash
python3 create_styled_conversion.py <input_markdown_file> [--image-path-prefix=<prefix>]
```

**Arguments:**
- `input_file` - Path to the input markdown file (required)
- `--image-path-prefix` - Prefix to prepend to image paths (optional, used for GitHub Actions)

**Styling Details:**
- **Code blocks:** Gray background (`#F0F0F0`), Consolas 9pt, dark gray text
- **Inline code:** Reddish color (`RGB(199, 37, 78)`), Consolas 9pt
- **Tables:** Grid borders, gray headers (`#D9D9D9`), bold header text

### [`add_table_borders.py`](add_table_borders.py)

**Purpose:** Post-processes the DOCX file to add borders and styling to all tables.

**Features:**
- Adds black borders to all table cells (1.5pt width)
- Applies gray background to header rows (`#D9D9D9`)
- Makes header text bold

**Usage:**
```bash
python3 add_table_borders.py
```

**Note:** This script expects `GITHUB_POLICIES_AND_GUIDELINES.docx` to exist in the current directory.

## Configuration Files

### [`requirements.txt`](requirements.txt)

Python dependencies required for the conversion scripts:
```
python-docx>=1.1.0
```

## Docker Images Used

### Mermaid CLI
- **Image:** `minlag/mermaid-cli:11.12.0`
- **Purpose:** Rendering Mermaid diagrams to PNG images
- **Options:** `-b transparent` (transparent background)

### Pandoc
- **Image:** `docker://pandoc/core:3.8`
- **Purpose:** Converting markdown to DOCX format
- **Options:** Custom reference document for styling

## Generated Files

During the workflow execution, the following files are generated:

### Temporary Files
- `temp_with_images.md` - Markdown with Mermaid blocks replaced by image references
- `diagram_*.mmd` - Temporary Mermaid diagram files (cleaned up after rendering)

### Output Files
- `GITHUB_POLICIES_AND_GUIDELINES.docx` - Final styled DOCX document
- `custom-reference.docx` - Pandoc reference document with custom styles
- `mermaid-diagrams/diagram_*.png` - Rendered Mermaid diagrams (cached)

### Artifacts
- **Workflow Artifact:** `generated-docx` - Contains the final DOCX file
- **GitHub Release:** Attached DOCX file with version tag

## Workflow Outputs

### Artifacts

The workflow uploads the generated DOCX file as an artifact named `generated-docx`, which can be downloaded from the Actions tab.

### Releases

When triggered on the `main` branch, the workflow creates a GitHub Release with:

- **Tag:** `v{VERSION}-{REVISION}`
- **Title:** `GitHub Policies and Guidelines v{VERSION}-{REVISION}`
- **Assets:** `GITHUB_POLICIES_AND_GUIDELINES.docx`
- **Release Notes:** Includes version, build date, commit hash, and changelog link

**Example Release:**
```
Tag: v1.0.0-202411-a1b2c3d
Title: GitHub Policies and Guidelines v1.0.0-202411-a1b2c3d

Document Information:
- Version: 1.0.0
- Build Date: 202411 (YYYYMM format)
- Commit: a1b2c3d (view commit)
- Full Revision: 202411-a1b2c3d
```

## Environment Variables

The workflow sets the following environment variables:

- `DOCUMENT_VERSION` - Extracted from markdown file (e.g., `1.0.0`)
- `BUILD_DATE` - Current date in YYYYMM format (e.g., `202411`)
- `COMMIT_SHA` - Short commit hash (e.g., `a1b2c3d`)
- `REVISION` - Combined build date and commit hash (e.g., `202411-a1b2c3d`)

## Troubleshooting

### Workflow Fails at Mermaid Rendering

**Cause:** Docker image not available or Mermaid syntax errors

**Solution:**
1. Check Mermaid diagram syntax in the markdown file
2. Verify Docker image `minlag/mermaid-cli:11.12.0` is accessible
3. Review workflow logs for specific error messages

### DOCX Not Generated

**Cause:** Pandoc conversion failure or missing dependencies

**Solution:**
1. Ensure `requirements.txt` dependencies are installed
2. Verify `custom-reference.docx` is created successfully
3. Check Pandoc Docker image is accessible

### Release Not Created

**Cause:** Insufficient permissions or not on `main` branch

**Solution:**
1. Ensure workflow has `contents: write` permission
2. Verify push is to `main` branch
3. Check if version extraction succeeded

### Tables Missing Borders

**Cause:** `add_table_borders.py` script failed

**Solution:**
1. Verify `python-docx` is installed correctly
2. Check DOCX file exists before running the script
3. Review script output for error messages

## Performance

### First Run
- **Time:** ~3-5 minutes (includes diagram rendering)
- **Output:** ~525KB DOCX file

### Subsequent Runs
- **Time:** ~2-3 minutes (diagrams may be cached in some scenarios)
- **Output:** Same size

## Dependencies

### GitHub Actions
- `actions/checkout@v4` - Repository checkout
- `actions/setup-python@v5` - Python setup
- `actions/upload-artifact@v4` - Artifact upload
- `softprops/action-gh-release@v1` - Release creation

### Docker Images
- `minlag/mermaid-cli:11.12.0` - Mermaid diagram rendering
- `docker://pandoc/core:3.8` - Markdown to DOCX conversion

### Python Packages
- `python-docx>=1.1.0` - DOCX manipulation

## Security Considerations

- No secrets or sensitive data are used in the workflow