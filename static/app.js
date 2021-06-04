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

  //Append option text and value to list item using the given names from the json data
  d3.select("#locationList")
      .selectAll(null)
      .data(importedData)
      .enter()
      .append('option')
      .text(function (d) { return d.location; }) // text showed in the menu
      .attr("value", function (d) { return d.id; }) // value kept in the menu
  //Dispolay the demographic info for the first element of the array
  //optionChanged(importedData.location[0]); 
}) 

// Incoming data is internally referred to as incomingData
d3.json("/api/v1.0/premiseData").then((importedData) => {

  d3.select("#premiseList")
      .selectAll(null)
      .data(importedData)
      .enter()
      .append('option')
      .text(function (d) { return d.premise; }) // text showed in the menu
      .attr("value", function (d) { return d.id; }) // value kept in the menu
  //Dispolay the demographic info for the first element of the array
  //optionChanged(importedData.premise[0]);
}) 


  // Incoming data is internally referred to as incomingData
d3.json("/api/v1.0/alcoholData").then((importedData) => {

  d3.select("#alcoholList")
      .selectAll(null)
      .data(importedData)
      .enter()
      .append('option')
      .text(function (d) { return d.alcohol; }) // text showed in the menu
      .attr("value", function (d) { return d.id; }) // value kept in the menu
  //Dispolay the demographic info for the first element of the array
  //optionChanged(importedData.alcohol[0]);
  }) 





  // Incoming data is internally referred to as incomingData
  d3.json("/api/v1.0/relationshipData").then((importedData) => {
  
  //Append option text and value to list item using the given names from the json data
    d3.select("#relationshipList")
        .selectAll(null)
        .data(importedData)
        .enter()
        .append('option')
        .text(function (d) { return d.relationship; }) // text showed in the menu
        .attr("value", function (d) { return d.id; }) // value kept in the menu
    //Dispolay the demographic info for the first element of the array
    }) 


 // Incoming data is internally referred to as incomingData
 d3.json("/api/v1.0/monthData").then((importedData) => {
 
//Append option text and value to list item using the given names from the json data
  d3.select("#monthList")
      .selectAll(null)
      .data(importedData)
      .enter()
      .append('option')
      .text(function (d) { return d.month; }) // text showed in the menu
      .attr("value", function (d) { return d.id; }) // value kept in the menu
  //Dispolay the demographic info for the first element of the array
    // optionChanged(importedData.month[0]);
  }) 



// Incoming data is internally referred to as incomingData
d3.json("/api/v1.0/dayData").then((importedData) => {
 
//Append option text and value to list item using the given names from the json data
  d3.select("#dayList")
      .selectAll(null)
      .data(importedData)
      .enter()
      .append('option')
      .text(function (d) { return d.day; }) // text showed in the menu
      .attr("value", function (d) { return d.id; }) // value kept in the menu
  //Dispolay the demographic info for the first element of the array
  //optionChanged(importedData.day[0]);
  }) 


  // Incoming data is internally referred to as incomingData
 d3.json("/api/v1.0/timeData").then((importedData) => {
 
//Append option text and value to list item using the given names from the json data
  d3.select("#timeList")
      .selectAll(null)
      .data(importedData)
      .enter()
      .append('option')
      .text(function (d) { return d.time; }) // text showed in the menu
      .attr("value", function (d) { return d.id; }) // value kept in the menu
  //Dispolay the demographic info for the first element of the array
  //optionChanged(importedData.time[0]);
  }) 

  // Incoming data is internally referred to as incomingData
 d3.json("/api/v1.0/vGenderData").then((importedData) => {
  
//Append option text and value to list item using the given names from the json data
  d3.select("#genderList")
      .selectAll(null)
      .data(importedData)
      .enter()
      .append('option')
      .text(function (d) { return d.gender; }) // text showed in the menu
      .attr("value", function (d) { return d.id; }) // value kept in the menu
  //Dispolay the demographic info for the first element of the array
  //optionChanged(importedData.gender[0]);
  }) 


  // Incoming data is internally referred to as incomingData
 d3.json("/api/v1.0/vAgeData").then((importedData) => {
//Append option text and value to list item using the given names from the json data
  d3.select("#ageList")
      .selectAll(null)
      .data(importedData)
      .enter()
      .append('option')
      .text(function (d) { return d.age; }) // text showed in the menu
      .attr("value", function (d) { return d.id; }) // value kept in the menu
  //Dispolay the demographic info for the first element of the array
  //optionChanged(importedData.age[0]);
  }) 


  //Function to detect a change in the list item
function optionChanged(selectedName,listNumber) {
  //console.log(selectedName);
  //Find the index of the id array matching the value of the selectedName
  switch (listNumber) {        
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