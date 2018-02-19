<?php
include('../auth.php');
session_start();
if(isset($_POST))
{

 
$email=SanitizeString($_POST['login']);
$pass=md5(SanitizeString($_POST['password']));
$query="SELECT  username,personid from users where email='$email' and hashpassword='$pass'";
$result=queryMysql($query);
$query2="SELECT  pr.roleid AS typer from personroles pr inner join users u on u.personid=pr.id  where u.email='$email'";
$result1=mysql_query($query2);
$num = mysql_num_rows($result);
if (mysql_num_rows($result)!=0)
{
for ($j = 0 ; $j < $num ; ++$j)
 {
    $row = mysql_fetch_row($result);
    $user=$row[0];
    $personid=$row[1];
 }
//saveUser($usersName);
 //session_start();
 $_SESSION['user'] = $user;
 $_SESSION['personid'] = $personid;
 $_SESSION['loggedIn']='TRUE';
 $roles=mysql_fetch_array($result1);
$role=$roles['typer'];

 if ($role=="1") {
echo "<script>location.replace('../client/index.php')</script>";	 

 }elseif ($role=="2") {

echo "<script>location.replace('../freelancer/index.php')</script>";	 
 }elseif ($role=="3") {

echo "<script>location.replace('../admin/index.php')</script>";	 
 }
    


}
else
{
    echo "<script type='text/javascript'>alert('No such user was found')</script>";
    $_SESSION['loggedIn']=FALSE;
 echo <<<Home
<script type="text/javascript">
location.replace("index.php");

</script>
Home;
}



}
