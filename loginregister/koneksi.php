<?php

define('HOST','localhost');
define('USER','root');
define('PASS','');
define('DB','loginregister');

$con = mysqli_connect(HOST, USER, PASS, DB) or die ('Tidak Terkoneksi');

?>