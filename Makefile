.PHONY: all clean install docx help

# Default target
all: docx

# Help target
help:
	@echo "Available targets:"
	@echo "  make install    - Install all prerequisites"
	@echo "  make docx       - Convert markdown to .docx with diagrams"
	@echo "  make clean      - Remove generated files"
	@echo "  make help       - Show this help message"

# Install prerequisites
install:
	@echo "Installing prerequisites..."
	@echo "1. Installing Python dependencies..."
	pip3 install -r requirements.txt --break-system-packages || pip3 install -r requirements.txt
	@echo "2. Checking for Homebrew..."
	@command -v brew >/dev/null 2>&1 || { echo "Error: Homebrew not found. Please install from https://brew.sh"; exit 1; }
	@echo "3. Installing pandoc..."
	brew list pandoc >/dev/null 2>&1 || brew install pandoc
	@echo "4. Installing mermaid-cli..."
	brew list mermaid-cli >/dev/null 2>&1 || brew install mermaid-cli
	@echo "✓ All prerequisites installed!"

# Convert markdown to .docx
docx: GITHUB_POLICIES_AND_GUIDELINES.docx

GITHUB_POLICIES_AND_GUIDELINES.docx: GITHUB_POLICIES_AND_GUIDELINES.md create_styled_conversion.py add_table_borders.py
	@echo "Converting markdown to .docx with Mermaid diagrams..."
	python3 create_styled_conversion.py
	@echo "Adding table borders..."
	python3 add_table_borders.py
	@echo "✓ Conversion complete: GITHUB_POLICIES_AND_GUIDELINES.docx"

# Clean generated files
clean:
	@echo "Cleaning generated files..."
	rm -f GITHUB_POLICIES_AND_GUIDELINES.docx
	rm -f custom-reference.docx
	rm -f temp_with_images.md
	rm -rf mermaid_images/
	@echo "✓ Cleanup complete"

# Clean everything including cached images
clean-all: clean
	@echo "Removing all generated files including cached images..."
	rm -rf mermaid_images/
	@echo "✓ Full cleanup complete"