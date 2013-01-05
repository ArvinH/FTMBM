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

		<%
		 String pids = request.getParameter("PID");
		System.out.println(pids);
		 String[] PID = pids.split("-");
		%>
</head>



<script type="text/javascript">

var appid = "63d0f7b2e9592d8f5ad413cc5c60e551";
	var ids = "<%=pids%>";
	var id = "";
	var urls = new Array();
	if (ids.indexOf('-')){
	id = ids.split("-");
	}
	else{
		id = ids;
	}
	var url = "";
	//id只有一個的時候可能有問題
	var i = 0;
		$.each(
				id,
				function() {
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
						urls[i] = url;
						console.log(i+" "+url);
						$('#pikame ').append("<img src=\""+url+"\"/><span></span>");

					});  
	 			i++;
				});


</script>

<body>

	<div id="pikame" >
	
	</div>

</body>

</html>
