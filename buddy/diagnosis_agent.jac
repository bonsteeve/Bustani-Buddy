"""
Purpose: Core disease diagnosis combining image analysis + text symptoms
"""

import from byllm.lib { Model }
import from schema { Crop, Disease, Remedy, Region }

glob diagnosis_llm = Model(model_name="vertex_ai/gemini-2.5-flash");

# Diagnosis result structure
obj DiagnosisResult {
    has disease_name: str;
    has confidence: float;
    has visual_symptoms: list[str];
    has text_symptoms: list[str];
    has severity_level: str;
    has treatment_recommendation: str;
}
sem DiagnosisResult = "Comprehensive multimodal disease diagnosis combining image analysis and text symptom evaluation for accurate agricultural disease identification";

# AI-powered diagnosis functions
def diagnose_multimodal_disease(image_description: str, text_symptoms: str, crop_type: str) -> DiagnosisResult by diagnosis_llm();

# Diagnosis Agent Walker - Production Ready
walker DiagnosisAgent {
    has image_description: str;
    has text_symptoms: str;
    has crop_type: str;
    
    can analyze_disease with entry {
        result = diagnose_multimodal_disease(self.image_description, self.text_symptoms, self.crop_type);
        report result;
    }
}