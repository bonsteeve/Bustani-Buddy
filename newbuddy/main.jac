"""
Bustani Buddy - AI-Powered Crop Disease Diagnosis
Professional Modular Architecture with Authentication

Architecture:
  Backend: 
    - executor_agent.jac (ExecutorAgent walker)
    - auth/auth_walker.jac (LoginWalker)
  Frontend Components:
    - components/Login.cl.jac
    - components/Header.cl.jac
    - components/DiagnosisForm.cl.jac
    - components/DiagnosisResults.cl.jac
"""

# Backend imports
import from executor_agent { ExecutorAgent }
import from auth.auth_walker { LoginWalker }

# Frontend
cl {
    import from react { useState, useEffect }
    import from components.Login { Login }
    import from components.Header { Header }
    import from components.DiagnosisForm { DiagnosisForm }
    import from components.DiagnosisResults { DiagnosisResults }

    def:pub app() {
        # Authentication State
        [is_authenticated, setIsAuthenticated] = useState(False);
        [current_user, setCurrentUser] = useState(None);
        
        # App State
        [diagnosis, setDiagnosis] = useState({});
        [is_loading, setIsLoading] = useState(False);
        [language, setLanguage] = useState("en");
        
        # Check localStorage for existing session on mount
        useEffect(lambda -> None {
            stored_user = localStorage.getItem("user");
            if stored_user {
                user_data = JSON.parse(stored_user);
                setCurrentUser(user_data);
                setIsAuthenticated(True);
                console.log("Restored session for:", user_data.email);
            }
        }, []);


        # Process diagnosis response from backend
        async def handleDiagnosisResponse(data: any) -> None {
            console.log("Response received:", data);

            if data and data.error {
                console.error("Backend Error:", data.error);
                alert("Diagnosis failed. Please try again.");
                setIsLoading(False);
                return;
            }

            if data and data.reports and data.reports.length > 0 {
                report_data = data.reports[0];
                console.log("Diagnosis complete:", report_data);

                setDiagnosis({
                    "disease_name": report_data.disease_name,
                    "confidence": report_data.confidence,
                    "symptoms_analysis": report_data.symptoms_analysis,
                    "recommended_treatments": report_data.recommended_treatments,
                    "prevention_advice": report_data.prevention_advice,
                    "regional_context": report_data.regional_context,
                    "market_intelligence": report_data.market_intelligence
                });

                alert("✅ Diagnosis complete! See results below.");
            }

            setIsLoading(False);
        }

        # Handle form submission
        async def handleDiagnosisSubmit(formData: dict) -> None {
            console.log("Submitting diagnosis request...");
            setIsLoading(True);
            setDiagnosis({});

            # Call backend ExecutorAgent walker
            data = await root spawn ExecutorAgent(
                crop_type=formData.crop_type,
                symptoms_text=formData.symptoms_text,
                image_base64=formData.image_base64,
                image_description=formData.image_description,
                region_name=formData.region_name
            );

            handleDiagnosisResponse(data);
        }

        # Handle language change
        def handleLanguageChange(lang: str) -> None {
            setLanguage(lang);
            console.log("Language changed to:", lang);
        }
        
        # Handle successful login
        def handleLogin(user: dict) -> None {
            setCurrentUser(user);
            setIsAuthenticated(True);
            console.log("User logged in:", user.email);
        }
        
        # Handle logout
        def handleLogout() -> None {
            localStorage.removeItem("user");
            setCurrentUser(None);
            setIsAuthenticated(False);
            setDiagnosis({});
            console.log("User logged out");
        }
        
        # Conditional Rendering: Show Login if not authenticated
        if not is_authenticated {
            return <Login onLogin={handleLogin} />;
        }

        # Render: Main App (authenticated users only)
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
                    "display": "flex",
                    "justifyContent": "space-between",
                    "alignItems": "center",
                    "marginBottom": "16px",
                    "paddingBottom": "16px",
                    "borderBottom": "2px solid #e2e8f0"
                }}>
                    <div>
                        <p style={{"color": "#4a5568", "fontSize": "14px"}}>
                            Welcome, <strong>{current_user.name}</strong>
                        </p>
                        <p style={{"color": "#718096", "fontSize": "12px"}}>{current_user.email}</p>
                    </div>
                    <button
                        onClick={handleLogout}
                        style={{
                            "padding": "8px 16px",
                            "backgroundColor": "#e53e3e",
                            "color": "white",
                            "border": "none",
                            "borderRadius": "8px",
                            "cursor": "pointer",
                            "fontWeight": "600",
                            "fontSize": "14px"
                        }}>
                        Logout
                    </button>
                </div>
                
                <Header language={language} onLanguageChange={handleLanguageChange} />
                <DiagnosisForm onSubmit={handleDiagnosisSubmit} isLoading={is_loading} />
                <DiagnosisResults diagnosis={diagnosis} />
            </div>
        </div>;
    }
}
