from flask import Flask, Blueprint

trip = Blueprint("trip", __name__, url_prefix="/trip")

@trip.route("/")
def trip_home():
    return "This is the homepage for trips"