<?php
$con=mysqli_connect('localhost','root','','loanmis');

//receive username and password from android
$username="199008037744";
if(isset($_POST['username']))
{
	$username=mysqli_real_escape_string($con,$_POST['username']);
}

$password="a";
if(isset($_POST['password']))
{
	$password=mysqli_real_escape_string($con,MD5($_POST['password']));
}

//create query to select data from dba_close
$sql="SELECT * from Customers where NationalID='$username' AND password='$password'";
//execute the query
$execute=mysqli_query($con,$sql);
//process results
if(mysqli_num_rows($execute)>0)
{
	//username and password are correct
	$captureData=mysqli_fetch_assoc($execute);
	$fullname=$captureData['Fullname'];
	$NationalID=$captureData['NationalID'];
   
	//send keys to android app
	$status="ok";
	$resultCode=1;
	echo json_encode(array('Fullname'=>$fullname,'NationalID'=>$NationalID,'status'=>$status,'resultCode'=>$resultCode));

}
else
{
	//username and password are not correct
	//send keys to android app
	$status="ok";
	$resultCode=0;
	echo json_encode(array('status'=>$status,'result_code'=>$resultCode));

}



?>