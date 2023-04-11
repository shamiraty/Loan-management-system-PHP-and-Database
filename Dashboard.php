<?php
//database connection
$conn=mysqli_connect('localhost','root','','loanmis');

$username="";
if(isset($_POST['NationalID']))
{
    $username=mysqli_real_escape_string($conn,$_POST['NationalID']);
}
//then prepare query statement
$query=$conn->prepare
(
"select 
format(RequestedLoan,2)as RequestedLoan,
LoanTax,
DirectCost,
format(TotalLoanCost,2)as TotalLoanCost,
format(TakenAmount,2)as TakenAmount,
format(ActualDebt,2)as ActualDebt,
DATE_FORMAT(created_at, '%M %e, %Y')as created_at,
format(RemainAmount,2)as RemainAmount,
Status 
from Customers where NationalID='$username'
"
);

//then execute the query

$query->execute();

//then bind the query from above

$query->bind_result($RequestedLoan,$LoanTax,$DirectCost,$TotalLoanCost,$TakenAmount,$ActualDebt,$created_at,$RemainAmount,$Status);

//after there, prepare your query results to loop within array

$contents=array();

//then, use for loop to iterate the incoming row/ assign rows to variable 'data'

while($query->fetch())
{
    $data=array();
  
    $data['RequestedLoan']=$RequestedLoan;
    $data['LoanTax']=$LoanTax;
    $data['DirectCost']=$DirectCost;
    $data['TotalLoanCost']=$TotalLoanCost;
    $data['TakenAmount']=$TakenAmount;
    $data['ActualDebt']=$ActualDebt;
    $data['created_at']=$created_at;
    $data['RemainAmount']=$RemainAmount;
    $data['Status']=$Status;


    //now push the array

    array_push($contents,$data);
}

//finally, send data as 'keys' using json object:  will be sent as string

echo json_encode($contents);

//--------------End-----you can contact me via whatsap +255675839840
?>