<%@include file="connect.jsp"%>
<%@include file="getcookies.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
  <link rel="stylesheet" href="profile.css">
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link href='buttons.css' rel='stylesheet'>
  <script src="cookies.js"></script>
  <style>
    .navbuttons{
      text-decoration: none;
      color: white;
    }
    .button:hover{
      background-color: rgb(163, 114, 114);
      color: rgb(0, 255, 191);
    }
  </style>
</head>
<body>
  <div class="top-bar">
    
    <a href="home.html" class ="button-17" role="button">Home</a>
    
    <a href="changepassword.html" class="button-17" role="button">Change Password</a>
      
    <a href="logout.jsp" class ="button-17">Logout</a>
      
    
</div>
  <div class="wrapper">
    <div class="left">
      <img src="profile-default.jpg" alt="user" width="150" height="500">
      <h1><%
        String roll=(String)session.getAttribute("rollno");
        ResultSet rs=s.executeQuery("Select members from buses where roll_no='"+roll+"';");
        if(rs.next())
        {
            out.println(rs.getString(1));
        }
        else
        out.println(roll);
        %>
    </h1>
    </div>
    <div class="right">

<div class="info">
  <h3>information</h3>
  <div class="info_data">
    <div class="data">
      <h4 style="font-size: x-large;">Email</h4>
    <p style="font-size: larger;" id="profile">
      vigneshshivanoor@gmail.com
      <script>
        let cookies = document.cookie.split("; ");
    for (let i = 0; i < cookies.length; i++) {
        let cookie = cookies[i].split("=");
        if (cookie[0] === "name") {
            document.getElementById("profile").innerHTML = (cookie[1].substring(0, cookie[1].indexOf('@')).toUpperCase())+cookie[1].substring(cookie[1].indexOf('@'));
        }
    }
      </script>
    </p>
    </div>
    <div class="data">
    <h4 style="font-size: x-large;">phone</h4>
    <p style="font-size: x-large;">7738363524</p>
  </div>
</div>
</div>

<div class="projects">
  <h3>projects</h3>
  <div class="projects_data">
    <div class="data">
      <h4 style="font-size: x-large;">recent</h4>
    <p style="font-size: x-large;">
      Lorem ipsum dolor sit amet consectetur adipisicing.
    </p>
    </div>
    <div class="data">
    <h4 style="font-size: x-large;">mostviewved</h4>
    <p style="font-size: x-large;">7738363524</p>
  </div>
</div>
</div>
<div class="social_media">
  <ul>
    <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
    <li><a href="#"><i class="fab fa-instagram"></i></a></li>
</ul>

</div>

    </div>
  </div>

  <script>
    console.log(document.cookie)
  </script>
</body>
</html>