<html>
<head>
  <title>Complaint System</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@2.0.7/css/boxicons.min.css">
  <style>
    /* Custom styling */
    body {
      margin: 0;
      padding: 0;
    }

    #header {
      background-color: #f8f9fa;
      padding: 20px;
    }

    #content {
      display: flex;
      min-height: calc(100vh - 170px);
    }

    #complaint-table {
      flex: 3;
      padding: 20px;
      border: 2px solid black;
      margin: 10px 20px;
      margin-right: 4pxpx;
      background-color: #f8f9fa;
      height: 600px;
      overflow: scroll;
    }

    .container {
      flex: 1;
      border: 2px solid black;
      padding: 20px;
      width: 20%;
      margin: 10px 0px;
      background-color: #f8f9fa;
      overflow-y: auto;
    }
    .common-complaints{
        display: flex;
        justify-content: center;
    }
    #common-complaints{
        padding: 10px 5px;
    }
    #complaint-textarea {
      flex: 1;
      padding: 20px;
      background-color: #f8f9fa;
      margin: 0px;
    }

    #registered-complaints {
      text-align: center;
      padding: 20px;
      background-color: #f8f9fa;
      font-size: 20px;
      margin-bottom: 20px;
    }
    .he{
      text-align: center;
    }
    .complaintNo{
      width: 14%;
    }
    .datestyle{
        width: 25%;
    }
  </style>
</head>
<body>
  <header id="header">
    <nav class="navbar navbar-expand navbar-dark bg-dark">
      <a class="navbar-brand" href="#">Complaint System</a>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link" href="home.html">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="anotherpage.html">Services</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="anotherpage.html">Location</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="anotherpage.html">Contact us</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="profile.jsp">Profile</a>
        </li>
      </ul>
    </nav>
  </header>
  <%@page import="java.sql.*"%>
  <%@include file="getcookies.jsp"%>
  <%@include file="connect.jsp"%>
  <%
  String str="select * from complaintable where roll_no='"+(String)session.getAttribute("rollno")+"';";
  ResultSet rs=s.executeQuery(str);
  int i=0;
  %>
  <div id="content">
    <div id="complaint-table">
      <h4>Registered Complaints</h4>
      <table class="table">
        <thead>
          <tr>
            <th>S.No</th>
            <th class="ComplaintNo">ComplaintNo</th>
            <th class="datestyle">Date</th>
            <th>Complaint</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody id="complaint-table-body">
          <!-- Complaint rows will be dynamically added here -->
          <% while(rs.next())
          {%>
          <tr>
            <td><%=++i%></td>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(5)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
          </tr>
        <%}%>
        </tbody>
      </table>
    </div>
    
    <div class="container">
            <form action="insertcomplain.jsp">
            <span>
                <h2 class="he">Complaint Here</h2>
            </span>
            
            <span class="common-complaints">
                <select id="common-complaints" onchange="addComplaint()">
                    <option value="">Select a common complaint</option>
                    <option value="Late Bus">Late Bus</option>
                    <option value="Rude Driver">Rude Driver</option>
                    <option value="Uncomfortable Seats">Uncomfortable Seats</option>
                    <option value="Dirty Bus">Dirty Bus</option>
                    <option value="Others">Others</option>
                </select>
          <!-- <select id="BUS" onchange="">
            <option value="">Select bus</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
        </select> -->
    </span>
    
    <div id="complaint-textarea">
        <h4>Submit a Complaint</h4>
        <textarea class="form-control" id="t1" rows="5" placeholder="Enter your complaint" name="complaintarea" readonly></textarea>
        <button class="btn btn-primary mt-3" id="submit-btn">Submit</button>
    </div>
</form>
</div>

    <script>
      // JavaScript code to update the complaint count dynamically
      var complaintCount = 0;
      function addComplaint() {
        val=document.getElementById("common-complaints").value;
        area=document.getElementById("t1");
        if(val==="Others"){
            console.log(val);
            area.removeAttribute('readonly');
            area.value="";
        }
        else{
            area.setAttribute('readonly',true);
          area.value=val;
        }
      }

      function addBus() {
        var selectElement = document.getElementById("BUS");
        var selectedValue = selectElement.value;
        var complaintInput = document.getElementById("t1");

        if (selectedValue) {
          complaintInput.value += "Bus: " + selectedValue + "\n";
          selectElement.value = "";
        }
      }

      function updateComplaintCount() {
        var countElement = document.getElementById('complaint-count');
        countElement.textContent = complaintCount;
      }

      // Example event listener for submitting a complaint
      var submitButton = document.querySelector('#submit-btn');
      submitButton.addEventListener('click', function() {
        var textarea = document.querySelector('#complaint-textarea textarea');
        var complaint = textarea.value.trim();

        if (complaint !== '') {
          // Get current date and time
          var now = new Date();
          var date = now.toLocaleDateString();
          var time = now.toLocaleTimeString();

          // Create a new row for the complaint
          var tbody = document.querySelector('#complaint-table-body');
          var newRow = document.createElement('tr');
          var dateCell = document.createElement('td');
          var complaintCell = document.createElement('td');
          var busCell = document.createElement('td');
          dateCell.textContent = date + ' ' + time;
          complaintCell.textContent = complaint;
          busCell.textContent = getBusNumber(complaint);
          newRow.appendChild(dateCell);
          newRow.appendChild(complaintCell);
          newRow.appendChild(busCell);
          tbody.insertBefore(newRow, tbody.firstChild);

          // Increase the complaint count
          complaintCount++;
          updateComplaintCount();

          // Clear the textarea
          textarea.value = '';
        }
      });

      function getBusNumber(complaint) {
        var regex = /Bus: (\d+)/;
        var match = complaint.match(regex);
        return match ? match[1] : '';
      }

      // Call the function initially to set the complaint count
      updateComplaintCount();
    </script>
  </div>
</body>
</html>