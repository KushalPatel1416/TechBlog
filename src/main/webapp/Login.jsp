<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.blog.entities.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

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

	<%@include file="Nav.jsp" %> 
	
		<main class="d-flex align-items-center primary-background banner-bg " style="height:70vh"  >
			<div class="container mb-5" >
				<div class="row">
					<div class="col-md-4 offset-md-4 ">
						
						<div class="card">
							<div class="card-header primary-background text-white text-center">
							<h3><span class="fa fa-user-plus fa-1x"></span>Login</h3>
							
							</div>
							
							<%
								Message m = (Message)session.getAttribute("message");
								if(m!=null){
									
								%>	
								<div class="alert <%= m.getCssClass()%>" role="alert">
						      		<%= m.getContent() %>
						         </div>
									
							<% 		
									session.removeAttribute("message");
								}
							
							%>
							
							
							<div class="card-body">
								<div class="row">
									    <form class="col s12 fluid"  action="LoginPage" method="POST">
									  		
									      <div class="row">
									        <div class="input-field col s12 fluid form-group ">
									        <label for="email">Email</label>
									        <br>
									          <input name="email" required id="email" type="email" class="validate form-control" >
									          
									        </div>
									      </div>
									      
									      
									      <div class="row">
									        <div class="input-field col s12 fluid form-group">
									           <label for="password">Password</label>
									           <br>
									          <input name="password" required id="password" type="password" class="validate form-control" >
									        </div>
									      </div>
									      
									      <br>
									      
									      <div style="text-align:center">
									      <button type="submit"  id="submit-btn" class="btn btn-primary" >Login</button>
									      </div>
									      
									    </form>
									  </div>
							
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
		
		
		</main>
		
	
	
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
		

</body>
</html>