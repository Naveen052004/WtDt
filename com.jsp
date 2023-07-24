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
      overflow: scroll;
      display: flex;
      justify-content: center;
      align-items: center;
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
    .filter{
      padding-right: 100px;
      margin: 0px 10px;
    }.options{
      
    }
    .statusoptions{
      padding: 0px 40px;
      margin: 10px 52px;
    }
  </style>
</head>
<body>
  <<header id="header">
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
            <a class="nav-link" href="loc2.html">Location</a>
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
  <%
  Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbl2.0","root","Naveen@123");
  Statement s=c.createStatement();
  String str="select sd_no,b.roll_no,date,bus_no,complaints,status from complaintable c,buses b where b.roll_no=c.roll_no;";
  ResultSet rs=s.executeQuery(str);
  %>
  <div id="content">
    <div id="complaint-table">
      <h4>Registered Complaints</h4>
      <table class="table">
        <thead>
          <tr>
            <th class="ComplaintNo">ComplaintNo</th>
            <th>Roll No</th>
            <th>Date</th>
            <th>Bus</th>
            <th>Complaint</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody id="complaint-table-body">
          <!-- Complaint rows will be dynamically added here -->
          <% while(rs.next())
          {%>
          <tr>
            <td><input type="checkbox" value="<%=rs.getString(1)%>" name="status"> <%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
            <td><%=rs.getString(5)%></td>
            <td><%=rs.getString(6)%></td>
          </tr>
        <%}%>
        </tbody>
      </table>
    </div>
    
    <div class="container">
        <form action="" class="options">
        <%
        String buses[] = { "ALL", "3", "8", "10", "11", "16", "20", "29", "31" };
        %>
        <h6 style="display: inline-block;">Select Bus : </h6>
        <select name="" id="" class="filter">
          <%
          for(int i=0;i<buses.length;i++){
            String temp=buses[i]; 
            %>
            <option value="<%=temp%>"><%=temp%></option><%
          }
          %>
        </select>
        <br><br>
        <input type="button" value="Resolved" style="display: block"class="statusoptions">
        <input type="button" value="Denied" style="display: block;" class="statusoptions">
      </form>
      </div>

    <script>
      // JavaScript code to update the complaint count dynamically
      // var complaintCount = 0;
      function addComplaint() {
        val=document.getElementById("common-complaints").value;
        area=document.getElementById("t1");
        if(val==="Others"){
          area.value="";
          document.getElementById("t1").disabled=false;
        }
        else{
          document.getElementById("t1").disabled=true;
         
          area.value=val;
        }
      }

      // function updateComplaintCount() {
      //   var countElement = document.getElementById('complaint-count');
      //   countElement.textContent = complaintCount;
      // }

      // Example event listener for submitting a complaint
      // var submitButton = document.querySelector('#submit-btn');
      // submitButton.addEventListener('click', function() {
      //   var textarea = document.querySelector('#complaint-textarea textarea');
      //   var complaint = textarea.value.trim();

      //   if (complaint !== '') {
      //     // Get current date and time
      //     var now = new Date();
      //     var date = now.toLocaleDateString();
      //     var time = now.toLocaleTimeString();

      //     // Create a new row for the complaint
      //     var tbody = document.querySelector('#complaint-table-body');
      //     var newRow = document.createElement('tr');
      //     var dateCell = document.createElement('td');
      //     var complaintCell = document.createElement('td');
      //     var busCell = document.createElement('td');
      //     dateCell.textContent = date + ' ' + time;
      //     complaintCell.textContent = complaint;
      //     busCell.textContent = getBusNumber(complaint);
      //     newRow.appendChild(dateCell);
      //     newRow.appendChild(complaintCell);
      //     newRow.appendChild(busCell);
      //     tbody.insertBefore(newRow, tbody.firstChild);

      //     // Increase the complaint count
      //     complaintCount++;
      //     updateComplaintCount();

      //     // Clear the textarea
      //     // textarea.value = '';
      //   }
      // });

      // function getBusNumber(complaint) {
      //   var regex = /Bus: (\d+)/;
      //   var match = complaint.match(regex);
      //   return match ? match[1] : '';
      // }

      // Call the function initially to set the complaint count
      // updateComplaintCount();

      // function update(){
      // }
    </script>
  </div>
</body>
</html>