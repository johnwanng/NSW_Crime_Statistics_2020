var locationList = {};
var premiseList = {};
var alcoholList = {};
var relationshipList = {};
var monthList = {};
var dayList = {};
var timeList = {};
var genderList = {};
var ageList = {};

// Store the indexes
var locationId = 0;
var premiseId = 0;
var alcoholId = 0;
var relationshipId = 0;
var monthId = 0;
var dayId = 0;
var timeId = 0;
var genderId = 0;
var ageId = 0;

// Incoming data is internally referred to as incomingData
d3.json("/api/v1.0/locationData").then((importedData) => {
  //console.log(importedData);
  data = importedData;

  //console.log(data)
  data.location = Object.keys(data.location).map(function(key){
    return data.location[key];
  })
//console.log(data);

  locationList = importedData.location;
  //Append option text and value to list item using the given names from the json data
  d3.select("#locationList")
      .selectAll(null)
      .data(data.location)
      .enter()
      .append('option')
      .text(function (d) { return d; }) // text showed in the menu
      .attr("value", function (d) { return d; }) // value kept in the menu
  //Dispolay the demographic info for the first element of the array
  optionChanged(data.location[0]);
}) 

// Incoming data is internally referred to as incomingData
d3.json("/api/v1.0/premiseData").then((importedData) => {
  //console.log(importedData);
  data = importedData;
  data.premise = Object.keys(importedData.premise).map(function(key){
    return importedData.premise[key];
  })

  premiseList = importedData.premise;
  //console.log(data.premise);
//Append option text and value to list item using the given names from the json data
  d3.select("#premiseList")
      .selectAll(null)
      .data(data.premise)
      .enter()
      .append('option')
      .text(function (d) { return d; }) // text showed in the menu
      .attr("value", function (d) { return d; }) // value kept in the menu
  //Dispolay the demographic info for the first element of the array
  optionChanged(data.premise[0]);
}) 


  // Incoming data is internally referred to as incomingData
d3.json("/api/v1.0/alcoholData").then((importedData) => {
  //console.log(importedData);
  data = importedData;
  data.alcohol = Object.keys(importedData.alcohol).map(function(key){
    return importedData.alcohol[key];
  })

  alcoholList = importedData.alcohol;
  console.log(alcoholList);
//Append option text and value to list item using the given names from the json data
  d3.select("#alcoholList")
      .selectAll(null)
      .data(data.alcohol)
      .enter()
      .append('option')
      .text(function (d) { return d; }) // text showed in the menu
      .attr("value", function (d) { return d; }) // value kept in the menu
  //Dispolay the demographic info for the first element of the array
  optionChanged(data.alcohol[0]);
  }) 


  // Incoming data is internally referred to as incomingData
  d3.json("/api/v1.0/relationshipData").then((importedData) => {
    //console.log(importedData);
    data = importedData;
    data.relationship = Object.keys(importedData.relationship).map(function(key){
      return importedData.relationship[key];
    })
  
    relationshipList = importedData.relationship;
    //console.log(alcoholList);
  //Append option text and value to list item using the given names from the json data
    d3.select("#relationshipList")
        .selectAll(null)
        .data(data.relationship)
        .enter()
        .append('option')
        .text(function (d) { return d; }) // text showed in the menu
        .attr("value", function (d) { return d; }) // value kept in the menu
    //Dispolay the demographic info for the first element of the array
    optionChanged(data.relationship[0]);
    }) 


 // Incoming data is internally referred to as incomingData
 d3.json("/api/v1.0/monthData").then((importedData) => {
  //console.log(importedData);
  data = importedData;
  data.month = Object.keys(importedData.month).map(function(key){
    return importedData.month[key];
  })

  monthList = importedData.month;
  //console.log(alcoholList);
//Append option text and value to list item using the given names from the json data
  d3.select("#monthList")
      .selectAll(null)
      .data(data.month)
      .enter()
      .append('option')
      .text(function (d) { return d; }) // text showed in the menu
      .attr("value", function (d) { return d; }) // value kept in the menu
  //Dispolay the demographic info for the first element of the array
  optionChanged(data.month[0]);
  }) 



