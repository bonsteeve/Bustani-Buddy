"""
Bustani Buddy - Full Stack JAC Application
Purpose: AI-Powered Crop Disease Diagnosis for Kenyan Farmers
"""

# ============================================================================
# BACKEND: Executor Agent Walker (Imported logic from specialized agent file)
# ============================================================================
import from executor_agent { orchestrate_agents_workflow }

walker ExecutorAgent {
    has crop_type: str = "";
    has symptoms_text: str = "";
    has image_description: str = "";
    has region_name: str = "Central Kenya";
    
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

# ============================================================================
# BACKEND: Root Walker to Serve the App
# ============================================================================
walker root_page {
    can serve with entry {
        visit [-->](`?Page);
    }
}

# ============================================================================
# FRONTEND: Client-Side Code
# ============================================================================

cl import from react { useState }

cl {
    # Function to render diagnosis results
    def render_diagnosis_results(current_diagnosis: dict) -> any {
        if not current_diagnosis or Object.keys(current_diagnosis).length == 0 {
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
                    Disease: <span style={{"color": "#22543d"}}>{current_diagnosis.disease_name}</span>
                </p>
                <p style={{"fontWeight": "600", "color": "#2d3748"}}>
                    Confidence: <span style={{"color": "#22543d"}}>{current_diagnosis.confidence * 100}%</span>
                </p>
            </div>
            
            <div style={{"marginBottom": "16px"}}>
                <h3 style={{"fontWeight": "600", "color": "#2d3748", "marginBottom": "8px"}}>
                    📋 Symptoms Analysis:
                </h3>
                <p style={{"color": "#4a5568"}}>{current_diagnosis.symptoms_analysis}</p>
            </div>
            
            <div style={{"marginBottom": "16px"}}>
                <h3 style={{"fontWeight": "600", "color": "#2d3748", "marginBottom": "8px"}}>
                    💊 Recommended Treatments:
                </h3>
                <p style={{"color": "#4a5568"}}>{String(current_diagnosis.recommended_treatments)}</p>
            </div>
            
            <div style={{"marginBottom": "16px"}}>
                <h3 style={{"fontWeight": "600", "color": "#2d3748", "marginBottom": "8px"}}>
                    ⚠️ Prevention Advice:
                </h3>
                <p style={{"color": "#4a5568"}}>{current_diagnosis.prevention_advice}</p>
            </div>
            
            <div style={{"marginBottom": "16px"}}>
                <h3 style={{"fontWeight": "600", "color": "#2d3748", "marginBottom": "8px"}}>
                    🌍 Regional Context:
                </h3>
                <p style={{"color": "#4a5568"}}>{current_diagnosis.regional_context}</p>
            </div>

            <div style={{"marginBottom": "16px"}}>
                <h3 style={{"fontWeight": "600", "color": "#2d3748", "marginBottom": "8px"}}>
                    📈 Market Intelligence:
                </h3>
                <p style={{"color": "#4a5568"}}>{current_diagnosis.market_intelligence}</p>
            </div>
        </div>;
    }
    
    def app() -> any {
        [current_diagnosis, setDiagnosis] = useState({});
        [is_loading, setIsLoading] = useState(False);
        [selected_language, setLanguage] = useState("en");

        # Event handler for form submission
        async def onDiagnosisSubmit(e: any) -> None {
            e.preventDefault();
            
            # Set loading state
            setIsLoading(True);
            setDiagnosis({});
            console.log("Starting diagnosis...");
            
            # Get form data
            crop_type = document.getElementById("cropType").value;
            symptoms_text = document.getElementById("imageDescription").value;
            region_name = document.getElementById("regionName").value;
            
            # Validate inputs
            if not crop_type or not symptoms_text {
                alert("Please select a crop and describe the symptoms");
                setIsLoading(False);
                return;
            }
            
            # Call backend walker via Jac spawn
            console.log("About to spawn ExecutorAgent...");
            
            data = await root spawn ExecutorAgent(
                crop_type=crop_type,
                symptoms_text=symptoms_text,
                image_description=symptoms_text,
                region_name=region_name
            );
            console.log("Spawn response received:", data);
            
            if data and data.error {
                console.error("Backend Error:", data.error);
                err_str = String(data.error);
                if err_str.includes("RateLimitError") {
                    retry_match = err_str.match("Please retry in ([0-9.]+)s");
                    if retry_match {
                        wait_time = Math.ceil(parseFloat(retry_match[1]));
                        alert("⚠️ AI Service Busy: Rate limit exceeded. Please wait " + wait_time + " seconds and try again.");
                    } else {
                        alert("⚠️ AI Service Busy: Rate limit exceeded. Please wait a minute and try again.");
                    }
                } else {
                    alert("❌ Diagnosis Failed: " + err_str);
                }
                setIsLoading(False);
                return;
            }
            
            # Get diagnosis results from walker report
            if data and data.reports and data.reports.length > 0 {
                report_data = data.reports[0];
                console.log("Extracted report data:", report_data);
                
                # Full diagnosis response from MasterDiagnosis
                setDiagnosis({
                    "disease_name": report_data.disease_name,
                    "confidence": report_data.confidence,
                    "symptoms_analysis": report_data.symptoms_analysis,
                    "recommended_treatments": report_data.recommended_treatments,
                    "prevention_advice": report_data.prevention_advice,
                    "regional_context": report_data.regional_context,
                    "market_intelligence": report_data.market_intelligence
                });
            }
            
            setIsLoading(False);
            console.log("Diagnosis complete.");
            alert("Diagnosis received! Check console for results");
        }

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
                        <button 
                            onClick={lambda -> None {
                                setLanguage("en");
                                console.log("Language changed to: en");
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
                                setLanguage("sw");
                                console.log("Language changed to: sw");
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
                </div>

                <form id="diagnosisForm" onSubmit={onDiagnosisSubmit}>
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
                        }}>Region (Optional):</label>
                        <select id="regionName" style={{
                            "width": "100%",
                            "padding": "12px",
                            "fontSize": "16px",
                            "border": "2px solid #e2e8f0",
                            "borderRadius": "8px",
                            "backgroundColor": "white",
                            "cursor": "pointer"
                        }}>
                            <option value="Central Kenya">Central Kenya</option>
                            <option value="Western Kenya">Western Kenya</option>
                            <option value="Eastern Kenya">Eastern Kenya</option>
                            <option value="Rift Valley">Rift Valley</option>
                            <option value="Coast">Coast</option>
                            <option value="Nyanza">Nyanza</option>
                        </select>
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
                    }}>Diagnose Disease</button>
                </form>

                {render_diagnosis_results(current_diagnosis)}
            </div>
        </div>;
    }
}

# Initialize the app when DOM loads (outside cl block)
walker init_app {
    can init with entry {
        # This will be called by JAC to render the page
        visit [-->](`?Page);
    }
}
