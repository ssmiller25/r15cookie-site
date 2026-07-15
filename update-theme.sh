#!/bin/bash
# Update the r15-papercss-hugo-theme
# Usage: ./update-theme.sh [branch]

BRANCH=${1:-main}
THEME_DIR="themes/r15-papercss-hugo-theme"

echo "Updating theme from branch: $BRANCH"

# Remove existing theme
rm -rf "$THEME_DIR"

# Clone the theme
git clone -b "$BRANCH" https://github.com/ssmiller25/r15-papercss-hugo-theme.git "$THEME_DIR"

# Remove .git directory to avoid nested git issues
rm -rf "$THEME_DIR/.git"

echo "Theme updated successfully!"
