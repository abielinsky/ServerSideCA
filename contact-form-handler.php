<?php

$errors = '';
$myemail = 'd00251844@student.dkit.ie';// <-----Put your DkIT email address here.
if(empty($_POST['name'])  ||
   empty($_POST['email']) ||
   empty($_POST['phone']) ||
   empty($_POST['terms']) ||
   empty($_POST['birthdate']) ||
   empty($_POST['gender']) ||
   empty($_POST['country']) ||
   empty($_POST['datetime']) ||
   empty($_POST['file']) ||
   empty($_POST['message']))
{
    $errors .= "\n Error: all fields are required";
}

$headers = '';
// Important: Create email headers to avoid spam folder
$headers .= 'From: '.$myemail."\r\n".
    'Reply-To: '.$myemail."\r\n" .
    'X-Mailer: PHP/' . phpversion();


$Name = $_POST['name'];
$Email_address = $_POST['email'];
$Phone = $_POST['phone'];
$Message = $_POST['message'];
$Terms = $_POST['terms'];
$Birthdate = $_POST['birthdate'];
$Gender = $_POST['gender'];
$Country = $_POST['country'];
$Datetime = $_POST['datetime'];
$File = $_POST['file'];

if (!preg_match(
"/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/i",
$Email_address))
{
    $errors .= "\n Error: Invalid email address";
}

if( empty($errors))
{
        $to = $myemail;
        $email_subject = "Contact form submission: $Name";
        $email_body = "You have received a new message. ".

        " Here are the details:\n  
        Name: $Name \n         
        Email: $Email_address \n 
        
        Birthdate: $Birthdate \n 
        Phone: $Phone \n 
        Terms: $Terms \n 
        Gender: $Gender \n 
        Country: $Country \n 
        Datetime: $Datetime \n 
        File: $File \n
        Message: \n $Message";

        mail($to,$email_subject,$email_body,$headers);
        //redirect to the 'thank you' page
        header('Location: thank-you.php');
}
?>
<!DOCTYPE HTML>
<html>
<head>
        <title>Contact form handler</title>
</head>

<body>
<!-- This page is displayed only if there is some error -->
<?php
echo nl2br($errors);
?>
</body>
</html>