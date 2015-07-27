$(document).ready(function(){

  function getLocation() {
   navigator.geolocation.getCurrentPosition(function(position) {
    var lat = position.coords.latitude;
    var lon = position.coords.longitude;
    var coords = {};
    coords["latitude"] = lat;
    coords["longitude"] = lon;
    return coords;
  });

 }
 
 getLocation();
});