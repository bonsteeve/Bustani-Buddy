"""
Bustani Buddy: AI-Powered Agricultural Research Agent
JAC + byLLM + Gemini Integration for Agricultural Intelligence
"""

import from schema { Crop, Disease, Remedy, Region }
import from byllm.lib { Model }

# Initialize AI model for agricultural research
glob llm = Model(model_name="gemini/gemini-2.0-flash-lite");

# Structured data objects for AI responses
obj CropRecommendations {
    has crops: list[str];
    has planting_season: str;
    has climate_advice: str;
    has yield_potential: str;
}
sem CropRecommendations = "Extract current crop recommendations for Kenya based on season, climate, and agricultural best practices";

obj DiseaseAlerts {
    has diseases: list[str];
    has affected_crops: list[str];
    has regions: list[str];
    has prevention: str;
}
sem DiseaseAlerts = "Extract current agricultural disease alerts and outbreaks in Kenya with prevention measures";

obj MarketPrices {
    has crop_prices: dict[str, str];
    has market_trends: str;
    has price_forecast: str;
}
sem MarketPrices = "Extract current market prices and trends for major Kenyan crops";

# AI-powered agricultural research functions
def get_crop_recommendations(region: str, season: str) -> CropRecommendations by llm();
def get_disease_alerts(crop_types: str) -> DiseaseAlerts by llm();
def get_market_intelligence(crops: str) -> MarketPrices by llm();

# AI Agricultural Research Agent - Production Ready  
walker AIAgricultureResearcher {
    has region: str;
    has season: str;
    has crops_of_interest: str;
    
    can get_research_data with entry {
        crop_recs = get_crop_recommendations(self.region, self.season);
        disease_alerts = get_disease_alerts(self.crops_of_interest);
        market_data = get_market_intelligence(self.crops_of_interest);
        
        report {
            "crop_recommendations": crop_recs,
            "disease_alerts": disease_alerts, 
            "market_intelligence": market_data
        };
    }
}