# Lumensee

## Summary 
Lumensee is a web application created to allow the user to determine which stars will be visible in their night sky.

##Project Description 

LUMENsee is a student project developed during week 9 of the Flatiron School Web Immersive course. LUMENsee displays the stars visible from your location on earth given the amount of light pollution in your area. LUMENsee uses Hipparcos stellar data from the European Space Agency and light pollution data the US National Renewable Energy Laboratory (NREL) to generate a set of stars visible from the location of your IP address. Stars are displayed on a 3-D chart using Highchart.js, which generates a chart from our data via an API. Our webapp is made with Ruby on Rails and hosted on Heroku. 

The goal of our webapp is to provide an informative and fresh look at the universe. Stars in the chart vary in size with their apparent magnitude, a measure of the brightness a star would have on Earth in the absence of the atmosphere. Each star is labeled with its Hipparcos coordinates and a name. Star locations are approximate; this webapp is not intended for trip planning purposes. 