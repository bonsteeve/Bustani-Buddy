# 🌱 Bustani Buddy - AI-Powered Crop Disease Diagnosis

> **Empowering Kenyan farmers with AI-powered agricultural disease diagnosis**

Full-Stack app built with Jaseci/JAC and React

## 📖 Overview

Bustani Buddy is an innovative AI-powered agricultural assistant designed specifically for small-scale farmers in Kenya. The application uses multimodal AI (combining image analysis and text descriptions) to help farmers quickly identify crop diseases and receive actionable treatment recommendations tailored to Kenyan farming conditions.

## ✨ Key Features

### 🔐 Authentication System
- Secure user login with in-memory storage (MVP)
- Session persistence with localStorage

### 🌾 Crop Disease Diagnosis
- **Multimodal Analysis**: Combines crop images + text symptom descriptions
- **AI-Powered**: Uses Vertex AI and Google Gemini AI via byLLM for intelligent analysis
- **Multi-Crop Support**: Maize, Beans, Tomatoes, Cabbage, Kale, Potatoes
- **Regional Context**: Tailored recommendations for Kenyan regions (Central, Western, Eastern, Rift Valley, Coast, Nyanza)

### 💊 Smart Recommendations
- Disease identification with confidence scoring
- Specific treatment recommendations with cost and effectiveness
- Prevention advice tailored to local conditions
- Market intelligence and agricultural insights

### 🎨 Modern User Interface
- Clean, responsive React-based interface
- Professional green agricultural theme
- Custom logo with styled branding
- Mobile-friendly with camera/video capture support

## 🏗️ Architecture

Bustani Buddy follows a **professional modular architecture** with clean separation of concerns:

### Backend (JAC Language)

**Multi-Agent System:**

1. **ExecutorAgent** (`executor_agent.jac`)
   - Master orchestrator coordinating all specialized agents
   - Manages complete diagnosis workflow
   - Compiles and structures final results

2. **DiagnosisAgent** (`diagnosis_agent.jac`)
   - Core disease diagnosis using multimodal analysis
   - Combines image analysis and text symptoms
   - Provides disease identification with confidence scores

3. **ContextAgent** (`context_agent.jac`)
   - Analyzes disease symptoms in regional context
   - Provides remedy recommendations
   - Tailors advice for Kenyan farming conditions

4. **AIResearcher** (`ai_researcher.jac`)
   - Market intelligence and crop recommendations
   - Agricultural research and insights
   - Pricing and availability information

5. **LoginWalker** (`auth/auth_walker.jac`)
   - Handles user authentication
   - In-memory user storage (MVP - ready for database migration)
   - Session management

### Frontend (React with JAC-Client)

**Component-Based Architecture:**

- **`main.jac`**: Entry point with state management and routing logic
- **`components/Login.cl.jac`**: Authentication form with password toggle
- **`components/Header.cl.jac`**: App branding and language switcher
- **`components/DiagnosisForm.cl.jac`**: User input form for diagnosis
- **`components/DiagnosisResults.cl.jac`**: Results display with detailed analysis

### Data Models

- **`schema.jac`**: Defines nodes for Crop, Disease, Remedy, Region
- **`auth/auth_schema.jac`**: User authentication data models

## 🛠️ Technology Stack

| Layer | Technology |
|-------|-----------|
| **Backend Language** | Jaseci/JAC (v0.9.14+) |
| **AI/ML** | Google Gemini 2.0 Flash Lite via byLLM |
| **Frontend Framework** | React 19 |
| **Client Library** | JAC-Client with JSX support |
| **Build Tools** | Vite, Babel, Bun |
| **Styling** | Inline CSS-in-JS (styled components pattern) |
| **State Management** | React useState hooks |
| **Session Storage** | localStorage (browser-based) |

## 📁 Project Structure

```
Bustani-Buddy/
├── newbuddy/                      # Main application directory
│   ├── main.jac                   # ✅ Entry point 
│   │
│   ├── auth/                      # 🔐 Authentication module
│   │   ├── auth_schema.jac       # User data models
│   │   └── auth_walker.jac       # Login logic with demo users
│   │
│   ├── components/                # 🎨 Frontend components (modular .cl.jac files)
│   │   ├── Login.cl.jac          # Authentication form (207 lines)
│   │   ├── Header.cl.jac         # App branding & language switcher (73 lines)
│   │   ├── DiagnosisForm.cl.jac  # User input form (166 lines)
│   │   └── DiagnosisResults.cl.jac # Results display (67 lines)
│   │
│   ├── executor_agent.jac         # 🤖 Master orchestrator
│   ├── diagnosis_agent.jac        # 🔬 Disease diagnosis logic
│   ├── context_agent.jac          # 🌍 Regional context analysis
│   ├── ai_researcher.jac          # 📊 Market intelligence
│   ├── schema.jac                 # 📋 Data models (Crop, Disease, Remedy, Region)
│   │
│   ├── jac.toml                   # JAC project configuration
│   ├── package.json               # Frontend dependencies
│   │
│   ├── .jac/                      # Generated build artifacts (auto-created)
│   │   └── client/
│   │       ├── compiled/          # Transpiled JavaScript
│   │       ├── dist/              # Production bundles
│   │       └── node_modules/      # NPM dependencies
│   │
│
├── newvenv/                       # Python virtual environment
├── requirements.txt               # Python dependencies
└── README.md                      # This file
```

