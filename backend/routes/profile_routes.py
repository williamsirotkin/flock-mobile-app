from flask import Flask, Blueprint, request
import json
from bson import json_util, ObjectId
from db import db  

profile = Blueprint("profile", __name__, url_prefix="/profile")

@profile.route("/")
def profile_home():
    return "This is the profile routes"

@profile.route("/get/<string:id>", methods=['GET'])
def get_profile(id):
    
    id = ObjectId(id)

    data = db.profile.find_one(id)

    return json.loads(json_util.dumps(data))

    
    


