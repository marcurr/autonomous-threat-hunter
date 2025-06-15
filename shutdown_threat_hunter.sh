#!/bin/bash

# === CONFIG ===
PROJECT_DIR="/Users/mac/Desktop/autonomous-threat-hunter"  # ← update this path
VENV_DIR="$PROJECT_DIR/venv"

echo "🛑 Shutting down Autonomous Threat Hunter project..."

# Step 1: Navigate to project directory
cd "$PROJECT_DIR" || {
  echo "❌ Could not find project directory: $PROJECT_DIR"
  exit 1
}

# Step 2: Git check
echo "🔍 Checking for changes..."
git status

# Step 3: Prompt for commit message
read -rp "📝 Enter commit message: " COMMIT_MSG

# Step 4: Add, commit, push
git add .
git commit -m "$COMMIT_MSG"
git push origin main

echo "✅ Changes committed and pushed to GitHub."

# Step 5: Stop Docker containers (optional)
if command -v docker compose &> /dev/null && docker info &> /dev/null; then
  echo "🐳 Stopping Docker containers..."
  docker compose down
else
  echo "⚠️ Docker not running or not installed — skipping."
fi

# Step 6: Deactivate virtual environment
if [[ "$VIRTUAL_ENV" != "" ]]; then
  deactivate
  echo "🧹 Virtual environment deactivated."
else
  echo "ℹ️ No active virtual environment to deactivate."
fi

echo "✅ Shutdown complete. See you tomorrow 👋"
