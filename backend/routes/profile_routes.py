from flask import Flask, Blueprint, request, Response
import json
from bson import json_util, ObjectId
from db import db  
import random

#ph = PasswordHasher()

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

@profile.route("getProfiles/<string:username>", methods = ['GET'])
def get_profiles(username):
    data = db.profile.find_one({'username': username})
    data2 = list(data['liker']) + list(data['hater'])
    #print(data2)
    data4 = list()

    data3 = db.profile.find({'username': {'$nin': data2}})
    for d in data3:
        data4.append(d["username"])
    
    #print(data4)
    return data4

#queries users based on certain input conditions
@profile.route("/getProfileQuery", methods = ['GET'])
def get_profile_query(age_min, age_max):

    data = db.profile.find({'age': {'$gte': age_min}, 'age': {'$lte': age_max}})
    return json.loads(json_util.dumps(random.choice(list(data))))


@profile.route("/add", methods=['POST'])
def add_profile():
    data = request.json
    #print(data)
    user = {
        'first_name' : data['first_name'],
        'city' : data['city'],
        'country' : data['country'],
        'email' : data['email'],
        'interests' : data['interests'],
        'last_name' : data['last_name'],
        'social_media' : [],
        'username' : data['username'],
        'age' : data['age'],
        'bio' : data['bio'],
        'profile_pic_url' : data['profile_pic_url'],
        'liker' : [],
        'hater' : [],
        'password' : data['password']
    }

    db.profile.insert_one(user)
    return Response(status=201)

@profile.route("/like", methods=['PUT'])
def like():
    data = request.json

    liker = data['liker']
    likee = data['likee']

    try:
        db.profile.update_one({'username' : liker}, {'$push' : {'liker' : likee}})
        return Response(status=200)
    except:
        return Response(status=403)

@profile.route("/hate", methods=['PUT'])    
def hate():
    data = request.json

    hater = data['hater']
    hatee = data['hatee']

    try:
        db.profile.update_one({'username' : hater}, {'$push' : {'hater' : hatee}})
        return Response(status=200)
    except:
        return Response(status=403)


@profile.route("/login", methods=['PUT'])
def login():
    data = request.json
    username = data['username']
    password = data['password']
    user = db.profile.find_one({'username' : username})

    if password == user['password']:
        return Response(status=200)
    else:
        return Response(status=403)









