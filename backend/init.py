
from flask import Flask, Blueprint

def create_app():

    app = Flask(__name__)        

    with app.app_context():
        from routes.profile_routes import profile
        from routes.trip_routes import trip
        app.register_blueprint(profile)
        app.register_blueprint(trip)
    return app