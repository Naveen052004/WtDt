<%@include file="connect.jsp" %>
<!DOCTYPE html>
<html>
<title>Admin Dashboard</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<style>
    body {
        background-color: #f0f0f0;
    }
    .navbar {
        background-color: #333;
        color: #fff;
    }
    .nav-link {
        color: #fff;
    }
    .nav-link:hover {
        color: #ccc;
    }
    .container {
        margin-top: 20px;
    }
    .table-container {
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .table-container table {
        width: 100%;
        border-collapse: collapse;
    }
    .table-container th,
    .table-container td {
        padding: 12px;
        border-bottom: 1px solid #ccc;
        text-align: center;
    }
    .table-container th {
        background-color: #f0f0f0;
        font-weight: bold;
    }
    .table-container input[type="checkbox"] {
        margin: 0;
    }
    .container-fluid {
        display: flex;
    }
    .left-side {
        flex: 70%;
        padding-right: 15px;
    }
    .right-side {
        flex: 30%;
    }

    .right-side button {
        width: 70%;
        margin-bottom: 10px;
    }
    .right-side .btn-icon {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .overset{
        height: 620px;
        overflow: scroll;
    }
    .buttons{
        display: inline-block;
        margin: auto;
    }
</style>
</head>
<body>
    <nav class="navbar navbar-expand-md">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="#complaints">Complaints</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#buspass-verify">Bus Pass Verify</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#bus-driver">Bus Driver</a>
            </li>
        </ul>
    </nav>
    <form action="adminupdate.jsp">
    <div class="container-fluid" id="content">
        <div class="left-side">
            <div class="table-container mt-4 overset">
                <h1 class="text-center mb-4">Complaints</h1>
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th>Complaint No.</th>
                            <th>Roll No</th>
                            <th>Bus No</th>
                            <th>Complaint</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        ResultSet rs=s.executeQuery("SELECT sd_no,b.roll_no,bus_no,complaints,Status FROM `pbl2.0`.buses b,complaintable c where b.roll_no=c.roll_no;");
                        while(rs.next()){
                        ?>
                        <tr>
                            <td><input type="checkbox" value="<%=rs.getString(1)%>" name="check"></td>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td>
                            </td>
                        </tr>
                        <%
                    }
                        %>
                        <!-- <tr>
                            <td><input type="checkbox"></td>
                            <td>456</td>
                            <td>Noisy Engine</td>
                            <td>8901</td>
                            <td>202</td>
                            <td>
                            </td>
                        </tr> -->
                    </tbody>
                </table>
            </div>
        </div>
        <div class="right-side d-flex flex-column justify-content-end buttons">
            <div class="">

                <button class="btn btn-success btn-icon mb-2" type="submit" name="statuss" value="Resolved">
                    <i class="fas fa-check"></i> Resolved
                </button>
                <button class="btn btn-danger btn-icon mb-2" type="submit" name="statuss" value="Denied">
                    <i class="fas fa-times"></i> Denied
                </button>
                <button class="btn btn-warning btn-icon" type="submit" name="statuss" value="Reopen">
                    <!-- Example of using the "reopen" icon -->
                    <i class="fas fa-door-open"></i>
                </i> Reopen
            </button>
        </div>
        </div>
    </div>
</form>
</body>

</html>