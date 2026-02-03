"""
Authentication Schema
Defines User node for the authentication system
"""

node User {
    has email: str;
    has password: str;
    has name: str;
    has created_at: str;
}
