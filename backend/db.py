import certifi
import os
from pymongo import MongoClient

client = MongoClient("mongodb+srv://marc_silverman:Flockapp69@cluster0.i8g2tz1.mongodb.net/?retryWrites=true&w=majority", tlsCAFile=certifi.where())
db = client.flock
