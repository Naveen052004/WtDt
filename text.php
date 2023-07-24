<!DOCTYPE html>
<html>
<head>
    <title>Share Location</title>
    <script>
        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            } else {
                alert("Geolocation is not supported by this browser.");
            }
        }

        function showPosition(position) {
            var latitude = position.coords.latitude;
            var longitude = position.coords.longitude;
            
            var googleMapsLink = `https://www.google.com/maps?q=${latitude},${longitude}`;
            var whatsappMessage = `Check out my location: ${googleMapsLink}`;

            document.getElementById("googleMapsLink").href = googleMapsLink;
            document.getElementById("whatsappLink").href = `https://wa.me/?text=${encodeURIComponent(whatsappMessage)}`;
        }

        // Call getLocation() every 5 seconds
        setInterval(getLocation, 5000);
    </script>
</head>
<body>
    <h1>Share Your Location</h1>

    <h2>Share your location using:</h2>
    <ul>
        <li><a id="googleMapsLink" target="_blank">Google Maps</a></li>
        <li><a id="whatsappLink" target="_blank">WhatsApp</a></li>
    </ul>
</body>
</html>
