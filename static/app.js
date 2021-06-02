// Use d3.json() to fetch data from samples.JSON file
// Incoming data is internally referred to as incomingData
d3.json("/api/v1.0/locationData").then((importedData) => {
  console.log(importedData);
  data = importedData;
  
  //Append option text and value to list item using the given names from the json data
  d3.select("#selDataset")
      .selectAll(null)
      .data(data.names)
      .enter()
      .append('option')
      .text(function (d) { return d; }) // text showed in the menu
      .attr("value", function (d) { return d; }) // value kept in the menu
  //Dispolay the demographic info for the first element of the array
  optionChanged(data.metadata[0].id);
  }) 