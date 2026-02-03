# 🌱 Bustani Buddy - AI-Powered Crop Disease Diagnosis

> **Empowering Kenyan farmers with AI-powered agricultural disease diagnosis**

## Overview

Bustani Buddy is an innovative AI-powered agricultural assistant designed specifically for small-scale farmers in Kenya. The application uses multimodal AI (combining image analysis and text descriptions) to help farmers quickly identify crop diseases and receive actionable treatment recommendations tailored to Kenyan farming conditions.

## ✨ Key Features

- **🔍 Multimodal Diagnosis**: Analyze crop images + text symptom descriptions
- **🌍 Regional Context**: Tailored recommendations for Kenyan regions
- **🧠 AI-Powered**: Uses Google Gemini AI via byLLM for intelligent analysis
- **📱 Modern UI**: Clean, responsive React-based interface
- **🌾 Multi-Crop Support**: Maize, Beans, Tomatoes, Cabbage, Kale, Potatoes
- **💊 Treatment Recommendations**: Specific remedies with cost and effectiveness info
- **📈 Market Intelligence**: Agricultural market insights

## 🏗️ Architecture

Bustani Buddy follows a **multi-agent architecture** built with Jaseci/JAC:

### Agent Components

1. **ExecutorAgent** (`executor_agent.jac`)
   - Master orchestrator that coordinates all agents
   - Manages the complete diagnosis workflow
   - Compiles results from all specialized agents

2. **DiagnosisAgent** (`diagnosis_agent.jac`)
   - Core disease diagnosis using multimodal analysis
   - Combines image descriptions and text symptoms
   - Provides disease identification with confidence scoring

3. **ContextAgent** (`context_agent.jac`)
   - Analyzes disease symptoms in context
   - Provides remedy recommendations
   - Regional context analysis for Kenyan farming

4. **AIResearcher** (`ai_researcher.jac`)
   - Market intelligence and crop recommendations
   - Agricultural research and insights

### Technology Stack

- **Backend**: Jaseci/JAC programming language
- **AI/ML**: Google Gemini 2.0 Flash Lite via byLLM
- **Frontend**: React 19 with modern JavaScript (build with jac client)
- **Build Tools**: Vite, Babel
- **Styling**: Inline styles (modern CSS-in-JS approach)

## 📁 Project Structure

```
buddy/
├── app.jac                 # Main application file (frontend + backend)
├── executor_agent.jac      # Master orchestrator agent
├── diagnosis_agent.jac    # Disease diagnosis agent
├── context_agent.jac       # Context and remedy analysis agent
├── ai_researcher.jac        # Market intelligence agent
├── schema.jac              # Data schema definitions
├── src/                     # Frontend source files
│   ├── app.js              # Main React application
│   └── client_runtime.js   # JAC client runtime utilities
├── build/                   # Compiled JavaScript (generated)
├── dist/                    # Production build (generated)
└── package.json            # Node.js dependencies
```

## 🚀 Quick Start

### Prerequisites

- Python 3.12+ with Jaseci/JAC installed
- Node.js 16+ and npm
- Google Gemini API key

### Installation

1. **Install dependencies** (from project root virtual env .venv):
   ```bash
   pip install requirements.txt
   ```

2. **Set your Gemini API key**:
   ```bash
   export GEMINI_API_KEY="your-gemini-api-key-here"
   ```
   
   Get your API key from: https://aistudio.google.com/app/apikey

### Running the Application

1. **Start the JAC server**:
   ```bash
   jac serve app.jac
   ```

2. **Access the application**:
   - Open your browser to: `http://localhost:8000/page/app`
   - The application will be served automatically

