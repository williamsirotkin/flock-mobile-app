import certifi
import os
from flask_pymongo import PyMongo
MONGO_URI = os.environ['MONGO_URI']
mongo = PyMongo(MONGO_URI)
db = mongo.db