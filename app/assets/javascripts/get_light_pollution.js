$(document).ready(function(){

  //Get location
  var location = new Promise(function(resolve, reject){
    navigator.geolocation.getCurrentPosition(function(position) {
      var lat = position.coords.latitude;
      var lon = position.coords.longitude;
      coords = {};
      coords["latitude"] = lat;
      coords["longitude"] = lon;
      resolve(coords);
    }); // navigator
  }); //promise

  //Get light pollution
  location.then(function(coords){
    console.log(coords);
  }); // then

}); //document ready
