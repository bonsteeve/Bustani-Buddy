"""
Knowledge Graph Traversal & Intelligent Retrieval for Bustani Buddy
Integrates with Gemini AI for agricultural disease analysis and remedy recommendations
"""

import from byllm.lib { Model }
import from schema { Crop, Disease, Remedy, Region }

glob context_llm = Model(model_name="vertex_ai/gemini-2.5-flash");

# Disease analysis result structure
obj DiseaseAnalysis {
    has disease_name: str;
    has confidence: float;
    has symptoms_matched: list[str];
    has recommended_action: str;
}
sem DiseaseAnalysis = "Analyze crop symptoms to identify diseases with confidence scoring and recommend actions for Kenyan farmers";

# Remedy recommendations structure  
obj RemedyRecommendation {
    has remedy_name: str;
    has type: str;
    has cost_ksh: float;
    has effectiveness: str;
    has application_method: str;
}
sem RemedyRecommendation = "Provide specific remedy recommendations for agricultural diseases suitable for Kenyan farming conditions";

# Regional context analysis
obj RegionalContext {
    has climate_suitability: str;
    has local_availability: str;
    has seasonal_timing: str;
    has success_rate: str;
}
sem RegionalContext = "Analyze regional agricultural conditions in Kenya for disease treatment effectiveness";

# AI-powered context functions
def analyze_disease_symptoms(crop: str, symptoms: str) -> DiseaseAnalysis by context_llm();
def get_remedy_recommendations(disease: str, region: str) -> RemedyRecommendation by context_llm();
def analyze_regional_context(location: str, treatment: str) -> RegionalContext by context_llm();

# Context Agent Walker - Production Ready
walker ContextAgent {
    has crop_name: str;
    has symptoms_text: str;
    has region_name: str;
    
    can get_disease_context with entry {
        disease_result = analyze_disease_symptoms(self.crop_name, self.symptoms_text);
        remedy_result = get_remedy_recommendations(disease_result.disease_name, self.region_name);
        regional_result = analyze_regional_context(self.region_name, remedy_result.remedy_name);
        
        report {
            "disease_analysis": disease_result,
            "remedy_recommendation": remedy_result,
            "regional_context": regional_result
        };
    }
}