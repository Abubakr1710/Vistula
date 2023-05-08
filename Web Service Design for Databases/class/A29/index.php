<!DOCTYPE html>
<html>
    <body>
        <?php
        define("SERVERNAME", "fdb1028.awardspace.net");
        define("USERNAME", "4297006_52493");
        define("PASSWORD", "esELbf@brf72TEm");
        define("DBNAME", "4297006_52493");
        
        // Create connection
        $conn = mysqli_connect(SERVERNAME, USERNAME, PASSWORD, DBNAME);
        // Check connection
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }

        $sql = "INSERT INTO MyGuests VALUES(NULL, 'Alex', 'John', 'London', 'Greenyard', '12')"

        if (mysqli_query($conn, $sql)){
            echo "New record created successfully";
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn)
        }

        mysqli_close($conn)
        ?>
    </body>
</html>