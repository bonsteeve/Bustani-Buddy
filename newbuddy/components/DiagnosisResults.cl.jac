"""Diagnosis Results Component - Display diagnosis from backend"""

def:pub DiagnosisResults(props: dict) {
    if not props.diagnosis or Object.keys(props.diagnosis).length == 0 {
        return <div></div>;
    }
    
    return <div style={{
        "marginTop": "32px",
        "padding": "24px",
        "backgroundColor": "#f0fdf4",
        "borderRadius": "12px",
        "border": "2px solid #22543d"
    }}>
        <h2 style={{
            "fontSize": "24px",
            "fontWeight": "700",
            "color": "#22543d",
            "marginBottom": "16px"
        }}>🌾 Diagnosis Results</h2>
        
        <div style={{"marginBottom": "16px"}}>
            <p style={{"fontWeight": "600", "color": "#2d3748"}}>
                Disease: <span style={{"color": "#22543d"}}>{props.diagnosis.disease_name}</span>
            </p>
            <p style={{"fontWeight": "600", "color": "#2d3748"}}>
                Confidence: <span style={{"color": "#22543d"}}>{props.diagnosis.confidence * 100}%</span>
            </p>
        </div>
        
        <div style={{"marginBottom": "16px"}}>
            <h3 style={{"fontWeight": "600", "color": "#2d3748", "marginBottom": "8px"}}>
                📋 Symptoms Analysis:
            </h3>
            <p style={{"color": "#4a5568"}}>{props.diagnosis.symptoms_analysis}</p>
        </div>
        
        <div style={{"marginBottom": "16px"}}>
            <h3 style={{"fontWeight": "600", "color": "#2d3748", "marginBottom": "8px"}}>
                💊 Recommended Treatments:
            </h3>
            <p style={{"color": "#4a5568"}}>{String(props.diagnosis.recommended_treatments)}</p>
        </div>
        
        <div style={{"marginBottom": "16px"}}>
            <h3 style={{"fontWeight": "600", "color": "#2d3748", "marginBottom": "8px"}}>
                ⚠️ Prevention Advice:
            </h3>
            <p style={{"color": "#4a5568"}}>{props.diagnosis.prevention_advice}</p>
        </div>
        
        <div style={{"marginBottom": "16px"}}>
            <h3 style={{"fontWeight": "600", "color": "#2d3748", "marginBottom": "8px"}}>
                🌍 Regional Context:
            </h3>
            <p style={{"color": "#4a5568"}}>{props.diagnosis.regional_context}</p>
        </div>

        <div style={{"marginBottom": "16px"}}>
            <h3 style={{"fontWeight": "600", "color": "#2d3748", "marginBottom": "8px"}}>
                📈 Market Intelligence:
            </h3>
            <p style={{"color": "#4a5568"}}>{props.diagnosis.market_intelligence}</p>
        </div>
    </div>;
}
