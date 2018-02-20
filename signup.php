<?php
include('auth.php');
if ($_GET['action']=="register") {
	$username=$_POST['username'];
	$name=$_POST['name'];
	$email=$_POST['email'];
	$tel=$_POST['tel'];
	$role=$_POST['role'];
	$password=md5($_POST['password']);
	$date=date('Y-m-d');
	mysql_query("INSERT INTO person(name,email,tel,dateregistered)VALUES('$name','$email','$tel','$date')");
	 $idquery=mysql_query("SELECT id from person order by id desc limit 1") ;
	 $pid=mysql_fetch_array($idquery);
	 $id=$pid['id'];
	 mysql_query("INSERT INTO personroles(personid,roleid)VALUES('$id','$role')");
mysql_query("INSERT INTO users(personid,hashpassword,username,email,status) VALUES('$id','$password','$username','$email','1')");
echo "<script>location.replace('index.php')('')</script>";
}