<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Yahoo Open Hack Day!!</title>

<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0px;
	padding: 0px;
	background-image: url(img/background1.jpg);
}

#map_canvas {
	height: 65%;
	Top: 22%;
}
.modal-iframe {

     height: 450px;
     width : 600px;
    
  }
  .modal {
     height: 580px;
     width : 800px;
  }
</style>
<!-- google map api lib -->
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript"
	src="https://maps.google.com/maps/api/js?sensor=false">
</script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%
	//取client端的ip與日期
	long start = session.getCreationTime();
	Date creationTime = new Date(session.getCreationTime());
	DateFormat dateFormat = new SimpleDateFormat("EE-MM-dd-yyyy");
	String time = dateFormat.format(creationTime);
	String clientIP = request.getRemoteAddr();
	if (clientIP.contains("192")) {
		clientIP = "0";
	}
%>
<!-- twitter bootstrap lib -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.jcarousel.min.js"></script>
<script type="text/javascript" src="js/jquery.pikachoose.js"></script>
<!-- google web-font 
<link href='http://fonts.googleapis.com/css?family=Knewave' rel='stylesheet' type='text/css'>
-->
<link href='http://fonts.googleapis.com/css?family=Arizonia'
	rel='stylesheet' type='text/css'>
</head>

<script type="text/javascript">
function addMarker(){
	
	
}
function googlemapInitialize(){
	// 取得ip位置後，解析經緯度->show在map上  
	$(function() {
		if (<%=clientIP%> != 0){
		$.getJSON('http://geoip.pidgets.com?ip='+<%=clientIP%>+'&format=json',
				function(data) {  
			    $('#msg').append("latitud: "+data.latitude+"</br>"+"longitude: "+data.longitude);
			    if(data.latitude != null){
			    var myLatlng = new google.maps.LatLng(data.latitude, data.longitude);
			    	var myOptions = {
			    			  zoom: 18,
			    			  center: myLatlng,
			    			  mapTypeId: google.maps.MapTypeId.ROADMAP
			    			};
			    			var map = new google.maps.Map(document.getElementById("map_canvas"),
			    				    myOptions);
			    }
			    	
			});  
		}
		else {
			 var myLatlng = new google.maps.LatLng('25.0412', '121.5454');
		    	var myOptions = {
		    			  zoom: 18,
		    			  center: myLatlng,
		    			  mapTypeId: google.maps.MapTypeId.ROADMAP
		    			};
		    			var map = new google.maps.Map(document.getElementById("map_canvas"),
		    				    myOptions);
		    			var image = 'img/location.png';
		    			  
		    			  var beachMarker = new google.maps.Marker({
		    			      position: myLatlng,
		    			      map: map,
		    			      icon: image
		    			  });
		    			  var content = "<div style='width:360px;height:700px;background-color:Yellow'><h3>Hello marker!</h3></div>";
		    			  google.maps.event.addListener(beachMarker, "click", function() {

		    				  
		    				  
		    				  google.maps.event.addListener(beachMarker, 'click', function() {
		    					  
		    					  window.frames["NewFile"].location.href="with-carousel.html";
		    					  $('#myModal').modal('show');
		    					  
		    					  });
 
		    	            });

		}
		});
	
}
</script>

<!-- html body -->

<body onload="googlemapInitialize()">


	<div id="clientIP" style="display: none"><%=clientIP%></div>

	<!-- 
	主要啟動功能的button
	<input id="get" type="button" value="get" class="btn"/>
	<input id="getPhotoInfo" type="button" value="getPhotoInfo" class="btn" />
	<input id="sendToBackend" type="button" value="sendToBackend" class="btn"/>
	<input id="getServlet" type="button" value="getServlet" class="btn"/>
	<input id="sendToBackend" type="button" value="sendToBackend" class="btn"/>
	<div id="msg"></div>
-->
	<div style="text-align: center; position: relative; Top: 10%">
		<h3 style="font-family: 'Arizonia', cursive; font-size: 64px">Feel
			the most beautiful moment</h3>
	</div>
	<div style="text-align: center; position: relative; Top: 17%">
		<div class="navbar-form">
			<input type="text" class="span9"
				placeholder="place, view, people or anything you want to see">
			<button id="submit" type="submit" class="btn btn-success">Submit</button>
			<button id="modaltest" type="submit" class="btn btn-success">modaltest</button>
		</div>
	</div>


	<!-- google map -->
	<div id="map_canvas" class="container"></div>
	
	
<!-- modal  -->
<div class="modal" id="myModal" style="display: none;">
  <div class="modal-header">
    <a class="close" data-dismiss="modal">×</a>
    <h3>Modal Test</h3>
  </div>
  <div class="modal-iframe">
  <iframe class="modal-iframe" name="NewFile" src="about:blank" frameborder="0"></iframe>
  </div>
  <div class="modal-footer" style="text-align:center">
  </div>
</div>



</body>

<!-- 

javascript 


 -->


<script type="text/javascript">
	var appid = "63d0f7b2e9592d8f5ad413cc5c60e551";

	
	$('#submit')
			.click(
					function() {
						var i = 0;
						$
								.getJSON(
										'http://query.yahooapis.com/v1/public/yql?q=select * from flickr.photos.search(0) where text=\"sunrise\" and has_geo=1 and lat=22.993299484253 and lon=120.20359802246 and content_type=1 and api_key=\"'
												+ appid
												+ '\" and radius=20 &format=json',
										function(data) {
											$
													.each(
															data.query.results.photo,
															function() {
																$
																		.getJSON(
																				'http://query.yahooapis.com/v1/public/yql?q=select id,title,location,dates,farm,server,secret from flickr.photos.info where photo_id='
																						+ data.query.results.photo[i].id
																						+ ' and api_key=\"'
																						+ appid
																						+ '\"&format=json',
																				function(
																						data) {
																					$
																							.post(
																									'getphoto.do',
																									{
																										id : encodeURI(data.query.results.photo.id),
																										title : encodeURI(data.query.results.photo.title),
																										farm : encodeURI(data.query.results.photo.farm),
																										server : encodeURI(data.query.results.photo.server),
																										secret : encodeURI(data.query.results.photo.secret),
																										takendate : encodeURI(data.query.results.photo.dates.taken),
																										latitude : encodeURI(data.query.results.photo.location.latitude),
																										longitude : encodeURI(data.query.results.photo.location.longitude)
																									},
																									function(
																											data) {

																									});
																				});
																i++;
															});

										});

					});


</script>
</html>