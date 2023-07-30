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
            /* width: 70%; */
            margin-bottom: 10px;
        }

        .right-side .btn-icon {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .overset {
            height: 720px;
            overflow: scroll;
            width: 1172px;
        }

        .buttons {
            display: inline-block;
            margin: auto;
        }
    </style>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <script>
        const test = (id) => {
            let a = document.getElementsByName(id);
            console.log(a.length);
            for (let i = 0; i < a.length; i++) {
                var old = document.getElementsByName("olddata")[i];

                var new1 = document.getElementsByName("newdata")[i];
                if (i == 3) {
                    old.value = a[i].value;
                    new1.value = a[i].value;
                }
                else {
                    console.log(a[i].textContent);
                    old.value = a[i].textContent;
                    new1.value = a[i].textContent;
                }
            }
        }
        const clearf = () => {
            var old = document.getElementsByName("olddata");
            var new1 = document.getElementsByName("newdata");
            for (let i = 0; i < old.length; i++) {
                old[i].value = "";
                new1[i].value = "";
            }
        }
        const togglepass = () => {
            var old = document.getElementsByName("olddata")[3];
            var new1 = document.getElementsByName("newdata")[3];
            if(old.type==='password'){
                old.type='text';
                new1.type='text';
                document.getElementById("toggpass").textContent="Hide Password";
            }
            else{
                old.type='password';
                new1.type='password';
                document.getElementById("toggpass").textContent="Show Password";
            }
        }
    </script>
    </head>

    <body>
        <nav class="navbar navbar-expand-md">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="admin.jsp">Complaints</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Bus Pass Verify</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" style="text-decoration: underline;">Bus Driver</a>
                </li>
            </ul>
        </nav>
        <div class="container-fluid" id="content">
            <div class="left-side">
                <div class="table-container mt-4 overset">
                    <h1 class=" mb-4">Drivers Info</h1>
                    <table>
                        <thead>
                            <tr>
                                <th>S.No</th>
                                <th>Name</th>
                                <th>Bus No</th>
                                <th>Uname</th>
                                <th>Password</th>
                                <th>Pho_No</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%ResultSet rs=s.executeQuery("SELECT * FROM drivers_info"); int i=0; while(rs.next()){ %>
                                <tr>
                                    <td><%=++i%></td>
                                    <td name="<%=i%>"><%=rs.getString(1)%></td>
                                    <td name="<%=i%>"><%=rs.getString(2)%></td>
                                    <td name="<%=i%>"><%=rs.getString(3)%></td>
                                    <td><input type="password" value="<%=rs.getString(4)%>" name="<%=i%>"style="width: 30%;" disabled></td>
                                    <td name="<%=i%>"><%=rs.getString(5)%></td>
                                    <td><button id="<%=i%>" onclick="test(this.id)"><i class='fas fa-edit'></i></button></td>
                                </tr>
                                <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="right-side d-flex flex-column justify-content-end buttons">
                <form action="driversupdate.jsp" onsubmit="return confirm('Do you want to continue')">
                    <div class="container">
                        <h2 style="font-size: x-large;">Present Data</h2><br>
                        Name : <input name="olddata" type="text" readonly><br><br>
                        Bus No : <input name="olddata" type="text" readonly><br><br>
                        Uname : <input name="olddata" type="text" readonly><br><br>
                        Password : <input name="olddata" type="password" readonly><br><br>
                        Pho_No : <input type="text" name="olddata" readonly>
                    </div><br>
                    <div class="container">
                        <h2 style="font-size: x-large;">Update Data</h2><br>
                        Name : <input name="newdata" type="text"><br><br>
                        Bus No : <input name="newdata" type="text"><br><br>
                        Uname : <input name="newdata" type="text"><br><br>
                        Password : <input name="newdata" type="password"><br><br>
                        Pho_No : <input type="text" name="newdata">
                    </div><br>
                    <div style="align-items: center;">
                        <button type="submit" class="btn btn-primary">Update</button>
                        <button type="button" class="btn btn-danger" onclick="togglepass()" id="toggpass">Show Password</button>
                        <button type="button" class="btn btn-success" onclick="clearf()">Clear</button>
                    </div>
                    
                </form>
            </div>
        </div>
    </body>
    <script>

    </script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>

    </html>