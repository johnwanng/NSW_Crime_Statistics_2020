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
from pickle import dump, load


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
# app.config['SQLALCHEMY_DATABASE_URI'] = 

# Remove tracking modifications
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# connect to Postgres Domestioc Violence database via heroku url or from the hardcoded crdential definitiomns
URI = os.environ.get('DATABASE_URL', '') or 'postgresql://ikrqwnaviefoab:1599ac91e297d9bf0bc9299178d8113ac864f2fabf0004cbbaf0fcc9fb43d981@ec2-34-232-191-133.compute-1.amazonaws.com/d68b0k11d6t4uq'

#db = SQLAlchemy(app)

#Pet = create_classes(db)

# create route that renders index.html template
@app.route("/")
def home():
    return render_template("index.html")


@app.route('/api/v1.0/locationData', methods=['GET','POST'])       
def locationData():

  connection = create_engine(URI)

  #connection = create_engine('postgresql://ikrqwnaviefoab:1599ac91e297d9bf0bc9299178d8113ac864f2fabf0004cbbaf0fcc9fb43d981@ec2-34-232-191-133.compute-1.amazonaws.com/d68b0k11d6t4uq')
#   connection = create_engine(db)
  # make a connection
  session = Session(connection)

  location = psql.read_sql('select id,location from location order by 1', connection)
   # Close the database connection session
  session.close()

  location = location.to_json(orient='records')
  return location


@app.route('/api/v1.0/premiseData', methods=['GET','POST'])       
def premiseData():
  # connect to Postgres Domestioc Violence database
  connection = create_engine(URI)

  # make a connection
  session = Session(connection)

  premise = psql.read_sql('select id,premise from premise order by 1', connection)
   # Close the database connection session
  session.close()

  premise = premise.to_json(orient='records')
  return premise



@app.route('/api/v1.0/alcoholData', methods=['GET','POST'])       
def alcoholData():
  # connect to Postgres Domestioc Violence database
  connection = create_engine(URI)

  # make a connection
  session = Session(connection)

  alcohol = psql.read_sql('select id,alcohol from alcohol order by 1', connection)
   # Close the database connection session
  session.close()

  alcohol = alcohol.to_json(orient='records')
  return alcohol


@app.route('/api/v1.0/relationshipData', methods=['GET','POST'])       
def relationshipData():
  # connect to Postgres Domestioc Violence database
  connection = create_engine(URI)

  # make a connection
  session = Session(connection)

  relationship = psql.read_sql('SELECT id, relationship FROM offender_victim_relation order by 1', connection)
   # Close the database connection session
  session.close()

  relationship = relationship.to_json(orient='records')
  return relationship

@app.route('/api/v1.0/monthData', methods=['GET','POST'])       
def monthData():
  # connect to Postgres Domestioc Violence database
  connection = create_engine(URI)

  # make a connection
  session = Session(connection)

  month = psql.read_sql("select month as id,to_char(to_date(month::text,'MM'),'Month') as month from month order by 1", connection)
   # Close the database connection session
  session.close()

  month = month.to_json(orient='records')
  return month


@app.route('/api/v1.0/dayData', methods=['GET','POST'])       
def dayData():
  # connect to Postgres Domestioc Violence database
  connection = create_engine(URI)

  # make a connection
  session = Session(connection)

  day = psql.read_sql("select id,day from day order by 1", connection)
   # Close the database connection session
  session.close()

  day = day.to_json(orient='records')
  return day

@app.route('/api/v1.0/timeData', methods=['GET','POST'])       
def timeData():
  # connect to Postgres Domestioc Violence database
  connection = create_engine(URI)

  # make a connection
  session = Session(connection)

  time = psql.read_sql("select id,time from time order by 1", connection)
   # Close the database connection session
  session.close()

  time = time.to_json(orient='records')
  return time

@app.route('/api/v1.0/vGenderData', methods=['GET','POST'])       
def genderData():
  # connect to Postgres Domestioc Violence database
  connection = create_engine(URI)

  # make a connection
  session = Session(connection)

  gender = psql.read_sql("select id,gender from gender order by 1", connection)
   # Close the database connection session
  session.close()

  gender = gender.to_json(orient='records')
  return gender  

@app.route('/api/v1.0/vAgeData', methods=['GET','POST'])       
def ageData():
  # connect to Postgres Domestioc Violence database
  connection = create_engine(URI)

  # make a connection
  session = Session(connection)

  age = psql.read_sql("select id,age from victim_age order by 1", connection)
   # Close the database connection session
  session.close()

  age = age.to_json(orient='records')
  return age 


@app.route("/send", methods=["GET", "POST"])
def send():
    return render_template("form.html")


@app.route("/predict", methods=["GET", "POST"])
def predict():
    if request.method == "POST":
        locationList = request.form["locationList"]
        premiseList = request.form["premiseList"]
        alcoholList = request.form["alcoholList"]
        relationshipList = request.form["relationshipList"]
        monthList = request.form["monthList"]
        dayList = request.form["dayList"]
        timeList = request.form["timeList"]
        genderList = request.form["genderList"]
        ageList = request.form["ageList"]
        
        # open the saved model and scaler
        # load the model
        storedModel = load(open('model.sav', 'rb'))
        # load the scaler
        storedScaler = load(open('scaler.sav', 'rb'))
        #prediction = [[4,6,2,5,6,7,1,2,127]]

        prediction = [[monthList,premiseList,genderList,ageList,relationshipList,dayList,timeList,alcoholList,locationList]]
        # Prediction 2 Profile
        # 3 -   Month   :"March"
        # 16 -  Premise :"Residential"
        # 1 -   Gender  :"Male"
        # 4 -	Victum Age: "30 - 39"
        # 12 -  Relationship with Victim:   "Not Known To Victim"	
        # 7 -   Day     :"Sunday"
        # 4 -   Time    :"6pm - < 12pm"
        # 2 -   Alcohol :"N"
        # 60 -  Location:"Kempsey"

        #print(ageList)
        scaled_prediction = storedScaler.transform(prediction)
        p = storedModel.predict(scaled_prediction)

        def result(prediction):
            result = 'False'
            if prediction[0] == 1:
                result = 'True'
            return result    
        print(p)
        #pet = Pet(name=name, lat=lat, lon=lon)
        #db.session.add(pet)
        #db.session.commit()
        #return redirect("/", code=302)

    return render_template("result.html")



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
