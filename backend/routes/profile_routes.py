from flask import Flask, Blueprint, request, Response
import json
from bson import json_util, ObjectId
from db import db  
import random
#import argon2

profile = Blueprint("profile", __name__, url_prefix="/profile")

@profile.route("/")
def profile_home():
    return "This is the profile routes"

@profile.route("/get/<string:username>", methods=['GET'])
def get_profile(username):

    data = db.profile.find_one({'username' : username})
    return json.loads(json_util.dumps(data))

@profile.route("/getRandomUsername", methods = ['GET'])
def get_random_username():
    data = db.profile.find({}, {"username" : True})
    return json.loads(json_util.dumps(random.choice(list(data))))

#queries users based on certain input conditions
@profile.route("/getProfileQuery", method = ['GET'])
def get_profile_query(age_min, age_max):

    data = db.profile.find({'age': {'$gte': age_min}, 'age': {'$lte': age_max}})
    return json.loads(json_util.dumps(random.choice(list(data))))


@profile.route("/add", methods=['POST'])
def add_profile():
    data = request.json
    user = {
        "first_name" : data['first_name'],
        "last_name" : data['last_name'],
        "email" : data['email']
    }
    db.profile.insert_one(user)
    return Response(status=201)

'''
@profile.route("/login")
def login():
    data = request.json
    username = data['username']
    password = data['password']
    user = db.profile.find_one({'username' : username})

    if user['password'] == argon2.hash_password(password):
        return Response(status=200)
    else:
        return Response(status=403)
'''








