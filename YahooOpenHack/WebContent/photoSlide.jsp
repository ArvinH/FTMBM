<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<style type="text/css">

body {
	height: 50%;
	weight: 80%;
}


</style>
		<link type="text/css" href="styles/bottom.css" rel="stylesheet" />
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.jcarousel.min.js"></script>
		<script type="text/javascript" src="js/jquery.pikachoose.js"></script>
		<%
			 String imgUrl = request.getParameter("imgUrl");
			 System.out.print(imgUrl);
		%>
		<script language="javascript">
			$(document).ready(
				function (){
					$("#pikame").PikaChoose({carousel:true});
				});
		</script>
		
</head>
<body>
<!-- not really needed, i'm using it to center the gallery. -->
<div class="pikachoose">
	<ul id="pikame" class="jcarousel-skin-pika">
		<li><a href="http://www.pikachoose.com"><img src="<%=imgUrl%>"/></a><span>This is an example of the basic theme.</span></li>
		<li><a href="http://www.pikachoose.com"><img src="img/2.jpg"/></a><span>jCarousel is supported and can be integrated with PikaChoose!</span></li>
		<li><a href="http://www.pikachoose.com"><img src="img/3.jpg"/></a><span>Be sure to check out <a href="http://www.pikachoose.com">PikaChoose.com</a> for updates.</span></li>
		<li><a href="http://www.pikachoose.com"><img src="img/4.jpg"/></a><span>You can use any type of html you want with PikaChoose</span></li>
		<li><a href="http://www.pikachoose.com"><img src="img/5.jpg"/></a><span>PikaChoose survives on your donations! Keep the project alive with a donation.</span></li>
	</ul>
</div>

</div>
</body>
</html>
