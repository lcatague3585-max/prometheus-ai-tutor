#!/bin/bash
# Prometheus AI Tutor - Deployment Script
# Works with multiple accounts via tokens

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}🚀 Prometheus AI Tutor - Deployment Script${NC}"
echo "==========================================="

# Check if .env.local exists
if [ -f ".env.local" ]; then
    source .env.local
    echo -e "${GREEN}✓ Loaded environment variables${NC}"
else
    echo -e "${RED}✗ .env.local not found!${NC}"
    echo "Create .env.local with your tokens (see MULTI-ACCOUNT-SETUP.md)"
    exit 1
fi

# Check required variables
if [ -z "$GITHUB_TOKEN" ] || [ -z "$VERCEL_TOKEN" ]; then
    echo -e "${RED}✗ Missing required tokens in .env.local${NC}"
    exit 1
fi

# Git operations
echo -e "\n${YELLOW}📦 Committing changes...${NC}"
git add .

# Get commit message
if [ -z "$1" ]; then
    COMMIT_MSG="Update: $(date '+%Y-%m-%d %H:%M')"
else
    COMMIT_MSG="$1"
fi

git commit -m "$COMMIT_MSG"

echo -e "\n${YELLOW}📤 Pushing to GitHub...${NC}"
git push origin main

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Pushed to GitHub${NC}"
else
    echo -e "${RED}✗ GitHub push failed${NC}"
    exit 1
fi

# Vercel deployment
echo -e "\n${YELLOW}🔄 Deploying to Vercel...${NC}"
vercel --prod --token $VERCEL_TOKEN

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Deployed to Vercel${NC}"
else
    echo -e "${RED}✗ Vercel deployment failed${NC}"
    exit 1
fi

echo -e "\n${GREEN}==========================================${NC}"
echo -e "${GREEN}✅ Deployment complete!${NC}"
echo -e "${GREEN}==========================================${NC}"
