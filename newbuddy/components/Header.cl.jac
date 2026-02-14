"""Header Component - App title and language switcher"""

def:pub Header(props: dict) {
    return <div style={{
        "textAlign": "center",
        "marginBottom": "32px"
    }}>
        <div style={{
            "display": "flex",
            "alignItems": "center",
            "justifyContent": "center",
            "gap": "12px",
            "marginBottom": "8px"
        }}>
            <div style={{
                "width": "56px",
                "height": "56px",
                "backgroundColor": "#22543d",
                "borderRadius": "50%",
                "display": "flex",
                "alignItems": "center",
                "justifyContent": "center",
                "fontSize": "32px",
                "boxShadow": "0 2px 8px rgba(34, 84, 61, 0.3)"
            }}>🌱</div>
            <h1 style={{
                "fontSize": "36px",
                "fontWeight": "700",
                "color": "#22543d",
                "margin": "0"
            }}>Bustani Buddy</h1>
        </div>
        
        <p style={{
            "fontSize": "18px",
            "color": "#4a5568",
            "marginBottom": "16px"
        }}>AI-Powered Crop Disease Diagnosis</p>
        
        <div style={{"marginTop": "16px"}}>
            <button 
                onClick={lambda -> None {
                    props.onLanguageChange("en");
                }}
                style={{
                    "padding": "8px 16px",
                    "margin": "0 4px",
                    "border": "2px solid #22543d",
                    "borderRadius": "8px",
                    "cursor": "pointer",
                    "fontWeight": "600",
                    "backgroundColor": "#22543d",
                    "color": "white"
            }}>English</button>
            
            <button 
                onClick={lambda -> None {
                    props.onLanguageChange("sw");
                }}
                style={{
                    "padding": "8px 16px",
                    "margin": "0 4px",
                    "border": "2px solid #22543d",
                    "borderRadius": "8px",
                    "cursor": "pointer",
                    "fontWeight": "600",
                    "backgroundColor": "#e2e8f0",
                    "color": "#2d3748"
            }}>Kiswahili</button>
        </div>
    </div>;
}
