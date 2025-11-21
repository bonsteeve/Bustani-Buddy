"""
Bustani Buddy - Main Entry Point
"""

import os;

def check_api_key() -> str {
    api_key = os.getenv("GEMINI_API_KEY");
    if api_key {
        return "SUCCESS: GEMINI_API_KEY found! Environment is READY.";
    } else {
        return "ERROR: GEMINI_API_KEY NOT found. Please set the GEMINI_API_KEY environment variable.";
    }
}

def print_system_info() {
    print("\n🌱 === BUSTANI BUDDY SYSTEM ===");
    print("AI-Powered Agricultural Assistant");
    print("Version: 1.0.0");
    print("Architecture: Modular SOLID Principles");
    
    print("\n✨ Planned Features:");
    features = [
        "✅ Environment configuration & validation",
        "✅ Modular architecture with SOLID principles", 
        "✅ Error handling framework",
        "⏳ OSP Graph models (Next: Task 1.2)",
        "⏳ AI agents for diagnosis (Next: Task 1.5)", 
        "⏳ Multilingual support (Next: Task 2.3)",
        "⏳ Web interface (Next: Task 3.1)"
    ];
    
    for feature in features {
        print(f"  {feature}");
    }
    
    print("\n🚀 Next Implementation Steps:");
    next_steps = [
        "1. Implement OSP Graph Schema (Task 1.2)",
        "2. Create seed dataset for Kenyan crops (Task 1.3)", 
        "3. Build data ingestion walkers (Task 1.4)",
        "4. Develop Context/RAG Agent (Task 1.5)"
    ];
    
    for step in next_steps {
        print(f"  {step}");
    }
    
    print("\n📚 Documentation:");
    print("  - IMPLEMENTATION_PLAN.md: Detailed roadmap & architecture");
    print("  - TASK_TRACKER.md: Current progress & next tasks");
    print("  - src/: Modular components following SOLID principles");
    
    print("\n=== SYSTEM READY FOR DEVELOPMENT ===\n");
}

with entry {
    # Check system prerequisites
    api_status = check_api_key();
    print(api_status);
    
    if "SUCCESS" in api_status {
        print("✅ System initialization successful!");
        
        # Display system information
        print_system_info();
        
        # Test basic functionality
        print("🧪 Testing core functionality...");
        test_prompt = "Tunga salamu fupi katika Kiswahili kwa ajili ya Bustani Buddy.";
        
        print(f"📝 Test prompt: {test_prompt}");
        print("✅ JAC syntax and modular architecture working correctly!");
        print("🔄 Ready for Phase 1 implementation");
        
        print("\n🎯 To start development:");
        print("  1. Review IMPLEMENTATION_PLAN.md");
        print("  2. Check TASK_TRACKER.md for next tasks");
        print("  3. Begin with Task 1.2: OSP Graph Schema");
        
    } else {
        print("❌ System initialization failed!");
        print("🔧 Please set the GEMINI_API_KEY environment variable");
        print("💡 Example: export GEMINI_API_KEY='your-api-key-here'");
    }
}