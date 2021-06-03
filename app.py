import numpy as np
import random, json

#################################################
# Database Setup
#################################################
#from sqlalchemy import create_engine
import psycopg2 as pg
import pandas.io.sql as psql
import matplotlib.pyplot as plt
import matplotlib.pyplot as plt2
import numpy as np
from sqlalchemy import create_engine, func, extract
from sqlalchemy.orm import Session


# import necessary libraries
from models import create_classes
import os
from flask import (
    Flask,
    render_template,
    jsonify,
    request,
    redirect)

#################################################
# Flask Setup
#################################################
app = Flask(__name__)

#################################################
# Database Setup
#################################################

from flask_sqlalchemy import SQLAlchemy
app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URL', '') or "sqlite:///db.sqlite"

# Remove tracking modifications
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

Pet = create_classes(db)

# create route that renders index.html template
@app.route("/")
def home():
    return render_template("index.html")


@app.route('/api/v1.0/locationData', methods=['GET','POST'])       
def locationData():
  # connect to Postgres Domestioc Violence database
  connection = create_engine('postgresql://ikrqwnaviefoab:1599ac91e297d9bf0bc9299178d8113ac864f2fabf0004cbbaf0fcc9fb43d981@ec2-34-232-191-133.compute-1.amazonaws.com/d68b0k11d6t4uq')
  # make a connection
  session = Session(connection)

  location = psql.read_sql('select id,location from location order by 1', connection)
   # Close the database connection session
  session.close()

  location = location.to_json()
  return location


@app.route('/api/v1.0/premiseData', methods=['GET','POST'])       
def premiseData():
  # connect to Postgres Domestioc Violence database
  connection = create_engine('postgresql://ikrqwnaviefoab:1599ac91e297d9bf0bc9299178d8113ac864f2fabf0004cbbaf0fcc9fb43d981@ec2-34-232-191-133.compute-1.amazonaws.com/d68b0k11d6t4uq')
  # make a connection
  session = Session(connection)

  premise = psql.read_sql('select id,premise from premise order by 1', connection)
   # Close the database connection session
  session.close()

  premise = premise.to_json()
  return premise



# Query the database and send the jsonified results
@app.route("/send", methods=["GET", "POST"])
def send():
    if request.method == "POST":
        name = request.form["petName"]
        lat = request.form["petLat"]
        lon = request.form["petLon"]

        pet = Pet(name=name, lat=lat, lon=lon)
        db.session.add(pet)
        db.session.commit()
        return redirect("/", code=302)

    return render_template("form.html")


@app.route("/api/pals")
def pals():
    results = db.session.query(Pet.name, Pet.lat, Pet.lon).all()

    hover_text = [result[0] for result in results]
    lat = [result[1] for result in results]
    lon = [result[2] for result in results]

    pet_data = [{
        "type": "scattergeo",
        "locationmode": "USA-states",
        "lat": lat,
        "lon": lon,
        "text": hover_text,
        "hoverinfo": "text",
        "marker": {
            "size": 50,
            "line": {
                "color": "rgb(8,8,8)",
                "width": 1
            },
        }
    }]

    return jsonify(pet_data)


if __name__ == "__main__":
    app.run()
