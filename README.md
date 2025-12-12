# Prometheus AI Tutor V3

Intelligent AI-powered training system for Defense, Security, Crisis Management, and Leadership education. Built for Rabdan Academy, Abu Dhabi.

## Features

- 🤖 **AI-Powered Tutoring** - Powered by OpenAI GPT-4
- 🌐 **Bilingual Support** - Full English/Arabic with RTL layout
- 🎤 **Voice Integration** - Speech recognition & Text-to-Speech (MSA Arabic)
- 📚 **Multi-Module System** - Cybersecurity, Crisis, Emergency, Leadership
- 🎯 **Dynamic Topic Detection** - Auto-detects subject from questions
- 📖 **Guided Learning Paths** - Structured curriculum navigation
- 💾 **Persistent State** - Saves progress across sessions

## Quick Start

### Local Development
```bash
npm install
npm run dev
```

### Deploy to Vercel
```bash
vercel --prod
```

## Project Structure

```
prometheus-ai-tutor/
├── public/
│   └── index.html      # Main application
├── config/
│   └── tutor.config.json  # AI-editable configuration
├── package.json
├── vercel.json
└── README.md
```

## AI-Powered Updates

This project supports agentic AI updates via:

1. **Claude + GitHub API** - Describe changes, AI implements them
2. **n8n Workflows** - Automated update pipelines
3. **Configuration-driven** - Update `config/tutor.config.json` for quick changes

### Configuration File

Edit `config/tutor.config.json` to change:
- Module definitions and topics
- UI translations
- Voice settings
- System prompts

## Modules

| Module | Topics |
|--------|--------|
| Cybersecurity | Incident Response, Threat Analysis, SOC Operations |
| Crisis Management | Risk Assessment, Communication, Recovery |
| Emergency Response | First Response, Coordination, Planning |
| Leadership | Decision Making, Team Building, Strategy |

## Voice Support

- **Speech Recognition**: ar-AE (Arabic), en-US (English)
- **Text-to-Speech**: ar-SA (MSA Arabic), en-GB (British English)

## License

MIT License - Rabdan Academy 2024
