<?php
include('header.php');
if ($_GET['action']=="addjob") {
	$requesterid=$_REQUEST['personid'];
	$title=$_POST['title'];
	$date=date('Y-m-d');
	$desc=$_POST['desc'];
	$budget=$_POST['budget'];
	mysql_query("INSERT INTO jobs(title,description,budget,requester_id,dateposted,status)VALUES('$title','$desc','$budget','$requesterid','$date','0')");
	$lid=mysql_fetch_array(mysql_query("SELECT id from jobs order by id desc limit 1"));
	$jobid=$lid['id'];
	for ($i=0; $i<count($_POST['platforms']) ; $i++) { 
	$platformid=$_POST['platforms'][$i];
		mysql_query("INSERT INTO jobplatform(jobid,platformid)VALUES('$jobid','$platformid')");
		echo "<script>location.replace('myjobs.php')</script>";
	}

}