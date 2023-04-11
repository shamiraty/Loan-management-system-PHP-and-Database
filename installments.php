<?php
//database connection

$conn=mysqli_connect('localhost','root','','loanmis');

//get login user from android
$username="";
if(isset($_POST['NationalID']))
{
    $username=mysqli_real_escape_string($conn,$_POST['NationalID']);
}
//then prepare query statement
$query=$conn->prepare
(
"select 
id,
format(InstalledAmount,2)as InstalledAmount,
National_ID,
DATE_FORMAT(created_at, '%M %e, %Y')as created_at,
EmployeeUsername
from installments where National_ID='$username'
"
);

//then execute the query

$query->execute();

//then bind the query results

$query->bind_result($id,$InstalledAmount,$National_ID,$created_at,$EmployeeUsername);

//prepare your query results to loop within array

$contents=array();

//then, use for loop to iterate the incoming row/ assign rows to variable 'data'

while($query->fetch())
{
    $data=array();
  
    $data['id']=$id;
    $data['InstalledAmount']=$InstalledAmount;
    $data['National_ID']=$National_ID;
    $data['created_at']=$created_at;
    $data['EmployeeUsername']=$EmployeeUsername;
  
    //now push the array

    array_push($contents,$data);
}

//finally, send data as 'keys' using json object:  will be sent as strings

echo json_encode($contents);

//--------------End-----you can contact me via whatsap +255675839840
?>