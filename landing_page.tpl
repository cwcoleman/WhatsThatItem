
<!DOCTYPE html>
<!-- HTML5 Hello world by kirupa - http://www.kirupa.com/html5/getting_your_feet_wet_html5_pg1.htm -->
<html lang="en-us">

<head>
<meta charset="utf-8">
<title>FergiFinder: Part identification made easy!</title>
<style type="text/css">
#mainContent {
	font-family: Arial, Helvetica, sans-serif;
	font-size: xx-large;
	font-weight: bold;
	background-color: #00446B;
	border-radius: 4px;
	padding: 10px;
	text-align: center;
}
body {
         margin: 0;
         padding: 0;
         overflow: hidden;
         height: 100%;
         max-height: 100%;
         font-family:Sans-serif;
         line-height: 1.5em;
	
}

#header {
         position: absolute;
         top: 0;
         left: 0;
         width: 100%;
         height: 100px;
         overflow: hidden; /* Disables scrollbars on the navigation frame. To enable scrollbars, change "hidden" to "scroll" */
         background: #00446B;
      }
#logo {
         padding:10px;
         float:left;
         color: #FFFFFF;
      }

.buttonStyle {
	border-radius: 4px;
	border: thin solid #F0E020;
	padding: 5px;
	background-color: #F8F094;
	font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
	font-weight: bold;
	color: #663300;
	width: 75px;
}

.buttonStyle:hover {
	border: thin solid #FFCC00;
	background-color: #FCF9D6;
	color: #996633;
	cursor: pointer;
}
.buttonStyle:active {
	border: thin solid #99CC00;
	background-color: #F5FFD2;
	color: #669900;
	cursor: pointer;
}

</style>
</head>

<body>
<div id="mainContent">

</div>
<script>
var myButton = document.getElementById("clickButton");
var myText = document.getElementById("helloText");

</script>
<header id="header">
<div id="logo">
            <h1>FergiFinder</h1>
         </div>
</header>
<br>
<br>
<br>
<p>Take a picture of the part, scan a barcode or enter the name: </p>
<form action="/" method="post" enctype="multipart/form-data">
    <p>   Picture upload: <input name="images_file" type="file" /></p>
    <p>   Scan barcode: <input name="barcode" type="file" /></p>
    <p>   Name of part: <input name="part_name" type="text" /></p>
    <input value="search" type="submit" />
</form>
</body>
</html>
