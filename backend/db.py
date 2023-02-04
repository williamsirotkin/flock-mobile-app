import certifi
import os
from pymongo import MongoClient

MONGO_URI = os.environ['MONGO_URI']
client = MongoClient(MONGO_URI, certifi.where())
db = client.db