
from flask import Flask, render_template, redirect, url_for
from init import create_app

app = create_app()

@app.route('/')
def home():
    return "This is the homepage of our backend"

if __name__ == "__main__":
    app.run()