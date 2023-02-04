from flask import Flask, Blueprint, request
import json
from bson import json_util, ObjectId
from db import db  

profile = Blueprint("profile", __name__, url_prefix="/profile")

@profile.route("/")
def profile_home():
    return "This is the profile routes"

@profile.route("/get/<string:username>", methods=['GET'])
def get_profile(username):

    data = db.profile.find_one({'username' : username})
    return json.loads(json_util.dumps(data))

@profile.route("/add", methods=['POST'])
def add_profile():
    username = request
    
    


