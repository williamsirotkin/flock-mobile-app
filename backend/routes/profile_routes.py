from flask import Flask, Blueprint, request
import json
from bson import json_util, ObjectId
from db import db
import random  

profile = Blueprint("profile", __name__, url_prefix="/profile")

@profile.route("/")
def profile_home():
    return "This is the profile routes"

@profile.route("/getRandomUsername", methods = ['GET'])
def get_random_username():
    data = db.profile.find({}, {"username" : True})
    return json.loads(json_util.dumps(random.choice(list(data))))

@profile.route("/get/<string:username>", methods=['GET'])
def get_profile(username):

    data = db.profile.find_one({'username' : username})
    return json.loads(json_util.dumps(data))

@profile.route("/add", methods=['POST'])
def add_profile():
    username = request
    
    


