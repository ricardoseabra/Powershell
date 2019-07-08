
#SMTP Server and port may differ for different email service provider
$SMTPServer = "smtp.office365.com"
$SMTPPort = "587"

#Your email id and password
$Username = "username@somedomain"
$Password = "colocar a tua pass" #clear text :(


#Mail data
$to = "to_email@somedomain.com"
$cc = "cc_email@somedomain.com"
$subject = "New Users"
#$file = "C:\SendMail\Atachments\image004.jpg"

#Array Users
#$listaUsers = "User1", "User2", "User3"

$listaUsers = $args[0]
$listaUsers_str = ""
foreach ($newuser in $listaUsers)
{
	$listaUsers_str = $listaUsers_str + $newuser + "`n`r"
}	


#write-host $listaUsers_str


	
#$body = @"

#<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
#<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:w="urn:schemas-microsoft-com:office:word" xmlns:m="http://schemas.microsoft.com/office/2004/12/omml" xmlns="http://www.w3.org/TR/REC-html40"><head><meta name=Generator content="Microsoft Word 15 (filtered medium)"><!--[if !mso]><style>v\:* {behavior:url(#default#VML);}

#<p>Foram Criados os seguintes Utilizadores</p>
#<p>$listaUsers_str</p>

#</body>
#</html>


#"@
$body = "Foram Criados os seguintes Utilizadores`n" + $listaUsers_str
	
	
$secpasswd = ConvertTo-SecureString $Password -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ($Username, $secpasswd)
	
	
Send-MailMessage -To $to -SmtpServer $SMTPServer -Credential $mycreds -UseSsl $subject -Port $SMTPPort -Body $body -From "user@somedomain.com" #-BodyAsHtml -Attachments $file
    