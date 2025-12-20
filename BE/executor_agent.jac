"""
Bustani Buddy - Executor Agent (Master Orchestrator)
Purpose: Central coordinator for all agents, workflow management, and session handling
"""

import from byllm.lib { Model }
import from schema { Crop, Disease, Remedy, Region }

# Import our specialized agent functions
import from diagnosis_agent { diagnose_multimodal_disease, DiagnosisResult }
import from context_agent { analyze_disease_symptoms, get_remedy_recommendations, analyze_regional_context, DiseaseAnalysis, RemedyRecommendation, RegionalContext }
import from ai_researcher { get_crop_recommendations, get_market_intelligence, CropRecommendations, MarketPrices }

glob executor_llm = Model(model_name="gemini/gemini-2.0-flash");

# Main diagnosis orchestration result
obj MasterDiagnosis {
    has crop_type: str;
    has disease_name: str;
    has confidence: float;
    has symptoms_analysis: str;
    has recommended_treatments: list[str];
    has prevention_advice: str;
    has regional_context: str;
    has market_intelligence: str;
}

# Semantic function definition
sem MasterDiagnosis = "Orchestrate complete agricultural disease diagnosis by analyzing crop symptoms, image details, and regional context. Coordinate all diagnostic agents to provide farmers with accurate disease identification, confidence scoring, treatment recommendations, and prevention advice suitable for Kenyan farming conditions.";

# True agent coordination functions
def orchestrate_agents_workflow(crop: str, symptoms: str, image_details: str, region: str) -> MasterDiagnosis {
    # Step 1: Multimodal diagnosis using diagnosis agent
    diagnosis_result = diagnose_multimodal_disease(image_details, symptoms, crop);
    
    # Step 2: Context analysis using context agent
    disease_analysis = analyze_disease_symptoms(crop, symptoms);
    
    # Step 3: Get remedy recommendations
    remedies = get_remedy_recommendations(diagnosis_result.disease_name, region);
    
    # Step 4: AI research for market intelligence
    market_data = get_market_intelligence(crop);
    
    # Step 5: Regional context analysis
    regional_info = analyze_regional_context(region, remedies.remedy_name);
    
    # Step 6: Compile comprehensive AI-powered result
    return MasterDiagnosis(
        crop_type=crop,
        disease_name=diagnosis_result.disease_name,
        confidence=diagnosis_result.confidence,
        symptoms_analysis=f"Visual: {diagnosis_result.visual_symptoms}, Text: {diagnosis_result.text_symptoms}",
        recommended_treatments=[diagnosis_result.treatment_recommendation, remedies.remedy_name],
        prevention_advice=f"Regional timing: {regional_info.seasonal_timing}, Success rate: {regional_info.success_rate}",
        regional_context=f"Climate: {regional_info.climate_suitability}, Availability: {regional_info.local_availability}",
        market_intelligence=f"Market insights: {market_data.prices if market_data else 'Data unavailable'}"
    );
}

# Master Executor Agent Walker - Clean JAC integration
walker ExecutorAgent {
    has crop_type: str = "";
    has symptoms_text: str = "";
    has image_description: str = "";
    has region_name: str = "Central Kenya";
    
    # Main entry point for agricultural disease diagnosis
    can diagnose_crop_disease with entry {
        result = orchestrate_agents_workflow(
            self.crop_type, 
            self.symptoms_text, 
            self.image_description, 
            self.region_name
        );
        report result;
    }
}