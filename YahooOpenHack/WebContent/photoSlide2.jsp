<!doctype html>

<html lang="en">
<head>

    <link href="http://fonts.googleapis.com/css?family=Open+Sans:regular,semibold,italic,italicsemibold|PT+Sans:400,700,400italic,700italic|PT+Serif:400,700,400italic,700italic" rel="stylesheet" />

    <link href="assert/css/impress-demo.css" rel="stylesheet" />
    
    <link rel="shortcut icon" href="favicon.png" />
    <link rel="apple-touch-icon" href="apple-touch-icon.png" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.js"></script>
    		<%
		 String pids = request.getParameter("PID");
		System.out.println(pids);
		 String[] PID = pids.split("-");
	/* 	for(int i = 0; i< IMGURL.length-1;i++){
			out.println("<li><a href=\"http://www.pikachoose.com\"><img src=\""+IMGURL[i]+"\"/></a><span></span></li>");
		} */
		
		%>
</head>

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
	var url = "";
	var dataX = -2000;
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
					   // $('#impress').append(" <div class=\"step slide\" data-x=\""+dataX+"\" data-y=\"-900\"><img src=\""+url+"\"/><span></span></div>");
					   // dataX+=1000;
					   if(i<4){
						   console.log(i);
					   $('#'+i).append("<img src=\""+url+"\"/><span></span>");
					   }
					});  
	 		
	}



</script>

<body class="impress-not-supported">



<div id="impress" >

    <div id="1" class="step slide" data-x="-1000" data-y="-1500">
    </div>

    <div id="2" class="step slide" data-x="0" data-y="-1500">
       
    </div>

    <div id="3" class="step slide" data-x="1000" data-y="-1500">
       
    </div>

   

    <div id="overview" class="step" data-x="3000" data-y="1500" data-scale="10">
    </div>
 
</div>


<div class="hint">
    <p>Use a spacebar or arrow keys to navigate</p>
</div>
</body>
<script src="assert/js/impress.js"></script>
<script>impress().init();</script>




</html>


