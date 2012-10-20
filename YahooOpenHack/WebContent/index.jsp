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
	background-image: url(img/retina_wood.png);
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
<script type="text/javascript" src="js/geolocation.js"></script>
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
	if (clientIP.contains("192") || clientIP.contains("0:0:0:0:1")) {
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



<!-- google map javascript -->
<script type="text/javascript">

var map;

function addMarker(map,lat,lon,imgUrl){
	var myLatlng = new google.maps.LatLng(lat, lon);	
	var image = 'img/location.png';
	  
	  var Marker = new google.maps.Marker({
		  animation: google.maps.Animation.DROP,
	      position: myLatlng,
	      icon: image
	  });
	  map.setCenter(myLatlng);
	  Marker.setMap(map);

	  google.maps.event.addListener(Marker, "click", function() { 
		 
			  window.frames["photoSlide"].location.href="photoSlide.jsp?imgUrl="+imgUrl;
			  $('#myModal').modal('show');
			  
      });
	  
	  
}
function googlemapInitialize(){
	// 取得ip位置後，解析經緯度->show在map上  
	$(function() {
	
				GEO_LOCATION.getLocation(function(latitude,longitude) {  
					console.log(latitude+longitude);
			    $('#msg').append("latitud: "+latitude+"</br>"+"longitude: "+longitude);
			    
			    var myLatlng = new google.maps.LatLng(latitude, longitude);
			    	var myOptions = {
			    			  zoom: 18,
			    			  center: myLatlng,
			    			  mapTypeId: google.maps.MapTypeId.ROADMAP
			    			};
			    			 map = new google.maps.Map(document.getElementById("map_canvas"),
			    				    myOptions);
			    			addMarker(map,latitude, longitude,"http://farm9.staticflickr.com/8053/8086192864_256d21bdc5.jpg");
			    
				},12000);
			    	
			 
//		}
	/*	else {
			 var myLatlng = new google.maps.LatLng('25.0412', '121.5454');
		    	var myOptions = {
		    			  zoom: 18,
		    			  center: myLatlng,
		    			  mapTypeId: google.maps.MapTypeId.ROADMAP
		    			};
		    			 map = new google.maps.Map(document.getElementById("map_canvas"),
		    				    myOptions);
		    			addMarker(map,'25.0412', '121.5454',"http://farm9.staticflickr.com/8053/8086192864_256d21bdc5.jpg");			 
		} */
		});
	
}
</script>



<!-- html body -->

<body onload="googlemapInitialize()">


	<div id="clientIP" style="display: none"><%=clientIP%></div>
	<div style="text-align: center; position: relative; Top: 10%">
		<h3 style="font-family: 'Arizonia', cursive; font-size: 64px">Feel
			the most beautiful moment</h3>
	</div>
	<div style="text-align: center; position: relative; Top: 17%">
		<div class="navbar-form">
			<input type="text" class="span9"
				placeholder="place, view, people or anything you want to see">
			<button id="submit" type="submit" class="btn btn-success">Submit</button>
			<button id="addMarkerTest" type="button" value="addMarker" class="btn">addMaker</button>
		</div>
	</div>


	<!-- google map -->
	<div id="map_canvas" class="container"></div>
	
	
<!-- modal  -->
<div class="modal hide fade in" id="myModal"  style="display: none;" >
  <div class="modal-header">
    <a class="close" data-dismiss="modal">×</a>
    <h3>Modal Test</h3>
  </div>
  <div class="modal-iframe">
  <iframe class="modal-iframe" name="photoSlide" src="about:blank" frameborder="0"></iframe>
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
	$('#addMarkerTest').click(function(){
		$.get('getphoto.do',{},function(Result){
			for(var i=0; i < Result.length; i++){
			addMarker(map,Result[i].latitude,Result[i].longitude,Result[i].imgUrl);
			console.log('error');
			console.log(Result[i].latitude);
			console.log(Result[i].longitude);
			console.log(Result[i].imgUrl);
			
			}
		});
	});
		

	
	$('#submit')
			.click(
					function() {
						var i = 0;
						$
								.getJSON(
										'http://query.yahooapis.com/v1/public/yql?q=select * from flickr.photos.search(0) where text=\"sunrise\" and has_geo=1 and lat=22.993299484253 and lon=120.20359802246 and content_type=1 and api_key=\"'
												+ appid
												+ '\" and radius=20 limit 5&format=json',
										function(data) {
											$.each(
													data.query.results.photo,
													function() {
																$.getJSON(
																		'http://query.yahooapis.com/v1/public/yql?q=select id,title,location.latitude,location.longitude,dates.taken,farm,server,secret from flickr.photos.info where photo_id='
																						+ data.query.results.photo[i].id
																						+ ' and api_key=\"'
																						+ appid
																						+ '\"&format=json',
																				function(data) {
																					$.post('getphoto.do',
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
																									function(Result) {
																									//	addMarker(map,Result.latitude,Result.longitude,Result.imgUrl);
																									});
																					
																				});
																i++;
															});

										});

					});


</script>
</html>
