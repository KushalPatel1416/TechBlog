
<%@page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Occurred</title>

<!--Bootstrap/Css -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<link href="Css/mystyle.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<style>
		.banner-bg{
clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 74%, 70% 83%, 21% 90%, 0 86%, 0 0);

 		}

	</style>
</head>
<body>
		
	<div class="container text-center mt-5">
		
		<img alt="Error image" src="img/404.png" class="img-fluid">
		<h3 class="display-3"> Something Went Wrong !</h3>
		<h1 class="display-5"><%=exception %></h1>
		
		
		<a href="index.jsp" class="btn primary-background btn-lg text-white mt-3" > Home</a>
		
		
		
	
	</div>	
		
		
	

</body>
</html>