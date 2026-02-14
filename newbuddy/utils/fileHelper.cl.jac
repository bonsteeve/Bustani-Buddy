"""
File Helper Utilities
Utilities for file processing, including base64 conversion
"""

async def:pub convertFileToBase64(file: any) -> str {
    """
    Convert a file to base64 string
    
    Args:
        file: File object from file input
        
    Returns:
        Base64 encoded string (without data URI prefix)
    """
    
    # Initialize the conversion function if it doesn't exist
    if not window.convertFileToBase64Helper {
        eval_code = "window.convertFileToBase64Helper = function(file) { return new Promise(function(resolve, reject) { var reader = new FileReader(); reader.onload = function(e) { var r = e.target.result; if (r.indexOf(',') > 0) r = r.split(',')[1]; resolve(r); }; reader.onerror = reject; reader.readAsDataURL(file); }); };";
        eval(eval_code);
    }
    
    # Use the function
    return await window.convertFileToBase64Helper(file);
}
