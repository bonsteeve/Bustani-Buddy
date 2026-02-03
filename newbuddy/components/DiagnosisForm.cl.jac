"""Diagnosis Form Component - User input form for crop diagnosis"""

# Helper function to convert file to base64
async def convertFileToBase64(file: any) -> str {
    if not window.convertFileToBase64Helper {
        eval_code = "window.convertFileToBase64Helper = function(file) { return new Promise(function(resolve, reject) { var reader = new FileReader(); reader.onload = function(e) { var r = e.target.result; if (r.indexOf(',') > 0) r = r.split(',')[1]; resolve(r); }; reader.onerror = reject; reader.readAsDataURL(file); }); };";
        eval(eval_code);
    }
    return await window.convertFileToBase64Helper(file);
}

def:pub DiagnosisForm(props: dict) {
    # Handle form submission
    async def handleSubmit(e: any) -> None {
        e.preventDefault();
        
        crop_type = document.getElementById("cropType").value;
        symptoms_text = document.getElementById("imageDescription").value;
        region_name = document.getElementById("regionName").value;
        plant_media_input = document.getElementById("plantMedia");
        
        if not crop_type or not symptoms_text {
            alert("Please select a crop and describe the symptoms");
            return;
        }
        
        image_base64 = "";
        if plant_media_input and plant_media_input.files and plant_media_input.files.length > 0 {
            image_file = plant_media_input.files[0];
            console.log("Processing image:", image_file.name);
            image_base64 = await convertFileToBase64(image_file);
        }
        
        diagnosis_data = {
            "crop_type": crop_type,
            "symptoms_text": symptoms_text,
            "region_name": region_name,
            "image_base64": image_base64,
            "image_description": symptoms_text
        };
        
        props.onSubmit(diagnosis_data);
    }
    
    return <form id="diagnosisForm" onSubmit={handleSubmit}>
        <div style={{"marginBottom": "20px"}}>
            <label style={{
                "display": "block",
                "marginBottom": "8px",
                "fontWeight": "600",
                "color": "#2d3748"
            }}>Select Your Crop:</label>
            <select id="cropType" disabled={props.isLoading} style={{
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
                disabled={props.isLoading}
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
            <select id="regionName" disabled={props.isLoading} style={{
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
                disabled={props.isLoading}
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

        <button type="submit" disabled={props.isLoading} style={{
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
    </form>;
}
