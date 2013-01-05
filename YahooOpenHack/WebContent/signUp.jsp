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
		<!-- twitter bootstrap css lib -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.jcarousel.min.js"></script>

	
</head>




<body>

<div class="span3 well">
  	<legend>New to FTMBM? Sign up!</legend>
    <form accept-charset="UTF-8" action="/SignUP.do" method="post">
        <input class="span3" name="username" placeholder="Username" type="text">
        <input class="span3" name="password" placeholder="Password" type="password"> 
        <input class="span3" name="gender" placeholder="gender" type="text">
        <input class="span3" name="age" placeholder="age" type="text">
        <button class="btn btn-warning" type="submit">Sign up for FTMBM</button>
    </form>
</div>

</body>

</html>
