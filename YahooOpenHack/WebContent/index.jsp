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
var original_lat;
var original_lon;
function addMarkerWhenQuery(map,lat,lon,imgUrl,distance){
	var myLatlng = new google.maps.LatLng(lat, lon);	
	var image = 'img/location.png';
	var imgURL = "";
	  var Marker = new google.maps.Marker({
		  animation: google.maps.Animation.DROP,
	      position: myLatlng,
	      icon: image
	  });
	  map.setCenter(myLatlng);
	  Marker.setMap(map);

	  google.maps.event.addListener(Marker, "click", function() { 
	  for(var i = 0; imgUrl[i].length; i++){
		  imgURL += imgUrl[i].imgURL+"#";
	  }
	  console.log(imgURL);
			  window.frames["photoSlide"].location.href="photoSlide.jsp?imgUrl="+imgURL+"&distance="+distance;
			  $('#myModal').modal('show');
			  
      });
	  
	  
}
function addMarker(map,lat,lon,imgUrl,distance){
	var myLatlng = new google.maps.LatLng(lat, lon);	
	var image = 'img/location.png';
	 var imgURL;
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
			    original_lat = latitude;
			    original_lon = longitude;
			    var myLatlng = new google.maps.LatLng(latitude, longitude);
			    	var myOptions = {
			    			  zoom: 12,
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
			<button id="addMarkerTest" type="button" class="btn btn-success" value="addMarker" class="btn">Enter</button>
			<button id="GetInfo" type="submit" class="btn btn-success">GetInfo</button>
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
			console.log(original_lat);
			console.log(original_lon);
			var distance = 0;
			for(var i=0; i < Result.length; i++){
				//處理雙層array
				$.getJSON('http://maps.googleapis.com/maps/api/distancematrix/json?origins='+original_lat+','+original_lon+'&destinations='+Result[i][0].latitude+','+Result[i][0].longitude,{},
							function(Result){
					distance = Result;
						//計算好此Group的重心與使用者所在地點的距離
					});
				for(var j=0; j< Result[i].length; j++){
					//處理每一筆Group的內容
			/* 		console.log(Result[i][j].photoId);
					console.log(Result[i][j].latitude);
					console.log(Result[i][j].longitude);
					console.log(Result[i][j].imgURL); */
				}
				addMarkerWhenQuery(map,Result[i][0].latitude,Result[i][0].longitude,Result[i],distance);
		/*		
			addMarker(map,Result[i].latitude,Result[i].longitude,Result[i].imgUrl);
			console.log('error');
			console.log(Result[i].latitude);
			console.log(Result[i].longitude);
			console.log(Result[i].imgUrl);
		*/
			}
		});
	});

	$('#GetInfo')
			.click(
					function() {
						$('#GetInfo').hide();
						var i = 0;
						$
								.getJSON(
										'http://query.yahooapis.com/v1/public/yql?q=select * from flickr.photos.search(0) where text=\"sunrise\" and has_geo=1 and lat=22.993299484253 and lon=120.20359802246 and content_type=1 and api_key=\"'
												+ appid
												+ '\" and radius=20 limit 20&format=json',
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
																					console.log(data.query.results.photo.id+" "+data.query.results.photo.dates.taken+" "+data.query.results.photo.location.latitude+" "+data.query.results.photo.location.longitude);
																					$.get('insertphotoinfo.do',
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
																									$.post('insertphotoinfo.do',{},function(data){
																										// sent role 3 to R-tree service
																									});
																								
																									});
																					
																				});
																i++;
															});

										});

					});


/*
$('#GetInfo')
.click(
		function() {
			$('#GetInfo').hide();
$.getJSON(
		'http://query.yahooapis.com/v1/public/yql?q=select id,title,dates.taken,farm,server,id,secret,location.longitude,location.latitude from flickr.photos.info where photo_id in (select id from flickr.photos.search(0) where text=\"sunrise\" and has_geo=1 and lat=22.993299484253 and lon=120.20359802246 and content_type=1 and api_key=\"63d0f7b2e9592d8f5ad413cc5c60e551\" and radius=20 limit=5) and api_key=\"63d0f7b2e9592d8f5ad413cc5c60e551\"&format=json',
				function(data) {
					console.log(data.query.results.photo.id+" "+data.query.results.photo.dates.taken+" "+data.query.results.photo.location.latitude+" "+data.query.results.photo.location.longitude);
					$.get('insertphotoinfo.do',
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

});
*/
</script>
</html>
