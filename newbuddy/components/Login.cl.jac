"""Login Component - User authentication form"""

def:pub Login(props: dict) {
    # Handle form submission
    async def handleSubmit(e: any) -> None {
        e.preventDefault();
        
        email = document.getElementById("loginEmail").value;
        password = document.getElementById("loginPassword").value;
        
        if not email or not password {
            alert("Please enter both email and password");
            return;
        }
        
        console.log("Attempting login for:", email);
        
        # Show loading state
        submit_btn = document.getElementById("loginSubmitBtn");
        original_text = submit_btn.textContent;
        submit_btn.textContent = "Logging in...";
        submit_btn.disabled = True;
        
        # Call backend LoginWalker
        result = await root spawn LoginWalker(
            email=email,
            password=password
        );
        
        console.log("Login response:", result);
        
        # Reset button state
        submit_btn.textContent = original_text;
        submit_btn.disabled = False;
        
        # Handle response
        if result and result.reports and result.reports.length > 0 {
            login_result = result.reports[0];
            
            if login_result.success {
                alert("Welcome, " + login_result.user.name + "!");
                
                # Store user in localStorage
                localStorage.setItem("user", JSON.stringify(login_result.user));
                
                # Call parent callback
                props.onLogin(login_result.user);
            } else {
                alert(login_result.error);
            }
        } else {
            alert("Login failed. Please try again.");
        }
    }
    
    # Handle forgot password click (placeholder for now)
    def handleForgotPassword(e: any) -> None {
        e.preventDefault();
        alert("Password reset functionality coming soon! Please contact admin.");
    }
    
    return <div style={{
        "minHeight": "100vh",
        "display": "flex",
        "alignItems": "center",
        "justifyContent": "center",
        "backgroundColor": "#f0fdf4",
        "fontFamily": "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif"
    }}>
        <div style={{
            "backgroundColor": "white",
            "padding": "48px",
            "borderRadius": "16px",
            "boxShadow": "0 4px 6px rgba(0, 0, 0, 0.1)",
            "maxWidth": "400px",
            "width": "100%"
        }}>
            <div style={{"textAlign": "center", "marginBottom": "32px"}}>
                <div style={{
                    "display": "flex",
                    "alignItems": "center",
                    "justifyContent": "center",
                    "gap": "12px",
                    "marginBottom": "8px"
                }}>
                    <div style={{
                        "width": "48px",
                        "height": "48px",
                        "backgroundColor": "#22543d",
                        "borderRadius": "50%",
                        "display": "flex",
                        "alignItems": "center",
                        "justifyContent": "center",
                        "fontSize": "28px",
                        "boxShadow": "0 2px 8px rgba(34, 84, 61, 0.3)"
                    }}>🌱</div>
                    <h1 style={{
                        "fontSize": "32px",
                        "fontWeight": "700",
                        "color": "#22543d",
                        "margin": "0"
                    }}>Bustani Buddy</h1>
                </div>
                <p style={{
                    "fontSize": "16px",
                    "color": "#4a5568"
                }}>Sign in to your account</p>
            </div>
            
            <form onSubmit={handleSubmit}>
                <div style={{"marginBottom": "20px"}}>
                    <label style={{
                        "display": "block",
                        "marginBottom": "8px",
                        "fontWeight": "600",
                        "color": "#2d3748"
                    }}>Email Address</label>
                    <input
                        type="email"
                        id="loginEmail"
                        placeholder="farmer@bustani.com"
                        required={True}
                        style={{
                            "width": "100%",
                            "padding": "12px",
                            "fontSize": "16px",
                            "border": "2px solid #e2e8f0",
                            "borderRadius": "8px",
                            "outline": "none",
                            "boxSizing": "border-box"
                        }}
                    />
                </div>
                
                <div style={{"marginBottom": "8px"}}>
                    <label style={{
                        "display": "block",
                        "marginBottom": "8px",
                        "fontWeight": "600",
                        "color": "#2d3748"
                    }}>Password</label>
                    <div style={{"position": "relative"}}>
                        <input
                            type="password"
                            id="loginPassword"
                            placeholder="Enter your password"
                            required={True}
                            style={{
                                "width": "100%",
                                "padding": "12px",
                                "paddingRight": "48px",
                                "fontSize": "16px",
                                "border": "2px solid #e2e8f0",
                                "borderRadius": "8px",
                                "outline": "none",
                                "boxSizing": "border-box"
                            }}
                        />
                        <button
                            type="button"
                            onClick={lambda -> None {
                                pw_field = document.getElementById("loginPassword");
                                if pw_field.type == "password" {
                                    pw_field.type = "text";
                                } else {
                                    pw_field.type = "password";
                                }
                            }}
                            style={{
                                "position": "absolute",
                                "right": "12px",
                                "top": "50%",
                                "transform": "translateY(-50%)",
                                "background": "none",
                                "border": "none",
                                "cursor": "pointer",
                                "fontSize": "20px",
                                "padding": "4px",
                                "display": "flex",
                                "alignItems": "center",
                                "color": "#718096"
                            }}>
                            👁️
                        </button>
                    </div>
                </div>
                
                <div style={{"marginBottom": "24px", "textAlign": "right"}}>
                    <a 
                        href="#"
                        onClick={handleForgotPassword}
                        style={{
                            "fontSize": "14px",
                            "color": "#22543d",
                            "textDecoration": "none",
                            "fontWeight": "600"
                        }}>
                        Forgot Password?
                    </a>
                </div>
                
                <button 
                    type="submit"
                    id="loginSubmitBtn"
                    style={{
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
                    Sign In
                </button>
            </form>
        </div>
    </div>;
}
