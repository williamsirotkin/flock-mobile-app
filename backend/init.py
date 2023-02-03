from flask import Flask, Blueprint
import certifi

def create_app():
    app = Flask(__name__)  

    from routes.profile_routes import profile
    app.register_blueprint(profile)

    return app