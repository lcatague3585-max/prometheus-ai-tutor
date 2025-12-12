# CLAUDE.md - Project Instructions for Claude Code

## Project Overview

**Prometheus AI Tutor** is a bilingual (English/Arabic) AI-powered educational platform for Rabdan Academy in Abu Dhabi, UAE. It delivers professional training in defense, security, and crisis management.

## Quick Context

- **Single-file HTML application** - No build process, everything embedded
- **Bilingual** - Full English/Arabic support with RTL switching
- **Main file**: `src/prometheus-ai-tutor-v2.html` (~220KB)
- **Branding**: Navy (#003366) and Gold (#B8860B) - Rabdan Academy colors

## Architecture

```
Single HTML File Structure:
├── <head>
│   ├── External CDNs (Marked.js, Highlight.js, fonts)
│   └── <style> - All CSS embedded
├── <body>
│   ├── Header (logo, title, language toggle, buttons)
│   ├── Main container (sidebar + chat area)
│   ├── Side panels (history, bookmarks, achievements)
│   └── Modals (API settings)
└── <script>
    ├── CONFIG object
    ├── translations object (en/ar)
    ├── modules array
    ├── State management
    └── All functions
```

## Key Code Sections

### Translations (Line ~200)
```javascript
const translations = {
    en: { /* English strings */ },
    ar: { /* Arabic strings */ }
};
```
**Always add new UI text to both languages.**

### Modules Array (Line ~350)
```javascript
const modules = [
    { id: 1, title: '...', subtitle: '...', icon: '🛡️', questions: [...] }
];
```

### Core Functions
- `sendMessage()` - AI chat interaction
- `setLanguage(lang)` - Toggle EN/AR with RTL
- `speakWithGoogleTTS(text, lang)` - Voice synthesis
- `startQuiz()` / `submitQuizAnswer()` - Quiz system
- `saveBookmark()` / `unlockAchievement()` - Gamification

## Common Development Tasks

### Adding a New Training Module
1. Add to `modules` array:
```javascript
{
    id: 5,
    title: 'New Module Title',
    titleAr: 'عنوان الوحدة الجديدة',
    subtitle: 'Description',
    subtitleAr: 'الوصف',
    icon: '📚',
    questions: [
        {
            question: 'Question text?',
            questionAr: 'نص السؤال؟',
            options: ['A', 'B', 'C', 'D'],
            optionsAr: ['أ', 'ب', 'ج', 'د'],
            correct: 0
        }
    ]
}
```
2. Update `renderCourseOutline()` if needed

### Adding UI Text
Always add to both language objects:
```javascript
translations.en.newLabel = 'English Text';
translations.ar.newLabel = 'النص العربي';
```

### Styling Guidelines
- Use CSS variables defined at top of `<style>`
- Maintain navy/gold color scheme
- Buttons: 10px vertical padding, rounded corners (8px)
- Shadows: `0 2px 8px rgba(0,0,0,0.15)`

## Testing Checklist

Before committing changes:
- [ ] Toggle language - verify all text updates
- [ ] Test Arabic RTL alignment
- [ ] Test voice in both languages
- [ ] Run a quiz, check scoring
- [ ] Test without API key (fallback mode)
- [ ] Check mobile viewport (< 768px)

## API Integration

Supports three providers (configured via UI):
1. **OpenAI** - `https://api.openai.com/v1/chat/completions`
2. **Anthropic** - `https://api.anthropic.com/v1/messages`
3. **OpenRouter** - `https://openrouter.ai/api/v1/chat/completions`

Fallback: When no API configured, returns scripted educational responses.

## Don't Break These

1. **Single-file architecture** - Don't split into multiple files
2. **Base64 avatar** - Embedded in HTML, don't externalize
3. **Offline capability** - Must work without API
4. **RTL support** - Arabic mode must flip layout correctly
5. **Mobile responsive** - Side panels collapse on mobile

## File Locations

| File | Purpose |
|------|---------|
| `src/prometheus-ai-tutor-v2.html` | Production version |
| `src/prometheus-ai-tutor-demo.html` | Simple demo |
| `docs/*.docx` | Proposal documents |

## Helpful Commands

```bash
# Quick local server
python -m http.server 8000 --directory src

# Check file size
ls -lh src/prometheus-ai-tutor-v2.html

# Search for a function
grep -n "function sendMessage" src/prometheus-ai-tutor-v2.html
```

## Contact

**Developer**: Matthew Dodds  
**Institution**: Rabdan Academy, Abu Dhabi, UAE
