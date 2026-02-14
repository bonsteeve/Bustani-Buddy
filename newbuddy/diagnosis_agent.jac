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
sem DiagnosisResult = "Comprehensive multimodal disease diagnosis combining image analysis and text symptom evaluation for accurate agricultural disease identification. When image_base64 is provided (non-empty string), analyze the actual image data directly. The image_base64 contains base64-encoded image data that should be visually analyzed to identify disease symptoms, patterns, and visual indicators. Combine this visual analysis with the text_symptoms and crop_type to provide accurate diagnosis.";

# AI-powered diagnosis functions
# Analyzes actual image (base64) if provided, otherwise uses text description
# image_base64: base64-encoded image data (analyze this actual image when provided)
# image_description: fallback text description if no image is uploaded
# text_symptoms: user-provided symptom descriptions
# crop_type: type of crop being diagnosed
def diagnose_multimodal_disease(image_base64: str, image_description: str, text_symptoms: str, crop_type: str) -> DiagnosisResult by diagnosis_llm();

# Diagnosis Agent Walker - Production Ready
walker DiagnosisAgent {
    has image_base64: str;
    has image_description: str;
    has text_symptoms: str;
    has crop_type: str;
    
    can analyze_disease with entry {
        result = diagnose_multimodal_disease(self.image_base64, self.image_description, self.text_symptoms, self.crop_type);
        report result;
    }
}