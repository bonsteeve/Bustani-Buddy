import {__jacJsx, __jacSpawn} from "@jac-client/utils";
import { useState } from "react";
function render_diagnosis_results(current_diagnosis) {
  if (!current_diagnosis || Object.keys(current_diagnosis).length === 0) {
    return __jacJsx("div", {}, []);
  }
  return __jacJsx("div", {"style": {"marginTop": "32px", "padding": "24px", "backgroundColor": "#f0fdf4", "borderRadius": "12px", "border": "2px solid #22543d"}}, [__jacJsx("h2", {"style": {"fontSize": "24px", "fontWeight": "700", "color": "#22543d", "marginBottom": "16px"}}, ["🌾 Diagnosis Results"]), __jacJsx("div", {"style": {"marginBottom": "16px"}}, [__jacJsx("p", {"style": {"fontWeight": "600", "color": "#2d3748"}}, ["Disease: ", __jacJsx("span", {"style": {"color": "#22543d"}}, [current_diagnosis.disease_name])]), __jacJsx("p", {"style": {"fontWeight": "600", "color": "#2d3748"}}, ["Confidence: ", __jacJsx("span", {"style": {"color": "#22543d"}}, [current_diagnosis.confidence * 100, "%"])])]), __jacJsx("div", {"style": {"marginBottom": "16px"}}, [__jacJsx("h3", {"style": {"fontWeight": "600", "color": "#2d3748", "marginBottom": "8px"}}, ["📋 Symptoms Analysis:"]), __jacJsx("p", {"style": {"color": "#4a5568"}}, [current_diagnosis.symptoms_analysis])]), __jacJsx("div", {"style": {"marginBottom": "16px"}}, [__jacJsx("h3", {"style": {"fontWeight": "600", "color": "#2d3748", "marginBottom": "8px"}}, ["💊 Recommended Treatments:"]), __jacJsx("p", {"style": {"color": "#4a5568"}}, [String(current_diagnosis.recommended_treatments)])]), __jacJsx("div", {"style": {"marginBottom": "16px"}}, [__jacJsx("h3", {"style": {"fontWeight": "600", "color": "#2d3748", "marginBottom": "8px"}}, ["⚠️ Prevention Advice:"]), __jacJsx("p", {"style": {"color": "#4a5568"}}, [current_diagnosis.prevention_advice])]), __jacJsx("div", {"style": {"marginBottom": "16px"}}, [__jacJsx("h3", {"style": {"fontWeight": "600", "color": "#2d3748", "marginBottom": "8px"}}, ["🌍 Regional Context:"]), __jacJsx("p", {"style": {"color": "#4a5568"}}, [current_diagnosis.regional_context])]), __jacJsx("div", {"style": {"marginBottom": "16px"}}, [__jacJsx("h3", {"style": {"fontWeight": "600", "color": "#2d3748", "marginBottom": "8px"}}, ["📈 Market Intelligence:"]), __jacJsx("p", {"style": {"color": "#4a5568"}}, [current_diagnosis.market_intelligence])])]);
}
function app() {
  let [current_diagnosis, setDiagnosis] = useState({});
  let [is_loading, setIsLoading] = useState(false);
  let [selected_language, setLanguage] = useState("en");
  async function onDiagnosisSubmit(e) {
    e.preventDefault();
    setIsLoading(true);
    setDiagnosis({});
    console.log("Starting diagnosis...");
    let crop_type = document.getElementById("cropType").value;
    let symptoms_text = document.getElementById("imageDescription").value;
    let region_name = document.getElementById("regionName").value;
    if (!crop_type || !symptoms_text) {
      alert("Please select a crop and describe the symptoms");
      setIsLoading(false);
      return;
    }
    console.log("About to spawn ExecutorAgent...");
    let data = await __jacSpawn("ExecutorAgent", "", {"crop_type": crop_type, "symptoms_text": symptoms_text, "image_description": symptoms_text, "region_name": region_name});
    console.log("Spawn response received:", data);
    if (data && data.error) {
      console.error("Backend Error:", data.error);
      let err_str = String(data.error);
      if (err_str.includes("RateLimitError")) {
        let retry_match = err_str.match("Please retry in ([0-9.]+)s");
        if (retry_match) {
          let wait_time = Math.ceil(parseFloat(retry_match[1]));
          alert("\u26a0\ufe0f AI Service Busy: Rate limit exceeded. Please wait " + wait_time + " seconds and try again.");
        } else {
          alert("\u26a0\ufe0f AI Service Busy: Rate limit exceeded. Please wait a minute and try again.");
        }
      } else {
        alert("\u274c Diagnosis Failed: " + err_str);
      }
      setIsLoading(false);
      return;
    }
    if (data && data.reports && data.reports.length > 0) {
      let report_data = data.reports[0];
      console.log("Extracted report data:", report_data);
      setDiagnosis({"disease_name": report_data.disease_name, "confidence": report_data.confidence, "symptoms_analysis": report_data.symptoms_analysis, "recommended_treatments": report_data.recommended_treatments, "prevention_advice": report_data.prevention_advice, "regional_context": report_data.regional_context, "market_intelligence": report_data.market_intelligence});
    }
    setIsLoading(false);
    console.log("Diagnosis complete.");
    alert("Diagnosis received! Check console for results");
  }
  return __jacJsx("div", {"style": {"minHeight": "100vh", "backgroundColor": "#f0fdf4", "padding": "20px", "fontFamily": "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif"}}, [__jacJsx("div", {"style": {"maxWidth": "800px", "margin": "0 auto", "backgroundColor": "white", "borderRadius": "16px", "boxShadow": "0 4px 6px rgba(0, 0, 0, 0.1)", "padding": "32px"}}, [__jacJsx("div", {"style": {"textAlign": "center", "marginBottom": "32px"}}, [__jacJsx("h1", {"style": {"fontSize": "36px", "fontWeight": "700", "color": "#22543d", "marginBottom": "8px"}}, ["🌱 Bustani Buddy"]), __jacJsx("p", {"style": {"fontSize": "18px", "color": "#4a5568", "marginBottom": "16px"}}, ["AI-Powered Crop Disease Diagnosis"]), __jacJsx("div", {"style": {"marginTop": "16px"}}, [__jacJsx("button", {"onClick": () => {
    setLanguage("en");
    console.log("Language changed to: en");
  }, "style": {"padding": "8px 16px", "margin": "0 4px", "border": "2px solid #22543d", "borderRadius": "8px", "cursor": "pointer", "fontWeight": "600", "backgroundColor": "#22543d", "color": "white"}}, ["English"]), __jacJsx("button", {"onClick": () => {
    setLanguage("sw");
    console.log("Language changed to: sw");
  }, "style": {"padding": "8px 16px", "margin": "0 4px", "border": "2px solid #22543d", "borderRadius": "8px", "cursor": "pointer", "fontWeight": "600", "backgroundColor": "#e2e8f0", "color": "#2d3748"}}, ["Kiswahili"])])]), __jacJsx("form", {"id": "diagnosisForm", "onSubmit": onDiagnosisSubmit}, [__jacJsx("div", {"style": {"marginBottom": "20px"}}, [__jacJsx("label", {"style": {"display": "block", "marginBottom": "8px", "fontWeight": "600", "color": "#2d3748"}}, ["Select Your Crop:"]), __jacJsx("select", {"id": "cropType", "style": {"width": "100%", "padding": "12px", "fontSize": "16px", "border": "2px solid #e2e8f0", "borderRadius": "8px", "backgroundColor": "white", "cursor": "pointer"}}, [__jacJsx("option", {"value": "maize"}, ["Maize"]), __jacJsx("option", {"value": "beans"}, ["Beans"]), __jacJsx("option", {"value": "tomatoes"}, ["Tomatoes"]), __jacJsx("option", {"value": "cabbage"}, ["Cabbage"]), __jacJsx("option", {"value": "kale"}, ["Kale"]), __jacJsx("option", {"value": "potatoes"}, ["Potatoes"])])]), __jacJsx("div", {"style": {"marginBottom": "20px"}}, [__jacJsx("label", {"style": {"display": "block", "marginBottom": "8px", "fontWeight": "600", "color": "#2d3748"}}, ["Describe What You See on the Plant:"]), __jacJsx("textarea", {"id": "imageDescription", "rows": "3", "placeholder": "e.g., Yellow spots on leaves, brown edges, wilting...", "style": {"width": "100%", "padding": "12px", "fontSize": "16px", "border": "2px solid #e2e8f0", "borderRadius": "8px", "resize": "vertical", "minHeight": "80px"}}, [])]), __jacJsx("div", {"style": {"marginBottom": "20px"}}, [__jacJsx("label", {"style": {"display": "block", "marginBottom": "8px", "fontWeight": "600", "color": "#2d3748"}}, ["Region (Optional):"]), __jacJsx("select", {"id": "regionName", "style": {"width": "100%", "padding": "12px", "fontSize": "16px", "border": "2px solid #e2e8f0", "borderRadius": "8px", "backgroundColor": "white", "cursor": "pointer"}}, [__jacJsx("option", {"value": "Central Kenya"}, ["Central Kenya"]), __jacJsx("option", {"value": "Western Kenya"}, ["Western Kenya"]), __jacJsx("option", {"value": "Eastern Kenya"}, ["Eastern Kenya"]), __jacJsx("option", {"value": "Rift Valley"}, ["Rift Valley"]), __jacJsx("option", {"value": "Coast"}, ["Coast"]), __jacJsx("option", {"value": "Nyanza"}, ["Nyanza"])])]), __jacJsx("div", {"style": {"marginBottom": "20px"}}, [__jacJsx("label", {"style": {"display": "block", "marginBottom": "8px", "fontWeight": "600", "color": "#2d3748"}}, ["Upload Image or Video of the Plant:"]), __jacJsx("input", {"type": "file", "id": "plantMedia", "accept": "image/*,video/*", "capture": "environment", "style": {"width": "100%", "padding": "12px", "fontSize": "16px", "border": "2px solid #e2e8f0", "borderRadius": "8px", "backgroundColor": "white", "cursor": "pointer"}}, []), __jacJsx("p", {"style": {"marginTop": "8px", "fontSize": "14px", "color": "#718096"}}, ["📸 Take a photo or 📹 record a video, or choose from gallery"])]), __jacJsx("button", {"type": "submit", "style": {"width": "100%", "padding": "16px", "fontSize": "18px", "fontWeight": "700", "backgroundColor": "#22543d", "color": "white", "border": "none", "borderRadius": "8px", "cursor": "pointer"}}, ["Diagnose Disease"])]), render_diagnosis_results(current_diagnosis)])]);
}
export { app, render_diagnosis_results };
