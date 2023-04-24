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

        $sql = "SELECT id, firstname, lastname, city, street, streetnumber FROM MyGuests";
        $result = mysqli_query($conn, $sql);

        if (mysqli_num_rows($result) > 0) {
            // output data of each row
            while($row = mysqli_fetch_assoc($result)) {
                echo "id: " . $row["id"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. "You live in:  " . $row["street"] . ", " . $row["streetnumber"] . ", " . $row["city"] . "." . "<br>";
            }
        } else {
            echo "0 results";
        }
        ?>
    </body>
</html>