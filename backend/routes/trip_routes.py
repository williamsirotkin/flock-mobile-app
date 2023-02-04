from flask import Flask, Blueprint, request
import json
<<<<<<< Updated upstream
from bson import json_util
from db import db 

trip = Blueprint("trip", __name__, url_prefix="/trip")
trips = db.trip

@trip.route("/")
def trip_home():
    return "This is the profile routes"

@trip.route("/get/<string:state>", methods=['GET'])
def get_trip(state):
    data = db.trip.find_one({'state': state})
    return json.loads(json_util.dumps(data))
=======
from db import db
from bson import json_util

trip = db.trip

trip = Blueprint("trip", __name__, url_prefix="/trip")


@trip.route("/")
def trip_home():
    return "This is the homepage for trips"

@trip.route("/get/<str:California>")
def getTrip(state):
    trip = trip.find_one({"state" : 'California'})

    return json.loads(json.util.dumps(trip))
>>>>>>> Stashed changes
