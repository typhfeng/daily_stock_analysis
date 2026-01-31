#!/bin/bash
# Fork repository to typhfeng account

REPO_URL="https://github.com/ZhuLinsen/daily_stock_analysis"
TARGET_USER="typhfeng"

echo "=========================================="
echo "Fork Repository to typhfeng Account"
echo "=========================================="
echo ""
echo "Source repository: $REPO_URL"
echo "Target account: $TARGET_USER"
echo ""

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) is not installed."
    echo "Please install it first: https://cli.github.com/"
    exit 1
fi

# Check if logged in
if ! gh auth status &> /dev/null; then
    echo "⚠️  GitHub CLI is not logged in."
    echo ""
    echo "Please login with typhfeng account:"
    echo "  gh auth login"
    echo ""
    echo "Or use a token:"
    echo "  gh auth login --with-token < token.txt"
    echo ""
    read -p "Press Enter to start login process, or Ctrl+C to cancel..."
    gh auth login
fi

# Get current user
CURRENT_USER=$(gh api user --jq .login 2>/dev/null)
if [ -z "$CURRENT_USER" ]; then
    echo "❌ Failed to get current GitHub user. Please check your authentication."
    exit 1
fi

echo "✅ Current GitHub user: $CURRENT_USER"
echo ""

if [ "$CURRENT_USER" != "$TARGET_USER" ]; then
    echo "⚠️  Warning: Current user ($CURRENT_USER) is not $TARGET_USER"
    echo "The fork will be created under $CURRENT_USER account."
    echo ""
    read -p "Continue anyway? (y/N): " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Cancelled."
        exit 1
    fi
    TARGET_USER=$CURRENT_USER
fi

# Fork the repository
echo "🔄 Forking repository..."
echo ""

if gh repo fork "$REPO_URL" --clone=false; then
    echo ""
    echo "✅ Repository forked successfully!"
    echo ""
    FORKED_URL="https://github.com/$TARGET_USER/daily_stock_analysis"
    echo "Forked repository URL: $FORKED_URL"
    echo ""
    echo "To clone the forked repository:"
    echo "  git clone $FORKED_URL"
    echo ""
    echo "Or add it as a remote:"
    echo "  git remote add fork $FORKED_URL"
else
    echo ""
    echo "❌ Failed to fork repository."
    echo "Possible reasons:"
    echo "  1. Repository already forked"
    echo "  2. Network error"
    echo "  3. Permission issue"
    exit 1
fi
