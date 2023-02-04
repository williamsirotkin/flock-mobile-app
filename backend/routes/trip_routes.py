from flask import Flask, Blueprint, request, Response, jsonify
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
    try:
        data = db.trips.find_one({'name': name})
        return json.loads(json_util.dumps(data))
        return Respone(status=200)
    except:
        return Response(status=403)

@trip.route("/get_recommended/<string:username>", methods=['GET'])
def get_recommended_trip(username):
    print(username)
    data = db.profile.find_one({"username" : username})
    list_of_likes = data['liker']
    print(list_of_likes)
    recommended_trips = set()

    for like in list_of_likes:
        profile = db.profile.find_one({"username" : like})
        recommended_trips.update(profile['my_trips'])
    
    return jsonify(list(recommended_trips))

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
        "requirements" : data['requirements'],
        "description" : data['description'],
        "estimated_cost" : data['estimated_cost'],
        "start_date" : data['start_date'],
        "end_date" : data['end_date'],
        "list_of_request" : []
    }

    try:
        db.trips.insert_one(trip)
        db.profile.update_one({'username' : data['username']}, {'$push' : {'my_trips' : data['name']}})
        return Response(status=201)
    except:
        return Response(status=403)
