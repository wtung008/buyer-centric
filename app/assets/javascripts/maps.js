function initMap() {
  var mapPlaceholder = $('#map');

  var LatLong = { lat: mapPlaceholder.data('latitude'), lng: mapPlaceholder.data('longitude')}
  var map = new google.maps.Map(mapPlaceholder[0], {
     center: LatLong,
     zoom: 13
   });

  var cityCircle = new google.maps.Circle({
  strokeColor: '#FF0000',
  strokeOpacity: 0.8,
  strokeWeight: 2,
  fillColor: '#FF0000',
  fillOpacity: 0.35,
  map: map,
  center: map.center,
  radius: 1000
  });
}
