from flask import Flask, Blueprint, request
import json

from db import db  

profile = db.profile

profile = Blueprint("profile", __name__, url_prefix="/profile")

@profile.route("/")
def profile_home():
    return "This is the profile routes"

@profile.route("/get/<int:profileId>")
def getProfile(profileId):
    user = profile.find_one({"_id" : request['_id']})
    return json.dumps(user)



