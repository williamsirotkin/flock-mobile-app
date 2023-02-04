from flask import Flask, Blueprint, request, Response

from db import db

req = Blueprint("req", __name__, url_prefix="/request")

@req.route("/")
def req_home():
    return "This is the homepage for requests"

@req.route("/request_to_join", methods=['PUT'])
def request_to_join():

    data = request.json
    new_request = {
        "joinees_username" : data['joinees_username'],
        "leaders_username" : data['leaders_username'],
        "trip_name" : data['name'],
    }

    try:
        db.requestToJoin.insert_one(new_request)
        db.trips.update_one({'leader' : data['leaders_username']}, {'$push' : {'list_of_requests' : data['joinees_username']}})
        return Response(status=200)
    except:
        return Response(status=403)
    
@req.route("/accept", methods=['PUT'])
def accept():
    
    data = request.json

    username = data['joinee_username']
    trip = data['name']

    try:
        db.trips.update_one({"name" : trip}, {'$push' : {'list_of_users' : username}})
        db.requestToJoin.delete_one(data)
        return Response(status=200)
    except:
        return Response(status=403)

@req.route("/remove", methods=['PUT'])
def remove():

    data = request.json
    username = data['joinee_username']
    trip = data['name']
    try:
        db.trips.update_one({"name" : trip}, {'$pull' : {'list_of_users' : username}})
        return Response(status=200)
    except:
        return Response(status=403)
