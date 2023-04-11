<?php
//database connection
$con=mysqli_connect('localhost','root','','loanmis');

//key from android
$username="";
if(isset($_POST['username']))
{
    $username=mysqli_real_escape_string($con,$_POST['username']);
}

$heading="";
if(isset($_POST['heading']))
{
    $heading=mysqli_real_escape_string($con,$_POST['heading']);
}
$message="";
if(isset($_POST['message']))
{
    $message=mysqli_real_escape_string($con,$_POST['message']);
}

//check message duplication
$sql="SELECT * from message where heading='$heading' AND NationalID='$username'";
//execute the query
$execute=mysqli_query($con,$sql);
//process results
if(mysqli_num_rows($execute)>0)
{
    //then send key to android app
    $status="ok";
    $resultCode=1;
    echo json_encode(array('status'=>$status,'resultCode'=>$resultCode));

}
else
{
    //if no duplicate heading then add message
    $insertMessage="INSERT INTO message (heading, message,NationalID) VALUES ('$heading', '$message', '$username')";
    $execute_query=mysqli_query($con,$insertMessage);
    if($execute_query)
    {
        $status="ok";
        $resultCode=0;
        echo json_encode(array('status'=>$status,'resultCode'=>$resultCode));

    }

}
?>



