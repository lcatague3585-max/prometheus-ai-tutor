# Prometheus AI Tutor - Complete Setup Guide

## 🚀 Agentic AI Auto-Update System

This guide sets up automatic deployments and AI-powered updates.

---

## Step 1: GitHub Repository Setup

### Option A: Create New GitHub Account
1. Go to https://github.com/signup
2. Create account (e.g., `rabdan-prometheus`)
3. Verify email

### Option B: Use Existing Account
1. Login to your GitHub account

### Create Repository
```bash
# On GitHub.com:
# 1. Click "+" → "New repository"
# 2. Name: prometheus-ai-tutor
# 3. Make it Public or Private
# 4. DON'T initialize with README (we have files already)
# 5. Click "Create repository"
```

### Push Code to GitHub
```bash
cd prometheus-ai-tutor
git init
git add .
git commit -m "Initial commit: Prometheus AI Tutor V3"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/prometheus-ai-tutor.git
git push -u origin main
```

---

## Step 2: Vercel Deployment

### Option A: New Vercel Account
1. Go to https://vercel.com/signup
2. Sign up with GitHub (use the account from Step 1)
3. This automatically links them!

### Option B: Connect Different Account in Claude
1. Go to Claude.ai → Settings → Connected Apps
2. Disconnect current Vercel
3. Reconnect with new Vercel account

### Deploy to Vercel
1. Go to https://vercel.com/new
2. Click "Import Git Repository"
3. Select `prometheus-ai-tutor`
4. Click "Deploy"

**Auto-Deploy Enabled!** Every push to `main` branch auto-deploys.

---

## Step 3: n8n Workflow Setup

### Option A: New n8n Account
1. Go to https://n8n.io/cloud
2. Create new account
3. Connect in Claude.ai → Settings → Connected Apps

### Option B: Self-Hosted n8n
```bash
# Docker installation
docker run -d --name n8n -p 5678:5678 n8nio/n8n
```

### Create AI Update Workflow
Import the workflow JSON from `/workflows/ai-update-workflow.json`

---

## Step 4: Connect Everything in Claude

### Required Connections (Claude.ai → Settings → Connected Apps):
- [ ] **GitHub** - For code access (coming soon, use API for now)
- [x] **Vercel** - For deployments
- [x] **n8n** - For automation workflows
- [x] **Notion** - For documentation (optional)

---

## 🤖 How Agentic Updates Work

### Method 1: Chat with Claude (Easiest)
Just tell Claude what you want:
```
"Add a new module for Fire Safety training"
"Change the welcome message to include today's date"
"Update the Arabic translation for the settings button"
```

Claude will:
1. Modify the code
2. Create a new file
3. You download and push to GitHub
4. Vercel auto-deploys

### Method 2: n8n Webhook (Automated)
Send a POST request to your n8n webhook:
```json
{
  "action": "update",
  "target": "module",
  "changes": {
    "add": {
      "id": "fire",
      "nameEn": "Fire Safety",
      "nameAr": "السلامة من الحرائق"
    }
  }
}
```

### Method 3: GitHub Actions (CI/CD)
Push changes → Automatic testing → Auto-deploy

---

## 📁 Project Structure

```
prometheus-ai-tutor/
├── public/
│   └── index.html          # Main app (edit this)
├── config/
│   └── tutor.config.json   # Easy config changes
├── workflows/
│   └── ai-update-workflow.json  # n8n workflow
├── .github/
│   └── workflows/
│       └── deploy.yml      # GitHub Actions
├── package.json
├── vercel.json
└── README.md
```

---

## 🔑 Environment Variables

Set these in Vercel Dashboard → Settings → Environment Variables:

| Variable | Description |
|----------|-------------|
| `OPENAI_API_KEY` | Your OpenAI API key |
| `N8N_WEBHOOK_URL` | Your n8n webhook URL |

---

## 🎯 Quick Commands

### Update via Claude
"Update the cybersecurity module to include ransomware topic"

### Update via Config
Edit `config/tutor.config.json` and push to GitHub

### Manual Deploy
```bash
vercel --prod
```

---

## 🔗 Useful Links

- **Vercel Dashboard**: https://vercel.com/dashboard
- **n8n Cloud**: https://app.n8n.cloud
- **GitHub Repo**: https://github.com/YOUR_USERNAME/prometheus-ai-tutor
- **Live App**: https://prometheus-ai-tutor.vercel.app

---

## 💡 Tips

1. **Always test locally first**: `npm run dev`
2. **Use branches for big changes**: Create PR before merging
3. **Config-driven updates are fastest**: Edit JSON, not code
4. **n8n can trigger from anywhere**: Slack, email, webhook, schedule
