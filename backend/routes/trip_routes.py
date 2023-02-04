from flask import Flask, Blueprint, request
import json
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