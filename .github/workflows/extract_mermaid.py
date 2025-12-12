#!/usr/bin/env python3
"""Extract Mermaid diagrams from markdown file."""
import re
import sys
import os

def extract_mermaid_diagrams(markdown_file, output_dir='mermaid-diagrams'):
    """Extract all mermaid code blocks from markdown."""
    with open(markdown_file, 'r') as f:
        content = f.read()

    pattern = r'```mermaid\n(.*?)```'
    matches = list(re.finditer(pattern, content, re.DOTALL))

    print(f"Found {len(matches)} mermaid diagrams")

    # Ensure output directory exists
    os.makedirs(output_dir, exist_ok=True)

    for idx, match in enumerate(matches, 1):
        mmd_file = os.path.join(output_dir, f'diagram_{idx}.mmd')
        with open(mmd_file, 'w') as f:
            f.write(match.group(1))
        print(f"Created {mmd_file}")

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: extract_mermaid.py <markdown_file>")
        sys.exit(1)

    extract_mermaid_diagrams(sys.argv[1])