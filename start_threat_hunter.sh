#!/bin/bash

# === CONFIG ===
PROJECT_DIR="/Users/mac/Desktop/autonomous-threat-hunter"  # ← update this path
VENV_DIR="$PROJECT_DIR/venv"

echo "🔐 Starting Autonomous Threat Hunter Project"

# Step 1: Navigate to project
cd "$PROJECT_DIR" || {
  echo "❌ Could not find project directory: $PROJECT_DIR"
  exit 1
}

# Step 2: Activate virtual environment
if [ -d "$VENV_DIR" ]; then
  source "$VENV_DIR/bin/activate"
  echo "✅ Virtual environment activated"
else
  echo "❌ Virtual environment not found. Run: python3 -m venv venv"
  exit 1
fi

# Step 3: Check Git status
echo "🔍 Checking Git status..."
git status

# Step 4: Open VS Code
echo "🚀 Launching VS Code..."
code .

# Step 5: Remind to start Docker
echo "🐳 If you plan to run Docker containers, make sure Docker Desktop is running!"

# Step 6: You're good to go
echo "✅ Setup complete. Happy hacking!"
