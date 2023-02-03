from flask import Flask, Blueprint

from db import db  

profile = Blueprint("profile", __name__, url_prefix="/profile")

profile.route("/")
def home():
    return "This is the profile routes"
