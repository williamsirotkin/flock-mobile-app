from flask import Flask, Blueprint, request, Response
import json
from bson import json_util, ObjectId
from db import db  
import random

profile = Blueprint("profile", __name__, url_prefix="/profile")

@profile.route("/")
def profile_home():
    return "This is the profile routes"

@profile.route("/get/<string:username>", methods=['GET'])
def get_profile(username):

    data = db.profile.find_one({'username' : username})
    return data

@profile.route("/getRandomUsername", methods = ['GET'])
def get_random_username():
    data = db.profile.find({}, {"username" : True})
    return json.loads(json_util.dumps(random.choice(list(data))))

@profile.route("/add", methods=['POST'])
def add_profile():
    data = request.json
    user = {
        "first_name" : data['first_name'],
        "last_name" : data['last_name'],
        "email" : data['email']
    }
    db.profile.save(user)
    return Response(status=201)

@profile.route("/login")
def login():

    data = request.json
    username = data['username']
    password = data['password']
    user = db.profile.find_one({'username' : username})

    if password == argon2.hash_password(password):
        return Response(status=200)
    else:
        return Response(status=403)








