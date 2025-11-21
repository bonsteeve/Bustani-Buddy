# 🌱 Bustani Buddy - AI Agricultural Assistant

> **Empowering small-scale farmers with AI-powered crop disease diagnosis**

## Overview
Bustani Buddy is an innovative AI-powered agricultural assistant designed specifically for small-scale farmers in Kenya. Using multimodal AI and multilingual support, it helps farmers quickly identify crop diseases and receive actionable treatment recommendations.

## ✨ Key Features
- **🔍 Multimodal Diagnosis**: Analyze crop images + text descriptions
- **🌍 Multilingual Support**: English & Swahili interface
- **🧠 AI-Powered**: Advanced computer vision and natural language processing
- **📱 Mobile-First**: Optimized for smartphone usage
- **🌾 Local Knowledge**: Focused on Kenyan crops and farming practices

## 🏗️ Architecture
Built with **Jaseci/JAC** following SOLID principles:
- **Multi-Agent System**: Specialized AI agents for different tasks
- **OSP Graph**: Knowledge graph for crop-disease-remedy relationships
- **Modular Design**: Maintainable and extensible codebase
- **Cloud-Ready**: Scalable deployment architecture

## 🚀 Quick Start

### Prerequisites
- Python 3.12+
- Jaseci/JAC installed
- Gemini API key

### Installation
```bash
git clone https://github.com/bonsteeve/Bustani-Buddy.git
cd Bustani-Buddy
pip install -r requirements.txt
```

### Environment Setup
```bash
# Set your API key
export GEMINI_API_KEY="your-gemini-api-key-here"

# Run the application
jac serve master.jac
```

## 📚 Documentation
- [Implementation Plan](IMPLEMENTATION_PLAN.md) - Detailed development roadmap
- [Architecture Guide](docs/architecture.md) - System design and SOLID principles
- [API Documentation](docs/api.md) - Endpoint specifications
- [Setup Guide](docs/setup.md) - Detailed installation instructions

## 🛠️ Technology Stack
- **Backend**: Jaseci/JAC programming language
- **AI/ML**: Google Gemini API via byLLM
- **Frontend**: HTML5, CSS3, JavaScript (Jac Client)
- **Graph Database**: OSP (Object-Spatial Programming)
- **Deployment**: Jac Cloud (planned)

## 🎯 Project Status

### Current Phase: Foundation & Core Architecture
- [x] Environment setup and JAC syntax validation
- [ ] OSP Graph schema design
- [ ] Seed dataset preparation
- [ ] Data ingestion system
- [ ] Context/RAG agent implementation

## 🤝 Contributing
This project is part of the AI Hackathon. See [IMPLEMENTATION_PLAN.md](IMPLEMENTATION_PLAN.md) for development guidelines and task breakdown.

## 📜 License
MIT License - see [LICENSE](LICENSE) file for details

## 👥 Team
- **Developer**: bonsteeve
- **Project**: AI Hackathon Submission
- **Timeline**: November - December 2025

---

*"Empowering farmers with AI, one crop at a time."*
