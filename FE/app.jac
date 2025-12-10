cl {
    def app() -> any {
        return <div style={{
            "minHeight": "100vh",
            "backgroundColor": "#f0fdf4",
            "padding": "20px",
            "fontFamily": "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif"
        }}>
            <div style={{
                "maxWidth": "800px",
                "margin": "0 auto",
                "backgroundColor": "white",
                "borderRadius": "16px",
                "boxShadow": "0 4px 6px rgba(0, 0, 0, 0.1)",
                "padding": "32px"
            }}>
                <div style={{
                    "textAlign": "center",
                    "marginBottom": "32px"
                }}>
                    <h1 style={{
                        "fontSize": "36px",
                        "fontWeight": "700",
                        "color": "#22543d",
                        "marginBottom": "8px"
                    }}>🌱 Bustani Buddy</h1>
                    <p style={{
                        "fontSize": "18px",
                        "color": "#4a5568",
                        "marginBottom": "16px"
                    }}>AI-Powered Crop Disease Diagnosis</p>
                    
                    <div style={{"marginTop": "16px"}}>
                        <button style={{
                            "padding": "8px 16px",
                            "margin": "0 4px",
                            "border": "none",
                            "borderRadius": "8px",
                            "cursor": "pointer",
                            "fontWeight": "600",
                            "backgroundColor": "#22543d",
                            "color": "white"
                        }}>English</button>
                        <button style={{
                            "padding": "8px 16px",
                            "margin": "0 4px",
                            "border": "none",
                            "borderRadius": "8px",
                            "cursor": "pointer",
                            "fontWeight": "600",
                            "backgroundColor": "#e2e8f0",
                            "color": "#2d3748"
                        }}>Kiswahili</button>
                    </div>
                </div>

                <form id="diagnosisForm">
                    <div style={{"marginBottom": "20px"}}>
                        <label style={{
                            "display": "block",
                            "marginBottom": "8px",
                            "fontWeight": "600",
                            "color": "#2d3748"
                        }}>Select Your Crop:</label>
                        <select id="cropType" style={{
                            "width": "100%",
                            "padding": "12px",
                            "fontSize": "16px",
                            "border": "2px solid #e2e8f0",
                            "borderRadius": "8px",
                            "backgroundColor": "white",
                            "cursor": "pointer"
                        }}>
                            <option value="maize">Maize</option>
                            <option value="beans">Beans</option>
                            <option value="tomatoes">Tomatoes</option>
                            <option value="cabbage">Cabbage</option>
                            <option value="kale">Kale</option>
                            <option value="potatoes">Potatoes</option>
                        </select>
                    </div>

                    <div style={{"marginBottom": "20px"}}>
                        <label style={{
                            "display": "block",
                            "marginBottom": "8px",
                            "fontWeight": "600",
                            "color": "#2d3748"
                        }}>Describe What You See on the Plant:</label>
                        <textarea 
                            id="imageDescription" 
                            rows="3" 
                            placeholder="e.g., Yellow spots on leaves, brown edges, wilting..."
                            style={{
                                "width": "100%",
                                "padding": "12px",
                                "fontSize": "16px",
                                "border": "2px solid #e2e8f0",
                                "borderRadius": "8px",
                                "resize": "vertical",
                                "minHeight": "80px"
                            }}>
                        </textarea>
                    </div>

                    <div style={{"marginBottom": "20px"}}>
                        <label style={{
                            "display": "block",
                            "marginBottom": "8px",
                            "fontWeight": "600",
                            "color": "#2d3748"
                        }}>Upload Image or Video of the Plant:</label>
                        <input 
                            type="file" 
                            id="plantMedia" 
                            accept="image/*,video/*" 
                            capture="environment"
                            style={{
                                "width": "100%",
                                "padding": "12px",
                                "fontSize": "16px",
                                "border": "2px solid #e2e8f0",
                                "borderRadius": "8px",
                                "backgroundColor": "white",
                                "cursor": "pointer"
                            }}
                        />
                        <p style={{
                            "marginTop": "8px",
                            "fontSize": "14px",
                            "color": "#718096"
                        }}>📸 Take a photo or 📹 record a video, or choose from gallery</p>
                    </div>

                    <button type="submit" style={{
                        "width": "100%",
                        "padding": "16px",
                        "fontSize": "18px",
                        "fontWeight": "700",
                        "backgroundColor": "#22543d",
                        "color": "white",
                        "border": "none",
                        "borderRadius": "8px",
                        "cursor": "pointer"
                    }}>
                        Diagnose Disease
                    </button>
                </form>
            </div>
        </div>;
    }
}