### Key Design Patterns

✅ **Modular Component Architecture**: Each UI component in its own `.cl.jac` file  
✅ **Separation of Concerns**: Backend agents, frontend components, auth module  
✅ **Professional Organization**: ~50-200 lines per file for maintainability  
✅ **Clean Imports**: Components imported using JAC-Client syntax  
✅ **Backup Strategy**: Previous versions preserved for rollback

## 🚀 Quick Start

### Prerequisites

- **Python 3.12+** with Jaseci/JAC installed
- **Node.js 18+** and npm (for frontend build)
- **Jaseci** ([Get one here](https://jaseci.org/))-latest version
- **byllm** (latest version)
- **jac-client** (latest version)
- **Google Auth Libraries**: `google-auth`, `google-auth-oauthlib`, `google-auth-httplib2`
- **Google Gemini API key** ([Get one here](https://aistudio.google.com/app/apikey))

### Installation

1. **Clone the repository**:
   ```bash
   cd Bustani-Buddy
   ```

2. **Activate virtual environment**:
   ```bash
   source newvenv/bin/activate
   ```

3. **Install Python dependencies** (if not already installed):
   ```bash
   pip install -r requirements.txt
   
   # Install Google Auth libraries (required for Vertex AI integration)
   pip install google-auth google-auth-oauthlib google-auth-httplib2
   ```

4. **Set your Gemini API key**:
   ```bash
   export GEMINI_API_KEY="your-gemini-api-key-here"
   ```

5. **Fix Google Auth Library (if needed)**:
   
   If you encounter `AttributeError: module 'google.auth' has no attribute 'default'`, the Google Auth library needs to be reinstalled:
   
   ```bash
   # Uninstall corrupted Google Auth packages
   pip uninstall google-auth google-auth-oauthlib google-auth-httplib2
   
   # Reinstall clean versions
   pip install google-auth google-auth-oauthlib google-auth-httplib2
   
   # Or force reinstall if issues persist
   pip install --force-reinstall --no-cache-dir google-auth google-auth-oauthlib google-auth-httplib2
   ```

### Running the Application

1. **Navigate to the app directory**:
   ```bash
   cd newbuddy
   ```

2. **Start the development server**:
   ```bash
   jac start --dev
   ```

3. **Access the application**:
   - Open your browser to: **http://localhost:8000/**
   - You'll see the login page first

### Demo Credentials

For testing, use any of these accounts:

| Email | Password | User Type |
|-------|----------|-----------|
| `farmer@bustani.com` | `farm@9876` | Bonface Farmer |
| `admin@bustani.com` | `admin123` | Admin User |
| `test@bustani.com` | `test123` | Test User |

**Note**: Demo accounts are stored in `auth/auth_walker.jac` for easy modification.

## 💡 Usage Guide

### 1. Login
- Navigate to http://localhost:8000/
- Enter demo credentials or create your own user (when registration is implemented)
- Click the eye icon to toggle password visibility

### 2. Submit a Diagnosis Request

**Fill in the form:**
- **Select Crop**: Choose from Maize, Beans, Tomatoes, Cabbage, Kale, or Potatoes
- **Describe Symptoms**: Enter visual observations (e.g., "Yellow spots on leaves, brown edges")
- **Select Region** (Optional): Choose your farming region for localized advice
- **Upload Image/Video**: 
  - On mobile: Use camera to capture plant photos/videos
  - On desktop: Upload from gallery

**Submit**: Click "Diagnose Disease" button

### 3. View Results

After processing, you'll receive:
- **Disease Name** with confidence score
- **Symptoms Analysis**: AI interpretation of your observations
- **Treatment Recommendations**: Specific remedies with effectiveness notes
- **Prevention Advice**: How to avoid future outbreaks
- **Regional Context**: Location-specific farming tips
- **Market Intelligence**: Crop pricing and market insights

### 4. Language Support

Click the language buttons (English/Kiswahili) in the header to switch UI language (frontend ready, translations pending).

## 🔧 Development

### Building for Production

```bash
cd newbuddy
jac build main.jac
```

The optimized bundle will be created in `.jac/client/dist/`

### Code Quality

**Check syntax**:
```bash
jac check main.jac
jac check components/Login.cl.jac
```

**Note**: `jac check` may show strict type warnings for JSX that don't affect build. Run `jac build` to verify actual compilation.

### Hot Module Replacement (HMR)

When running `jac start --dev`, the server watches for changes:
- **Backend (.jac)**: Auto-recompiles and reloads
- **Frontend (.cl.jac)**: Instant browser refresh with Vite HMR

## 👥 Authors

**Bustani Buddy Development Team**

## 🙏 Acknowledgments

- **Jaseci Team** for the powerful JAC language
- **Google Gemini** for AI capabilities via byLLM
- **Kenyan Farmers** for inspiration and feedback
- **Agricultural Extension Officers** for domain expertise

---

**Built with 💚 for Kenyan Agriculture**

*Empowering small-scale farmers with AI technology*

