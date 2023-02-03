from flask import Flask, Blueprint
import certifi


def create_app():
    app = Flask(__name__)

    return app