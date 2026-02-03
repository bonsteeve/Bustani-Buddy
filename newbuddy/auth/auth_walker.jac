"""
Authentication Walker
Handles user login with in-memory user storage (MVP)
"""

# In-memory user storage (for MVP testing)
# In production, this would be replaced with database queries
glob USERS = {
    "farmer@bustani.com": {
        "email": "farmer@bustani.com",
        "password": "farm@9876",
        "name": "Bonface Farmer"
    },
    "admin@bustani.com": {
        "email": "admin@bustani.com", 
        "password": "admin123",
        "name": "Admin User"
    },
    "test@bustani.com": {
        "email": "test@bustani.com",
        "password": "test123",
        "name": "Test User"
    }
};

walker:pub LoginWalker {
    has email: str;
    has password: str;
    
    can login with `root entry {
        # Validate inputs
        if not self.email or not self.password {
            report {
                "success": False,
                "error": "Email and password are required"
            };
            return;
        }
        
        # Check if user exists
        if self.email not in USERS {
            report {
                "success": False,
                "error": "Invalid email or password"
            };
            return;
        }
        
        # Verify password
        user = USERS[self.email];
        if user["password"] != self.password {
            report {
                "success": False,
                "error": "Invalid email or password"
            };
            return;
        }
        
        # Successful login
        report {
            "success": True,
            "user": {
                "email": user["email"],
                "name": user["name"]
            },
            "message": "Login successful"
        };
    }
}
