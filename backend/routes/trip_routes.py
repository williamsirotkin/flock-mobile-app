from flask import Flask, Blueprint, request, Response
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

@trip.route('/update_itinerary')
def update_itinerary():
    data = request.json

    
@trip.route("/add")
def add_to_trip():
    data = request.json

    trip = data['name']
    username = data['username']

    try:
        db.trips.update_one({'name' : trip}, {'$push' : {'list_of_users': username}})
        return Response(200)
    except:
        return Response(403)

@trip.route("/create")
def create_trip():
    data = request.json

    trip = {
        "name" : data['name'],
        "max_number" : data['max_number'],
        "current_number" : data['current_number'],
        "list_of_users" : data['list_of_users'],
        "leader" : data['leader'],
        "destination" : data['destination'],
        "itinerary" : data['itinerary'],
        "requirments" : data['requirements'],
        "description" : data['description']
    }

    try:
        db.trips.insert_one(trip)
        return Response(status=201)
    except:
        return Response(status=403)
