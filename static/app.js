d3.json("/api/v1.0/allCrimesData").then((importedData) => {
  var x1 = []
  var y1 = []
  for (var i=0; i< importedData.length; i++){
    x1.push(importedData[i].crime_type)
    y1.push(importedData[i].no)
  }
  // Create the Trace
  var trace1 = {
    x: x1,
    y: y1,
    type: "bar"
  };


  // Create the data array for the plot
  var data = [trace1];

  // Define the plot layout
  var layout = {
    title: "Major Crimes committed in NSW 2020",
    yaxis: { title: "No. of incidents" }
  };

  // Plot the chart to a div tag with id "bar-plot"
  Plotly.newPlot("bar", data, layout);
})


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
