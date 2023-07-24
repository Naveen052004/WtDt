<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Watch User's Location</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
    }

    #map {
      height: 100%;
      width: 100%;
    }
  </style>
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
</head>
<body>
  <div id="map"></div>

  <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
  <script>
    var map;
    var marker;

    function initMap() {
      // Create a map centered at (0, 0)
      map = L.map('map').setView([0, 0], 15);

      // Use OpenStreetMap tiles
      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: 'Map data © <a href="https://openstreetmap.org">OpenStreetMap</a> contributors',
        maxZoom: 18
      }).addTo(map);

      // Get user's location
      if (navigator.geolocation) {
        navigator.geolocation.watchPosition(function(position) {
          // Update map center to user's location
          var pos = [position.coords.latitude, position.coords.longitude];
          map.setView(pos);

          // Update marker position or create a new marker
          if (marker) {
            marker.setLatLng(pos);
          } else {
            marker = L.marker(pos).addTo(map).bindPopup('Your Location');
          }
        }, function() {
          alert('Error: The Geolocation service failed.');
        });
      } else {
        alert('Error: Your browser doesn\'t support geolocation.');
      }
    }
  </script>

  <script>
    document.addEventListener('DOMContentLoaded', function() {
      initMap();
    });
  </script>
</body>
</html>
