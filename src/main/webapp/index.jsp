<%@page import="java.sql.*" %>
<%@page import="com.blog.helper.ConnectionProvider" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP Page</title>

    <!--Bootstrap/Css -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<link href="Css/mystyle.css" rel="stylesheet"  type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<style>
		.banner-bg{
 		clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 74%, 70% 83%, 21% 90%, 0 86%, 0 0);
 		}
 		
 		 body{
	
			background: url(home_pictures/techy.jpg);
			background-size : cover;
			background-attachment : fixed;
	
			}

	</style>

</head>
<body>

		<%@include file="Nav.jsp" %>


		<!-- Banner -->
		
		<div class="container-fluid p-0 m-0";">
			
			<div class="jumbotron primary-background text-white banner-bg">
				
				<div class="container m">
					<H3 class="display-3">Welcome to Tech Blog</H3>
					<p>Welcome to  Tech Blog

Are you ready to embark on an exciting journey through the ever-evolving world of technology? Look no further.Tech Blog is your passport to the digital universe, where innovation meets information, and the future unfolds one byte at a time.

In an era where technology shapes every aspect of our lives, staying informed and inspired is key. Our mission is to be your trusted source for all things tech. From the latest gadgets and cutting-edge trends to in-depth insights and expert reviews, we've got you covered.</p>
					
					<a href="Register.jsp"class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>Free to Start</a>
					<a href="Login.jsp" class="btn btn-outline-light btn-lg" ><span class="fa fa-user-circle-o fa-spin"></span>Login</a>
					
				</div>
				
				
				
			</div>
		
		</div>
		
		<!-- Cards -->
	
		<div class="container" >
			<div class="row">
			
			 <div class="col-md-4">
			 
			 
			<div class="card" style="width:25 rem; height: 500px ;">
			<div class="card-body">
              <img class="card-img-top" src="home_pictures/Card1.jpg" alt="Card img">
              <br>
              <br>
				<h5 class="card-title"> The top ChatGPT plugins for developers</h5>
				<p>One of the cool new features of ChatGPT is you can now install plugins to make the chatbot even smarter...</p>
				<a href="https://www.pluralsight.com/blog/machine-learning/top-chatgpt-plugins-developers" target="_blank" class="btn btn-primary">Read More</a>
			
			</div>
			
			</div>
			
			<br> <!--Space between cards  -->
			
			<div class="card" style="width: 25 rem;height: 500px ;">
			<div class="card-body">
			<img class="card-img-top" src="home_pictures/Card2.jpg" alt="Card img">
              <br>
              <br>
				<h5 class="card-title"> Cloud computing challenges and opportunities for the public sector</h5>
				<p>More and more public sector organizations are turning to the cloud to improve their efficiency, resilience, and overall security stance...  </p>
				<a href="https://www.pluralsight.com/blog/cloud/cloud-computing-public-sector" target="_blank" class="btn btn-primary">Read More</a>
			
			</div>
			
			</div>
			
			</div>
			
			 <div class="col-md-4">
			 
			 
			<div class="card" style="width: 25 rem;height: 500px ;">
			<div class="card-body">
			<img class="card-img-top" src="home_pictures/Card3.jpg" alt="Card img">
              <br>
              <br>
				<h5 class="card-title">What is the Java programming language?</h5>
				<p>Java can be used cross-platform to build almost any type of software-- all it needs to run is a Java Virtual Machine.In this post from our Programming Languages for the.. </p>
				<br>
              
				<a href="https://www.pluralsight.com/resources/blog/cloud/what-is-the-java-programming-language" target="_blank" class="btn btn-primary">Read More</a>
			
			</div>
			
			</div>
			
			<br> <!--Space between cards  -->
			
			<div class="card" style="width: 25 rem;height: 500px ;">
			<div class="card-body">
			<img class="card-img-top" src="home_pictures/Card4.png" alt="Card img">
              <br>
              <br>
				<h5 class="card-title"> Scrum vs. SAFe: Which Agile framework is right for your team?</h5>
				<p>Scrum vs SAFe: Making the right choice for powerful organizational change. We will explain each framework, their pros...</p>
				 <br>
				   <br>
				<a href="https://www.pluralsight.com/blog/software-development/scrum-vs-safe" target="_blank" class="btn btn-primary">Read More</a>
			
			</div>
			
			</div>
			
			</div>
			
			 <div class="col-md-4">
			 
			 
			<div class="card" style="width: 25 rem;height: 500px ;">
			<div class="card-body">
			<img class="card-img-top" src="home_pictures/Card5.jpg" alt="Card img">
              <br>
              <br>
				<h5 class="card-title">ChatGPT's new Browse with Bing: Watching AIs stalk you is odd</h5>
				<p>This week, I logged into ChatGPT to continue testing its ChatGPT plugins feature, only to notice a new addition to...  </p>
				<a href="https://www.pluralsight.com/blog/machine-learning/chatgpt-browse-with-bing-feature" target="_blank" class="btn btn-primary">Read More</a>
			
			</div>
			
			</div>
			
			<br> <!--Space between cards  -->
			
			<div class="card" style="width: 25 rem;height: 500px ;">
			<div class="card-body">
			<img class="card-img-top" src="home_pictures/Card6.jpg" alt="Card img">
              <br>
              <br>
				<h5 class="card-title">7 benefits of AIOps for organizations</h5>
				<p>It is hard to open the headlines without seeing a technologist gush about the benefits of AI. But as a leader, you are likely more interested in the practical side of AI...  </p>
				<br>
				<a href="https://www.pluralsight.com/blog/it-ops/benefits-aiops-for-organizations" target="_blank" class="btn btn-primary">Read More</a>
			
			</div>
			
			</div>
			
			</div>
			
			
					
			</div>
		
		</div>
		
		
	<!-- Contact Modal -->
		
			<div class="modal fade" id="ContactModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">For More Information Contact Us</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      
			      <div class="modal-body">
			      
			      	<h5><span class='fa fa-phone-square'></span>Contact number : 9546788456</h5>
			      	<h5><span class='fa fa-envelope'></span>Email us on : kushalpatel7516@gmail.com</h5>
			      
			      </div>
			      
			      <div class="modal-footer ">
			       
			      </div>
			     
			      </div>
			      
			    </div>
			  </div>
			</div>


		
		<!-- End of Contact Modal -->
		
	
	
	
	<!--JavaScript  -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	<script>
		
		
	
	</script>
	
</body>
</html>