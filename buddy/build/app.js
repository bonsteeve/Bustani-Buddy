function _regenerator() { /*! regenerator-runtime -- Copyright (c) 2014-present, Facebook, Inc. -- license (MIT): https://github.com/babel/babel/blob/main/packages/babel-helpers/LICENSE */ var e, t, r = "function" == typeof Symbol ? Symbol : {}, n = r.iterator || "@@iterator", o = r.toStringTag || "@@toStringTag"; function i(r, n, o, i) { var c = n && n.prototype instanceof Generator ? n : Generator, u = Object.create(c.prototype); return _regeneratorDefine2(u, "_invoke", function (r, n, o) { var i, c, u, f = 0, p = o || [], y = !1, G = { p: 0, n: 0, v: e, a: d, f: d.bind(e, 4), d: function d(t, r) { return i = t, c = 0, u = e, G.n = r, a; } }; function d(r, n) { for (c = r, u = n, t = 0; !y && f && !o && t < p.length; t++) { var o, i = p[t], d = G.p, l = i[2]; r > 3 ? (o = l === n) && (u = i[(c = i[4]) ? 5 : (c = 3, 3)], i[4] = i[5] = e) : i[0] <= d && ((o = r < 2 && d < i[1]) ? (c = 0, G.v = n, G.n = i[1]) : d < l && (o = r < 3 || i[0] > n || n > l) && (i[4] = r, i[5] = n, G.n = l, c = 0)); } if (o || r > 1) return a; throw y = !0, n; } return function (o, p, l) { if (f > 1) throw TypeError("Generator is already running"); for (y && 1 === p && d(p, l), c = p, u = l; (t = c < 2 ? e : u) || !y;) { i || (c ? c < 3 ? (c > 1 && (G.n = -1), d(c, u)) : G.n = u : G.v = u); try { if (f = 2, i) { if (c || (o = "next"), t = i[o]) { if (!(t = t.call(i, u))) throw TypeError("iterator result is not an object"); if (!t.done) return t; u = t.value, c < 2 && (c = 0); } else 1 === c && (t = i["return"]) && t.call(i), c < 2 && (u = TypeError("The iterator does not provide a '" + o + "' method"), c = 1); i = e; } else if ((t = (y = G.n < 0) ? u : r.call(n, G)) !== a) break; } catch (t) { i = e, c = 1, u = t; } finally { f = 1; } } return { value: t, done: y }; }; }(r, o, i), !0), u; } var a = {}; function Generator() {} function GeneratorFunction() {} function GeneratorFunctionPrototype() {} t = Object.getPrototypeOf; var c = [][n] ? t(t([][n]())) : (_regeneratorDefine2(t = {}, n, function () { return this; }), t), u = GeneratorFunctionPrototype.prototype = Generator.prototype = Object.create(c); function f(e) { return Object.setPrototypeOf ? Object.setPrototypeOf(e, GeneratorFunctionPrototype) : (e.__proto__ = GeneratorFunctionPrototype, _regeneratorDefine2(e, o, "GeneratorFunction")), e.prototype = Object.create(u), e; } return GeneratorFunction.prototype = GeneratorFunctionPrototype, _regeneratorDefine2(u, "constructor", GeneratorFunctionPrototype), _regeneratorDefine2(GeneratorFunctionPrototype, "constructor", GeneratorFunction), GeneratorFunction.displayName = "GeneratorFunction", _regeneratorDefine2(GeneratorFunctionPrototype, o, "GeneratorFunction"), _regeneratorDefine2(u), _regeneratorDefine2(u, o, "Generator"), _regeneratorDefine2(u, n, function () { return this; }), _regeneratorDefine2(u, "toString", function () { return "[object Generator]"; }), (_regenerator = function _regenerator() { return { w: i, m: f }; })(); }
function _regeneratorDefine2(e, r, n, t) { var i = Object.defineProperty; try { i({}, "", {}); } catch (e) { i = 0; } _regeneratorDefine2 = function _regeneratorDefine(e, r, n, t) { function o(r, n) { _regeneratorDefine2(e, r, function (e) { return this._invoke(r, n, e); }); } r ? i ? i(e, r, { value: n, enumerable: !t, configurable: !t, writable: !t }) : e[r] = n : (o("next", 0), o("throw", 1), o("return", 2)); }, _regeneratorDefine2(e, r, n, t); }
function asyncGeneratorStep(n, t, e, r, o, a, c) { try { var i = n[a](c), u = i.value; } catch (n) { return void e(n); } i.done ? t(u) : Promise.resolve(u).then(r, o); }
function _asyncToGenerator(n) { return function () { var t = this, e = arguments; return new Promise(function (r, o) { var a = n.apply(t, e); function _next(n) { asyncGeneratorStep(a, r, o, _next, _throw, "next", n); } function _throw(n) { asyncGeneratorStep(a, r, o, _next, _throw, "throw", n); } _next(void 0); }); }; }
function _slicedToArray(r, e) { return _arrayWithHoles(r) || _iterableToArrayLimit(r, e) || _unsupportedIterableToArray(r, e) || _nonIterableRest(); }
function _nonIterableRest() { throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); }
function _unsupportedIterableToArray(r, a) { if (r) { if ("string" == typeof r) return _arrayLikeToArray(r, a); var t = {}.toString.call(r).slice(8, -1); return "Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t ? Array.from(r) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? _arrayLikeToArray(r, a) : void 0; } }
function _arrayLikeToArray(r, a) { (null == a || a > r.length) && (a = r.length); for (var e = 0, n = Array(a); e < a; e++) n[e] = r[e]; return n; }
function _iterableToArrayLimit(r, l) { var t = null == r ? null : "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"]; if (null != t) { var e, n, i, u, a = [], f = !0, o = !1; try { if (i = (t = t.call(r)).next, 0 === l) { if (Object(t) !== t) return; f = !1; } else for (; !(f = (e = i.call(t)).done) && (a.push(e.value), a.length !== l); f = !0); } catch (r) { o = !0, n = r; } finally { try { if (!f && null != t["return"] && (u = t["return"](), Object(u) !== u)) return; } finally { if (o) throw n; } } return a; } }
function _arrayWithHoles(r) { if (Array.isArray(r)) return r; }
import { __jacJsx, __jacSpawn } from "@jac-client/utils";
import { useState } from "react";
function render_diagnosis_results(current_diagnosis) {
  if (!current_diagnosis || Object.keys(current_diagnosis).length === 0) {
    return __jacJsx("div", {}, []);
  }
  return __jacJsx("div", {
    "style": {
      "marginTop": "32px",
      "padding": "24px",
      "backgroundColor": "#f0fdf4",
      "borderRadius": "12px",
      "border": "2px solid #22543d"
    }
  }, [__jacJsx("h2", {
    "style": {
      "fontSize": "24px",
      "fontWeight": "700",
      "color": "#22543d",
      "marginBottom": "16px"
    }
  }, ["🌾 Diagnosis Results"]), __jacJsx("div", {
    "style": {
      "marginBottom": "16px"
    }
  }, [__jacJsx("p", {
    "style": {
      "fontWeight": "600",
      "color": "#2d3748"
    }
  }, ["Disease: ", __jacJsx("span", {
    "style": {
      "color": "#22543d"
    }
  }, [current_diagnosis.disease_name])]), __jacJsx("p", {
    "style": {
      "fontWeight": "600",
      "color": "#2d3748"
    }
  }, ["Confidence: ", __jacJsx("span", {
    "style": {
      "color": "#22543d"
    }
  }, [current_diagnosis.confidence * 100, "%"])])]), __jacJsx("div", {
    "style": {
      "marginBottom": "16px"
    }
  }, [__jacJsx("h3", {
    "style": {
      "fontWeight": "600",
      "color": "#2d3748",
      "marginBottom": "8px"
    }
  }, ["📋 Symptoms Analysis:"]), __jacJsx("p", {
    "style": {
      "color": "#4a5568"
    }
  }, [current_diagnosis.symptoms_analysis])]), __jacJsx("div", {
    "style": {
      "marginBottom": "16px"
    }
  }, [__jacJsx("h3", {
    "style": {
      "fontWeight": "600",
      "color": "#2d3748",
      "marginBottom": "8px"
    }
  }, ["💊 Recommended Treatments:"]), __jacJsx("p", {
    "style": {
      "color": "#4a5568"
    }
  }, [String(current_diagnosis.recommended_treatments)])]), __jacJsx("div", {
    "style": {
      "marginBottom": "16px"
    }
  }, [__jacJsx("h3", {
    "style": {
      "fontWeight": "600",
      "color": "#2d3748",
      "marginBottom": "8px"
    }
  }, ["⚠️ Prevention Advice:"]), __jacJsx("p", {
    "style": {
      "color": "#4a5568"
    }
  }, [current_diagnosis.prevention_advice])]), __jacJsx("div", {
    "style": {
      "marginBottom": "16px"
    }
  }, [__jacJsx("h3", {
    "style": {
      "fontWeight": "600",
      "color": "#2d3748",
      "marginBottom": "8px"
    }
  }, ["🌍 Regional Context:"]), __jacJsx("p", {
    "style": {
      "color": "#4a5568"
    }
  }, [current_diagnosis.regional_context])]), __jacJsx("div", {
    "style": {
      "marginBottom": "16px"
    }
  }, [__jacJsx("h3", {
    "style": {
      "fontWeight": "600",
      "color": "#2d3748",
      "marginBottom": "8px"
    }
  }, ["📈 Market Intelligence:"]), __jacJsx("p", {
    "style": {
      "color": "#4a5568"
    }
  }, [current_diagnosis.market_intelligence])])]);
}
function app() {
  var _useState = useState({}),
    _useState2 = _slicedToArray(_useState, 2),
    current_diagnosis = _useState2[0],
    setDiagnosis = _useState2[1];
  var _useState3 = useState(false),
    _useState4 = _slicedToArray(_useState3, 2),
    is_loading = _useState4[0],
    setIsLoading = _useState4[1];
  var _useState5 = useState("en"),
    _useState6 = _slicedToArray(_useState5, 2),
    selected_language = _useState6[0],
    setLanguage = _useState6[1];
  function convertFileToBase64Helper(_x) {
    return _convertFileToBase64Helper.apply(this, arguments);
  }
  function _convertFileToBase64Helper() {
    _convertFileToBase64Helper = _asyncToGenerator(/*#__PURE__*/_regenerator().m(function _callee(file) {
      var eval_code;
      return _regenerator().w(function (_context) {
        while (1) switch (_context.n) {
          case 0:
            if (!window.convertFileToBase64) {
              eval_code = "window.convertFileToBase64 = function(file) { return new Promise(function(resolve, reject) { var reader = new FileReader(); reader.onload = function(e) { var r = e.target.result; if (r.indexOf(',') > 0) r = r.split(',')[1]; resolve(r); }; reader.onerror = reject; reader.readAsDataURL(file); }); };";
              eval(eval_code);
            }
            _context.n = 1;
            return window.convertFileToBase64(file);
          case 1:
            return _context.a(2, _context.v);
        }
      }, _callee);
    }));
    return _convertFileToBase64Helper.apply(this, arguments);
  }
  function processDiagnosisResponse(_x2) {
    return _processDiagnosisResponse.apply(this, arguments);
  }
  function _processDiagnosisResponse() {
    _processDiagnosisResponse = _asyncToGenerator(/*#__PURE__*/_regenerator().m(function _callee2(data) {
      var err_str, retry_match, wait_time, report_data;
      return _regenerator().w(function (_context2) {
        while (1) switch (_context2.n) {
          case 0:
            console.log("Spawn response received:", data);
            if (!(data && data.error)) {
              _context2.n = 1;
              break;
            }
            console.error("Backend Error:", data.error);
            err_str = String(data.error);
            if (err_str.includes("RateLimitError")) {
              retry_match = err_str.match("Please retry in ([0-9.]+)s");
              if (retry_match) {
                wait_time = Math.ceil(parseFloat(retry_match[1]));
                alert("\u26A0\uFE0F AI Service Busy: Rate limit exceeded. Please wait " + wait_time + " seconds and try again.");
              } else {
                alert("\u26A0\uFE0F AI Service Busy: Rate limit exceeded. Please wait a minute and try again.");
              }
            } else {
              alert("\u274C Diagnosis Failed: " + err_str);
            }
            setIsLoading(false);
            return _context2.a(2);
          case 1:
            if (data && data.reports && data.reports.length > 0) {
              report_data = data.reports[0];
              console.log("Extracted report data:", report_data);
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
            setIsLoading(false);
            console.log("Diagnosis complete.");
            alert("Diagnosis received! Check console for results");
          case 2:
            return _context2.a(2);
        }
      }, _callee2);
    }));
    return _processDiagnosisResponse.apply(this, arguments);
  }
  function onDiagnosisSubmit(_x3) {
    return _onDiagnosisSubmit.apply(this, arguments);
  }
  function _onDiagnosisSubmit() {
    _onDiagnosisSubmit = _asyncToGenerator(/*#__PURE__*/_regenerator().m(function _callee3(e) {
      var crop_type, symptoms_text, region_name, plant_media_input, image_base64, image_file, data;
      return _regenerator().w(function (_context3) {
        while (1) switch (_context3.n) {
          case 0:
            e.preventDefault();
            setIsLoading(true);
            setDiagnosis({});
            console.log("Starting diagnosis...");
            crop_type = document.getElementById("cropType").value;
            symptoms_text = document.getElementById("imageDescription").value;
            region_name = document.getElementById("regionName").value;
            plant_media_input = document.getElementById("plantMedia");
            if (!(!crop_type || !symptoms_text)) {
              _context3.n = 1;
              break;
            }
            alert("Please select a crop and describe the symptoms");
            setIsLoading(false);
            return _context3.a(2);
          case 1:
            image_base64 = "";
            if (!(plant_media_input && plant_media_input.files && plant_media_input.files.length > 0)) {
              _context3.n = 3;
              break;
            }
            image_file = plant_media_input.files[0];
            console.log("Image file detected:", image_file.name);
            _context3.n = 2;
            return convertFileToBase64Helper(image_file);
          case 2:
            image_base64 = _context3.v;
          case 3:
            console.log("About to spawn ExecutorAgent...");
            _context3.n = 4;
            return __jacSpawn("ExecutorAgent", "", {
              "crop_type": crop_type,
              "symptoms_text": symptoms_text,
              "image_base64": image_base64,
              "image_description": symptoms_text,
              "region_name": region_name
            });
          case 4:
            data = _context3.v;
            processDiagnosisResponse(data);
          case 5:
            return _context3.a(2);
        }
      }, _callee3);
    }));
    return _onDiagnosisSubmit.apply(this, arguments);
  }
  return __jacJsx("div", {
    "style": {
      "minHeight": "100vh",
      "backgroundColor": "#f0fdf4",
      "padding": "20px",
      "fontFamily": "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif"
    }
  }, [__jacJsx("div", {
    "style": {
      "maxWidth": "800px",
      "margin": "0 auto",
      "backgroundColor": "white",
      "borderRadius": "16px",
      "boxShadow": "0 4px 6px rgba(0, 0, 0, 0.1)",
      "padding": "32px"
    }
  }, [__jacJsx("div", {
    "style": {
      "textAlign": "center",
      "marginBottom": "32px"
    }
  }, [__jacJsx("h1", {
    "style": {
      "fontSize": "36px",
      "fontWeight": "700",
      "color": "#22543d",
      "marginBottom": "8px"
    }
  }, ["🌱 Bustani Buddy"]), __jacJsx("p", {
    "style": {
      "fontSize": "18px",
      "color": "#4a5568",
      "marginBottom": "16px"
    }
  }, ["AI-Powered Crop Disease Diagnosis"]), __jacJsx("div", {
    "style": {
      "marginTop": "16px"
    }
  }, [__jacJsx("button", {
    "onClick": function onClick() {
      setLanguage("en");
      console.log("Language changed to: en");
    },
    "style": {
      "padding": "8px 16px",
      "margin": "0 4px",
      "border": "2px solid #22543d",
      "borderRadius": "8px",
      "cursor": "pointer",
      "fontWeight": "600",
      "backgroundColor": "#22543d",
      "color": "white"
    }
  }, ["English"]), __jacJsx("button", {
    "onClick": function onClick() {
      setLanguage("sw");
      console.log("Language changed to: sw");
    },
    "style": {
      "padding": "8px 16px",
      "margin": "0 4px",
      "border": "2px solid #22543d",
      "borderRadius": "8px",
      "cursor": "pointer",
      "fontWeight": "600",
      "backgroundColor": "#e2e8f0",
      "color": "#2d3748"
    }
  }, ["Kiswahili"])])]), __jacJsx("form", {
    "id": "diagnosisForm",
    "onSubmit": onDiagnosisSubmit
  }, [__jacJsx("div", {
    "style": {
      "marginBottom": "20px"
    }
  }, [__jacJsx("label", {
    "style": {
      "display": "block",
      "marginBottom": "8px",
      "fontWeight": "600",
      "color": "#2d3748"
    }
  }, ["Select Your Crop:"]), __jacJsx("select", {
    "id": "cropType",
    "style": {
      "width": "100%",
      "padding": "12px",
      "fontSize": "16px",
      "border": "2px solid #e2e8f0",
      "borderRadius": "8px",
      "backgroundColor": "white",
      "cursor": "pointer"
    }
  }, [__jacJsx("option", {
    "value": "maize"
  }, ["Maize"]), __jacJsx("option", {
    "value": "beans"
  }, ["Beans"]), __jacJsx("option", {
    "value": "tomatoes"
  }, ["Tomatoes"]), __jacJsx("option", {
    "value": "cabbage"
  }, ["Cabbage"]), __jacJsx("option", {
    "value": "kale"
  }, ["Kale"]), __jacJsx("option", {
    "value": "potatoes"
  }, ["Potatoes"])])]), __jacJsx("div", {
    "style": {
      "marginBottom": "20px"
    }
  }, [__jacJsx("label", {
    "style": {
      "display": "block",
      "marginBottom": "8px",
      "fontWeight": "600",
      "color": "#2d3748"
    }
  }, ["Describe What You See on the Plant:"]), __jacJsx("textarea", {
    "id": "imageDescription",
    "rows": "3",
    "placeholder": "e.g., Yellow spots on leaves, brown edges, wilting...",
    "style": {
      "width": "100%",
      "padding": "12px",
      "fontSize": "16px",
      "border": "2px solid #e2e8f0",
      "borderRadius": "8px",
      "resize": "vertical",
      "minHeight": "80px"
    }
  }, [])]), __jacJsx("div", {
    "style": {
      "marginBottom": "20px"
    }
  }, [__jacJsx("label", {
    "style": {
      "display": "block",
      "marginBottom": "8px",
      "fontWeight": "600",
      "color": "#2d3748"
    }
  }, ["Region (Optional):"]), __jacJsx("select", {
    "id": "regionName",
    "style": {
      "width": "100%",
      "padding": "12px",
      "fontSize": "16px",
      "border": "2px solid #e2e8f0",
      "borderRadius": "8px",
      "backgroundColor": "white",
      "cursor": "pointer"
    }
  }, [__jacJsx("option", {
    "value": "Central Kenya"
  }, ["Central Kenya"]), __jacJsx("option", {
    "value": "Western Kenya"
  }, ["Western Kenya"]), __jacJsx("option", {
    "value": "Eastern Kenya"
  }, ["Eastern Kenya"]), __jacJsx("option", {
    "value": "Rift Valley"
  }, ["Rift Valley"]), __jacJsx("option", {
    "value": "Coast"
  }, ["Coast"]), __jacJsx("option", {
    "value": "Nyanza"
  }, ["Nyanza"])])]), __jacJsx("div", {
    "style": {
      "marginBottom": "20px"
    }
  }, [__jacJsx("label", {
    "style": {
      "display": "block",
      "marginBottom": "8px",
      "fontWeight": "600",
      "color": "#2d3748"
    }
  }, ["Upload Image or Video of the Plant:"]), __jacJsx("input", {
    "type": "file",
    "id": "plantMedia",
    "accept": "image/*,video/*",
    "capture": "environment",
    "style": {
      "width": "100%",
      "padding": "12px",
      "fontSize": "16px",
      "border": "2px solid #e2e8f0",
      "borderRadius": "8px",
      "backgroundColor": "white",
      "cursor": "pointer"
    }
  }, []), __jacJsx("p", {
    "style": {
      "marginTop": "8px",
      "fontSize": "14px",
      "color": "#718096"
    }
  }, ["📸 Take a photo or 📹 record a video, or choose from gallery"])]), __jacJsx("button", {
    "type": "submit",
    "style": {
      "width": "100%",
      "padding": "16px",
      "fontSize": "18px",
      "fontWeight": "700",
      "backgroundColor": "#22543d",
      "color": "white",
      "border": "none",
      "borderRadius": "8px",
      "cursor": "pointer"
    }
  }, ["Diagnose Disease"])]), render_diagnosis_results(current_diagnosis)])]);
}
export { app, render_diagnosis_results };