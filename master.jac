import std;
import byllm;

walker init_test {
    can execute {
        has api_key_check: str = std.env.get("GEMINI_API_KEY");
        
        if (api_key_check) {
            std.out("SUCCESS: GEMINI_API_KEY found! Environment is READY.");
        } else {
            std.out("ERROR: GEMINI_API_KEY NOT found. Please set the GEMINI_API_KEY environment variable.");
            return; 
        }
        
        std.out("Testing byllm kit...");
        
        has prompt: str = "Tunga salamu fupi katika Kiswahili kwa ajili ya Bustani Buddy.";
        has model_name: str = "gemini-2.5-flash";
        
        has greeting: str = byllm.generate(prompt=prompt, model=model_name);
        
        std.out("\n--- AI Greeting Test ---");
        std.out("Prompt: " + prompt);
        std.out("Response: " + greeting);
        std.out("----------------------\n");
    }
}