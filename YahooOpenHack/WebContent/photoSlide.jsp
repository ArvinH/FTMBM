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
			 String imgURL = request.getParameter("imgURL");
			 String[] IMGURL = imgURL.split("#");
			 String distance = request.getParameter("distance");
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
		<%
		for(int i = 0; i< IMGURL.length-1;i++){
			out.println("<li><a href=\"http://www.pikachoose.com\"><img src=\""+IMGURL[i]+"\"/></a><span>distance:"+distance+"</span></li>");
		}
		
		%>
		
		
	</ul>
</div>

</div>
</body>
</html>
