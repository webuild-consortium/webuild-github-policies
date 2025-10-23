# Installation Guide

This guide will help you set up all the prerequisites needed to convert the markdown document to .docx format with rendered Mermaid diagrams.

## Prerequisites

### 1. Operating System

This setup is designed for **macOS**. For other operating systems, you'll need to adapt the installation commands.

### 2. Homebrew (macOS Package Manager)

If you don't have Homebrew installed:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Verify installation:
```bash
brew --version
```

### 3. Python 3

macOS comes with Python 3, but verify you have it:

```bash
python3 --version
```

Should show Python 3.8 or higher.

### 4. Google Chrome

The Mermaid CLI requires Chrome or Chromium to render diagrams. Chrome should be installed at:
```
/Applications/Google Chrome.app
```

If not installed, download from: https://www.google.com/chrome/

## Installation Steps

### Option 1: Automated Installation (Recommended)

Use the provided Makefile to install everything automatically:

```bash
make install
```

This will:
- Install Python dependencies (python-docx)
- Install pandoc via Homebrew
- Install mermaid-cli via Homebrew

### Option 2: Manual Installation

#### Step 1: Install Python Dependencies

```bash
pip3 install -r requirements.txt --break-system-packages
```

Or if you prefer using a virtual environment:

```bash
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
```

#### Step 2: Install Pandoc

Pandoc is used to convert markdown to .docx format:

```bash
brew install pandoc
```

Verify installation:
```bash
pandoc --version
```

#### Step 3: Install Mermaid CLI

Mermaid CLI is used to render Mermaid diagrams as images:

```bash
brew install mermaid-cli
```

Verify installation:
```bash
mmdc --version
```

## Verification

After installation, verify all tools are available:

```bash
# Check Python
python3 --version

# Check pandoc
pandoc --version

# Check mermaid-cli
mmdc --version

# Check python-docx
python3 -c "import docx; print('python-docx installed')"

# Check Chrome
ls "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
```

All commands should complete without errors.

## Usage

Once everything is installed, you can convert the markdown to .docx:

### Using Make (Recommended)

```bash
make docx
```

This will:
1. Convert markdown to .docx with rendered Mermaid diagrams
2. Add borders to all tables
3. Apply custom styling for code blocks

### Manual Conversion

If you prefer to run the scripts manually:

```bash
# Step 1: Convert markdown with Mermaid diagrams
python3 create_styled_conversion.py

# Step 2: Add table borders
python3 add_table_borders.py
```

## Output

The conversion will generate:

- `GITHUB_POLICIES_AND_GUIDELINES.docx` - The final styled document
- `custom-reference.docx` - Pandoc reference document with custom styles
- `mermaid_images/` - Directory containing rendered diagram images (cached for efficiency)

## Troubleshooting

### Issue: "externally-managed-environment" error

If you get this error when installing Python packages:

```bash
pip3 install -r requirements.txt --break-system-packages
```

Or use a virtual environment (recommended):

```bash
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
```

### Issue: Chrome not found

If mermaid-cli can't find Chrome, ensure it's installed at:
```
/Applications/Google Chrome.app
```

The script is configured to use this path automatically.

### Issue: Permission denied

If you get permission errors:

```bash
chmod +x create_styled_conversion.py add_table_borders.py
```

### Issue: Mermaid diagrams not rendering

1. Verify Chrome is installed
2. Check mermaid-cli installation: `mmdc --version`
3. Try rendering a single diagram manually:
   ```bash
   echo "graph TD; A-->B;" > test.mmd
   mmdc -i test.mmd -o test.png
   ```

## Cleaning Up

To remove generated files:

```bash
# Remove .docx and temporary files (keeps cached images)
make clean

# Remove everything including cached images
make clean-all
```

## System Requirements

- **OS**: macOS (Sonoma or later recommended)
- **Python**: 3.8 or higher
- **Disk Space**: ~300MB for all tools
- **Memory**: 2GB RAM minimum for rendering diagrams

## Additional Resources

- [Pandoc Documentation](https://pandoc.org/MANUAL.html)
- [Mermaid CLI Documentation](https://github.com/mermaid-js/mermaid-cli)
- [python-docx Documentation](https://python-docx.readthedocs.io/)

## Support

If you encounter issues not covered here, please check:
1. All prerequisites are properly installed
2. You're running commands from the correct directory
3. You have the latest versions of all tools

For Homebrew issues: https://docs.brew.sh/Troubleshooting