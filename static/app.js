// Store the json file content
var data = {};
// Store the indexes
var locationId = 0;
var premiseId = 0;

// Incoming data is internally referred to as incomingData
d3.json("/api/v1.0/locationData").then((importedData) => {
  //console.log(importedData);
  data = importedData;
  data.location = Object.keys(data.location).map(function(key){
    return data.location[key];
})

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
  data.premise = Object.keys(data.premise).map(function(key){
    return data.premise[key];
  })

  console.log(data.premise);
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


  //Function to detect a change in the list item
function optionChanged(selectedName,listNumber) {
  console.log(selectedName);
  //Find the index of the id array matching the value of the selectedName
  switch (listNumber) {
    case 1:
      locationId = data.location.indexOf(selectedName);
      break;
    case 2:  
      premiseId = data.premise.indexOf(selectedName);
      break;
    default:  
  }
  console.log(locationId);
  console.log(premiseId);
} 