// Incoming data is internally referred to as incomingData
d3.json("/api/v1.0/dayData").then((importedData) => {
  //console.log(importedData);
  data = importedData;
  data.day = Object.keys(importedData.day).map(function(key){
    return importedData.day[key];
  })

  dayList = importedData.day;
  //console.log(alcoholList);
//Append option text and value to list item using the given names from the json data
  d3.select("#dayList")
      .selectAll(null)
      .data(data.day)
      .enter()
      .append('option')
      .text(function (d) { return d; }) // text showed in the menu
      .attr("value", function (d) { return d; }) // value kept in the menu
  //Dispolay the demographic info for the first element of the array
  optionChanged(data.day[0]);
  }) 


  // Incoming data is internally referred to as incomingData
 d3.json("/api/v1.0/timeData").then((importedData) => {
  //console.log(importedData);
  data = importedData;
  data.time = Object.keys(importedData.time).map(function(key){
    return importedData.time[key];
  })

  timeList = importedData.time;
  //console.log(alcoholList);
//Append option text and value to list item using the given names from the json data
  d3.select("#timeList")
      .selectAll(null)
      .data(data.time)
      .enter()
      .append('option')
      .text(function (d) { return d; }) // text showed in the menu
      .attr("value", function (d) { return d; }) // value kept in the menu
  //Dispolay the demographic info for the first element of the array
  optionChanged(data.time[0]);
  }) 

  // Incoming data is internally referred to as incomingData
 d3.json("/api/v1.0/vGenderData").then((importedData) => {
  //console.log(importedData);
  data = importedData;
  data.gender = Object.keys(importedData.gender).map(function(key){
    return importedData.gender[key];
  })

  genderList = importedData.gender;
  //console.log(alcoholList);
//Append option text and value to list item using the given names from the json data
  d3.select("#genderList")
      .selectAll(null)
      .data(data.gender)
      .enter()
      .append('option')
      .text(function (d) { return d; }) // text showed in the menu
      .attr("value", function (d) { return d; }) // value kept in the menu
  //Dispolay the demographic info for the first element of the array
  optionChanged(data.gender[0]);
  }) 


  // Incoming data is internally referred to as incomingData
 d3.json("/api/v1.0/vAgeData").then((importedData) => {
  //console.log(importedData);
  data = importedData;
  data.age = Object.keys(importedData.age).map(function(key){
    return importedData.age[key];
  })

  ageList = importedData.age;
  //console.log(alcoholList);
//Append option text and value to list item using the given names from the json data
  d3.select("#ageList")
      .selectAll(null)
      .data(data.age)
      .enter()
      .append('option')
      .text(function (d) { return d; }) // text showed in the menu
      .attr("value", function (d) { return d; }) // value kept in the menu
  //Dispolay the demographic info for the first element of the array
  optionChanged(data.age[0]);
  }) 


  //Function to detect a change in the list item
function optionChanged(selectedName,listNumber) {
  console.log(selectedName);
  //Find the index of the id array matching the value of the selectedName
  switch (listNumber) {
    case 1:
      locationId = locationList.indexOf(selectedName);
      break;
    case 2:  
      premiseId = premiseList.indexOf(selectedName);
      break;
    case 3:  
      alcoholId = alcoholList.indexOf(selectedName);
      break;
    case 4:  
      relationshipId = relationshipList.indexOf(selectedName);
      break;
    case 5:  
      monthId = monthList.indexOf(selectedName);
      break;
    case 6:  
      dayId = dayList.indexOf(selectedName);
      break;
    case 7:  
      timeId = timeList.indexOf(selectedName);
      break;
    case 8:  
      genderId = genderList.indexOf(selectedName);
      break;
    case 9:  
      ageId = ageList.indexOf(selectedName);
      break;              
    default:
      break;  
  }
  console.log(locationId);
  console.log(premiseId);
  console.log(alcoholId);
  console.log(relationshipId);
  console.log(monthId);
  console.log(dayId);
  console.log(timeId);
  console.log(genderId);
  console.log(ageId);
} 