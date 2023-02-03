from flask import Flask, Blueprint

from db import db  

profile = Blueprint("trips", __name__, url_prefix="/trips")

profile.route("/")
def home():
    return "This is the trips routes"
