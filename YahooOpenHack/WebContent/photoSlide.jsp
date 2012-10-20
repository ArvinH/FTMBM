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
		<script type="text/javascript">
		
				function Ready(){
					$("#pikame").PikaChoose();
				}
		</script>
		<%
		 String pids = request.getParameter("PID");
		System.out.println(pids);
		 String[] PID = pids.split("-");
	/* 	for(int i = 0; i< IMGURL.length-1;i++){
			out.println("<li><a href=\"http://www.pikachoose.com\"><img src=\""+IMGURL[i]+"\"/></a><span></span></li>");
		} */
		
		%>
</head>

<body>
<!-- not really needed, i'm using it to center the gallery. class="jcarousel-skin-pika"-->
<div class="pikachoose">
	<ul id="pikame" >
	
	</ul>
</div>
</body>

<script type="text/javascript">
var appid = "63d0f7b2e9592d8f5ad413cc5c60e551";
	var ids = "<%=pids%>";
	var id = "";
	if (ids.indexOf('-')){
	id = ids.split("-");
	}
	else{
		id = ids;
		console.log(id);
	}
	console.log(id);
	var url = "";
	for(var i = 0; i < id.length;i++){
		 
	 		$.getJSON('http://query.yahooapis.com/v1/public/yql?q=select id,title,farm,server,secret from flickr.photos.info where photo_id='
					+ id[i]
					+ ' and api_key=\"'
					+ appid
					+ '\"&format=json',{},function(data){
						pid = data.query.results.photo.id;
						pfarm = data.query.results.photo.farm;
						pserver = data.query.results.photo.server;
						psecret = data.query.results.photo.secret;
						url = "http://farm"+pfarm+".staticflickr.com/"+pserver+"/"+pid+"_"+psecret+".jpg";
					
						
							$('.pikachoose #pikame ').append("<li><img src=\""+url+"\"/><span></span></li>");
						
						
					});  
	}
	Ready();

</script>

</html>
