# Multi-Account Setup Guide

## 🎯 Using Multiple Accounts (Without Disconnecting Current Ones)

You can use NEW accounts for this project while keeping your current Claude connections intact!

---

## 1️⃣ GitHub - New Account Setup

### Create New GitHub Account
1. Go to https://github.com/signup (use incognito/private browser)
2. Create account (e.g., `rabdan-academy-ai`)
3. Verify email

### Create Personal Access Token (PAT)
1. Login to NEW GitHub account
2. Go to: Settings → Developer settings → Personal access tokens → Tokens (classic)
3. Click "Generate new token (classic)"
4. Name: `prometheus-ai-tutor`
5. Select scopes:
   - ✅ `repo` (full control)
   - ✅ `workflow` (GitHub Actions)
6. Click "Generate token"
7. **COPY THE TOKEN NOW** (you won't see it again!)

### Create Repository
1. Click "+" → "New repository"
2. Name: `prometheus-ai-tutor`
3. Public or Private
4. Create repository

### Store Your Token
```
GITHUB_USERNAME=your-new-username
GITHUB_TOKEN=ghp_xxxxxxxxxxxxxxxxxxxx
GITHUB_REPO=prometheus-ai-tutor
```

---

## 2️⃣ Vercel - New Account Setup

### Create New Vercel Account
1. Go to https://vercel.com/signup (incognito browser)
2. Sign up with your NEW GitHub account (links them automatically!)
3. This creates a separate Vercel account

### Get Vercel API Token
1. Go to: https://vercel.com/account/tokens
2. Click "Create Token"
3. Name: `prometheus-deploy`
4. Scope: Full Account
5. Click "Create"
6. **COPY THE TOKEN**

### Get Project IDs (after first deploy)
```
VERCEL_TOKEN=your-vercel-token
VERCEL_ORG_ID=team_xxxxx (from .vercel/project.json after deploy)
VERCEL_PROJECT_ID=prj_xxxxx
```

---

## 3️⃣ n8n - Options for New Instance

### Option A: n8n Cloud (New Account)
1. Go to https://n8n.io (incognito browser)
2. Create new account with different email
3. Get webhook URLs from new instance

### Option B: Self-Host n8n (Recommended for Full Control)
```bash
# Using Docker
docker run -d \
  --name n8n-prometheus \
  -p 5679:5678 \
  -v n8n_data:/home/node/.n8n \
  n8nio/n8n

# Access at http://localhost:5679
```

### Option C: Use Current n8n (Separate Workflow)
Just create a new workflow in your existing n8n - it can handle multiple projects!

---

## 4️⃣ Store All Credentials Securely

Create a `.env.local` file (NEVER commit this!):

```env
# GitHub (New Account)
GITHUB_USERNAME=rabdan-academy-ai
GITHUB_TOKEN=ghp_xxxxxxxxxxxxxxxxxxxx
GITHUB_REPO=prometheus-ai-tutor

# Vercel (New Account)  
VERCEL_TOKEN=xxxxxxxxxxxxxxxx
VERCEL_ORG_ID=team_xxxxx
VERCEL_PROJECT_ID=prj_xxxxx

# n8n Webhook
N8N_WEBHOOK_URL=https://your-n8n.app.n8n.cloud/webhook/prometheus-update

# OpenAI (can be same)
OPENAI_API_KEY=sk-xxxxxxxxxxxxx
```

---

## 5️⃣ Deploy Commands Using Tokens

### Push to GitHub (New Account)
```bash
# Set up authentication with token
git remote set-url origin https://GITHUB_USERNAME:GITHUB_TOKEN@github.com/GITHUB_USERNAME/prometheus-ai-tutor.git

# Or use credential helper
git config credential.helper store
# Then enter token as password when prompted
```

### Deploy to Vercel (New Account)
```bash
# Login with token
vercel login --token YOUR_VERCEL_TOKEN

# Deploy
vercel --prod --token YOUR_VERCEL_TOKEN
```

---

## 6️⃣ Automated Deployment Script

Save this as `deploy.sh`:

```bash
#!/bin/bash

# Load environment variables
source .env.local

# Commit and push to GitHub
git add .
git commit -m "Update: $(date '+%Y-%m-%d %H:%M')"
git push origin main

# Deploy to Vercel
vercel --prod --token $VERCEL_TOKEN

echo "✅ Deployed successfully!"
```

Make it executable:
```bash
chmod +x deploy.sh
```

Run deployment:
```bash
./deploy.sh
```

---

## 🤖 Agentic Updates with Multiple Accounts

### Method 1: Claude + Manual Push
1. Ask Claude to make changes
2. Download the updated file
3. Run `./deploy.sh`

### Method 2: n8n Webhook (Fully Automated)
Configure n8n workflow to use YOUR tokens:
- GitHub node → Use PAT from new account
- Vercel node → Use token from new account

### Method 3: GitHub Actions
Add secrets to GitHub repo (new account):
1. Go to repo → Settings → Secrets → Actions
2. Add:
   - `VERCEL_TOKEN`
   - `VERCEL_ORG_ID`
   - `VERCEL_PROJECT_ID`

---

## 📊 Account Summary

| Service | Current (Claude) | New (Project) |
|---------|-----------------|---------------|
| GitHub | - | rabdan-academy-ai |
| Vercel | PrometheusDev | (via new GitHub) |
| n8n | prometheusdevcreatorn8 | Same or self-host |

---

## 🔗 Quick Reference

```
# Your New Accounts
GitHub:  https://github.com/YOUR_NEW_USERNAME
Vercel:  https://vercel.com/YOUR_NEW_USERNAME
n8n:     https://your-instance.app.n8n.cloud

# Your Project URLs
Repo:    https://github.com/YOUR_NEW_USERNAME/prometheus-ai-tutor
Live:    https://prometheus-ai-tutor.vercel.app
```
