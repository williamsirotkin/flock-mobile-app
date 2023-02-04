from flask import Flask, Blueprint, request
import json
from bson import json_util
from db import db  

profile = Blueprint("profile", __name__, url_prefix="/profile")
users = db.profile

@profile.route("/")
def profile_home():
    return "This is the profile routes"

@profile.route("/get/<string:first_name>", methods=['GET'])
def get_profile(first_name):
    data = users.find_one({'first_name' : 'Stephen'})

    data_list = list(data)

    return json.dumps(data_list)
    


