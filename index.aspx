<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DigitalizacionDocumentos.index" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>HTML5 File API</title>
 
    <link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="main">
		<h1>Upload Your Images</h1>
		<form method="post" enctype="multipart/form-data"  action="upload.php">
    		<input type="file" name="images" id="images" multiple />
    		<button type="submit" id="btn">Upload Files!</button>
    	</form>

  	<div id="response"></div>
		<ul id="image-list">

		</ul>
	</div>
	
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
 

        <script src="js/upload.js" type="text/javascript"></script>
</body>
</html>
