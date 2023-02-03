from flask import Flask
from init import create_app

app = create_app()

app.route("/")
def home():
    return "this is the home page"

if __name__ == "__main__":
    app.run()