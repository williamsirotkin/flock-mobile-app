from flask import Flask, Blueprint, request, Response
import json
from bson import json_util
from db import db 

trip = Blueprint("trip", __name__, url_prefix="/trip")
trips = db.trip

@trip.route("/")
def trip_home():
    return "This is the profile routes"

@trip.route("/get/<string:name>", methods=['GET'])
def get_trip(name):
    data = db.trip.find_one({'name': name})
    return json.loads(json_util.dumps(data))

@trip.route('/update_itinerary')
def update_itinerary():
    data = request.json

    updated_itinerary = data['updated_itinerary']
    trip = data['name']

    try:
        db.trip.update_one({'name' : trip}, {'itinerary' : update_itinerary})
        return Response(status=200)
    except:
        return Response(status=403)
    


@trip.route("/add")
def add_to_trip():
    data = request.json

    trip = data['name']
    username = data['username']

    try:
        db.trips.update_one({'name' : trip}, {'$push' : {'list_of_users': username}})
        return Response(status=200)
    except:
        return Response(status=403)

@trip.route("/create", methods=['POST'])
def create_trip():
    data = request.json

    trip = {
        "name" : data['name'],
        "max_number" : data['max_number'],
        "current_number" : 1,
        "list_of_users" : [data['username']],
        "leader" : data['username'],
        "destination" : data['destination'],
        "itinerary" : data['itinerary'],
        "requirements" : data['requirements'],
        "description" : data['description'],
        "estimated_cost" : data['estimated_cost'],
        "start_date" : data['start_date'],
        "end_date" : data['end_date'],
        "list_of_request" : []
    }

    try:
        db.trips.insert_one(trip)
        return Response(status=201)
    except:
        return Response(status=403)
