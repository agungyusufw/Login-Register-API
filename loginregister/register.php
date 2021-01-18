<?php

require "koneksi.php";

if($_SERVER['REQUEST_METHOD'] == "POST"){
	$response = array();
	$nama = $_POST['nama'];
	$email = $_POST['email'];
	$password = $_POST['password'];

	$cek = "SELECT * FROM user WHERE email='$email'";
	$result = mysqli_fetch_array(mysqli_query($con,$cek));

	if(isset($result)){
		$response['value'] = 2;
		$response['message'] = 'Email Telah Digunakkan';
		echo json_encode($response);
	}else{
		$insert = "INSERT INTO user VALUE(NULL,'$nama','$email','$password')";
		if(mysqli_query($con,$insert)){
			$response['value'] = 1;
			$response['message'] = 'Email Berhasil Didaftarkan';
			echo json_encode($response);
		}else{
			$response['value'] = 0;
			$response['message'] = 'Email Gagal Didaftarkan';
		}
	}
}

?>