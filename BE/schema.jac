"""
Agricultural Data Models for Kenyan Farming
"""

# Node definitions for the agricultural knowledge graph
node Crop {
    has name: str;
    has scientific_name: str;
    has season: str;
    has water_needs: str;
    has soil_type: str;
    has growth_period: int;
    has yield_per_hectare: float;
    has market_price_per_kg: float;
}

node Disease {
    has name: str;
    has symptoms: list[str];
    has severity: str;
    has affected_crops: list[str];
    has prevention_methods: list[str];
}

node Remedy {
    has name: str;
    has type: str;
    has ingredients: list[str];
    has application_method: str;
    has effectiveness_rating: float;
    has cost_per_application: float;
}

node Region {
    has name: str;
    has climate: str;
    has rainfall_mm: float;
    has temperature_range: str;
    has soil_types: list[str];
    has major_crops: list[str];
}

