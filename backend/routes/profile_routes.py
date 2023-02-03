from flask import Flask, Blueprint

from db import db  

profile = Blueprint("user", __name__, url_prefix="/user")

profile.route("/")
def home():
    return "This is the profile routes"
