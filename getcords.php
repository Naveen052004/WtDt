<?php
// Function to get data from the database

function getDataFromDatabase() {
    $host = 'localhost'; // Replace with your MySQL host
    $username = 'root'; // Replace with your MySQL username
    $password = 'Naveen@123'; // Replace with your MySQL password
    $dbName = 'pbl2.0'; // Replace with your MySQL database name

    $conn = new mysqli($host, $username, $password, $dbName);

    // Check the connection
    if ($conn->connect_error) {
        die('Connection failed: ' . $conn->connect_error);
    }
    
    // Query to fetch data from each column in the table
    $sql = "SELECT * FROM coords"; // Replace with your table name
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            // Access data from each column
            $lat = $row['lat']; // Replace 'column1' with the actual column name
            $lon = $row['lon']; // Replace 'column2' with the actual column name
            session_start();

$_SESSION['lat'] = $lat;
$_SESSION['lon'] = $lon;
        }
    } else {
        echo "No data found in the table.";
    }
    
    // Close the database connection
    $conn->close();
    ?>