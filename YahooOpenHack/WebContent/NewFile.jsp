<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link type="text/css" href="css/bottom.css" rel="stylesheet" />
		<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
        <script type="text/javascript" src="js/jquery.jcarousel.min.js"></script>
		<script type="text/javascript" src="js/jquery.pikachoose.js"></script>
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
		<li><a href="http://www.pikachoose.com"><img src="img/1.jpg"/></a><span>This is an example of the basic theme.</span></li>
		<li><a href="http://www.pikachoose.com"><img src="img/2.jpg"/></a><span>jCarousel is supported and can be integrated with PikaChoose!</span></li>
		<li><a href="http://www.pikachoose.com"><img src="img/3.jpg"/></a><span>Be sure to check out <a href="http://www.pikachoose.com">PikaChoose.com</a> for updates.</span></li>
		<li><a href="http://www.pikachoose.com"><img src="img/4.jpg"/></a><span>You can use any type of html you want with PikaChoose</span></li>
		<li><a href="http://www.pikachoose.com"><img src="img/5.jpg"/></a><span>PikaChoose survives on your donations! Keep the project alive with a donation.</span></li>
	</ul>
</div>
<-- Button to trigger modal -->
<a href="#myModal" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
 
<-- Modal -->
<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">��</button>
    <h3 id="myModalLabel">Modal header</h3>
  </div>
  <div class="modal-body">
    <p>One fine body�K</p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    <button class="btn btn-primary">Save changes</button>
  </div>
</div>
</body>
</html>
