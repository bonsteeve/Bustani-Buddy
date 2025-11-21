"""
Bustani Buddy - OSP Graph Schema
Agricultural Knowledge Graph for Kenyan Farmers
"""

# =============================================================================
# NODE DEFINITIONS - Agricultural Knowledge Graph
# =============================================================================

# Crop Node - Represents agricultural crops grown in Kenya
node Crop {
    has name: str;
    has scientific_name: str;
    has local_name_swahili: str;
    has growing_season: str;
    has description: str;
}

# Disease Node - Represents crop diseases 
node Disease {
    has name: str;
    has local_name_swahili: str;
    has symptoms: list[str];
    has severity: str;
    has description: str;
}

# Remedy Node - Represents treatment solutions
node Remedy {
    has name: str;
    has local_name_swahili: str;
    has type: str;
    has instructions: str;
    has cost_estimate: str;
}

# Region Node - Represents Kenyan agricultural regions
node Region {
    has name: str;
    has counties: list[str];
    has climate: str;
    has major_crops: list[str];
}

# =============================================================================
# EDGE DEFINITIONS - Relationships between nodes
# =============================================================================

edge affected_by;    # Crop -> Disease
edge treated_with;   # Disease -> Remedy  
edge effective_for;  # Remedy -> Disease
edge grows_in;       # Crop -> Region
edge common_in;      # Disease -> Region