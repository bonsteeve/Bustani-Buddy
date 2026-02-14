"""File Helper Utilities - Base64 conversion for file uploads"""

# Helper function to convert file to base64
async def:pub convertFileToBase64(file: any) -> str {
    if not window.convertFileToBase64Helper {
        eval_code = "window.convertFileToBase64Helper = function(file) { return new Promise(function(resolve, reject) { var reader = new FileReader(); reader.onload = function(e) { var r = e.target.result; if (r.indexOf(',') > 0) r = r.split(',')[1]; resolve(r); }; reader.onerror = reject; reader.readAsDataURL(file); }); };";
        eval(eval_code);
    }
    return await window.convertFileToBase64Helper(file);
}
