<?php
$name=$_POST["first_name"];
$surname=$_POST["surname"];
$birthyear=$_POST["birthyear"];
$street=$_POST["street"];
$apartmentnum=$_POST["apartmentnum"];
$housenum=$_POST["housenum"];
$postcode=$_POST["postcode"];
$city=$_POST["city"];
$current_year = date("Y");
echo "Hello $name $surname, you are ".($current_year-$birthyear)." years old. You live at $street $housenum/$apartmentnum, $postcode $city.";
?>