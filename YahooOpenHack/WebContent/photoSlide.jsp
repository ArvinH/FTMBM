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
		<script language="javascript">
			$(document).ready(
				function (){
					$("#pikame").PikaChoose({carousel:true});
				});
		</script>
		<%
		 String pids = request.getParameter("PID");
		System.out.println(pids);
		 String[] PID = pids.split("-");
		 System.out.println(PID[1]);
	/* 	for(int i = 0; i< IMGURL.length-1;i++){
			out.println("<li><a href=\"http://www.pikachoose.com\"><img src=\""+IMGURL[i]+"\"/></a><span></span></li>");
		} */
		
		%>
</head>

<body>
<!-- not really needed, i'm using it to center the gallery. -->
<div class="pikachoose">
	<ul id="pikame" class="jcarousel-skin-pika">
		
		
	</ul>
</div>
</body>

<script type="text/javascript">
var appid = "63d0f7b2e9592d8f5ad413cc5c60e551";
	var ids = "<%=pids%>";
	var id = ids.split("-");
	console.log(id);
	var url = "";
	for(var i = 0; id.length;i++){
		
	/* 		$.getJSON('http://query.yahooapis.com/v1/public/yql?q=select title,farm,server,secret from flickr.photos.info where photo_id='
					+ id[i]
					+ ' and api_key=\"'
					+ appid
					+ '\"&format=json',{},function(Result){
						pid = data.query.results.photo.id;
						pfarm = data.query.results.photo.farm;
						pserver = data.query.results.photo.server;
						psecret = data.query.results.photo.secret;
						url = "http://farm"+pfarm+".staticflickr.com/"+pserver+"/"+pid+"_"+psecret+".jpg";
					//	$('#pikame').append("<li><a href=\"http://www.pikachoose.com\"><img src=\""+url+"\"/></a><span></span></li>");
					}); */
	}

</script>
</html>
