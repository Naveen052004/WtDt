<%@include file="connect.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Google Maps - Open Location</title>
    <script>
       <% ResultSet rs=s.executeQuery("Select * from coords;");
          rs.next();
          %>
          var latitude = <%=rs.getString(1)%>;
          var longitude =<%=rs.getString(2)%>;
          var googleMapsLink = "https://www.google.com/maps?q=" + latitude + "," + longitude;

          window.open(googleMapsLink, "_blank");
  </script>
</head>
</html>
