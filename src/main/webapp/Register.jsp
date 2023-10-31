<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>

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
	
	<main class="primary-background banner-bg" style="padding-bottom:200px">
	
		<div class="container">
		
			<div class="col-md-5 offset-md-4">
			
			  <div class="card">
			  	
			  	<div class="card-header text-center primary-background text-white">
			  		<span class="fa fa-user-circle fa-3x"></span>
			  		<h3>Register Here</h3>
			  	
			  	</div>
			  	
			  	<div class="card-body">
			  	<div class="row">
									    <form id="reg-form" class="col s12" action="Register" method="POST">
									      
									      
									       <div class="row">
									        <div class="input-field col s12">
									        <label for="user_name">Username</label>
									        <br>
									          <input name="user_name" id="user_name" type="text" class="validate form-control" style="width:300px">
									          
									        </div>
									      </div>
									      
									      <div class="row">
									        <div class="input-field col s12">
									        <label for="email">Email</label>
									        <br>
									          <input name="user_email" id="email" type="email" class="validate form-control" style="width:300px">
									          
									        </div>
									      </div>
									      
									      <div class="row">
									        <div class="input-field col s12" >
									           <label for="password">Password</label>
									           <br>
									          <input name ="password" id="password" type="password" class="validate form-control" style="width:300px">
									        </div>
									      </div>
									      
									       <div class="row">
									        <div class="input-field col s12">
									        <br>
									        <label for="gender">Select Gender</label>
									        <br>
									          <input id="gender" type="radio"  name="gender" value="male">Male
									          <input id="gender" type="radio"  name="gender" value="female">Female
									          
									        </div>
									      </div>
									     
									      <div class="row">
									        <div class="input-field col s12 ">
									         <br>
									        <label for="about">About</label>
									         <br>
									          <textarea id="about" name="about" type="text" class="validate" placeholder="Enter Something" style="width:300px"></textarea>
									          
									        </div>
									      </div>
									     
									      
									     
									      
									      <div class="row">
									        <div class="input-field col s12">							
									          <br>
									          <input id="checkbox" type="checkbox" class="validate" name="check">
			    						       
			    						        <label for="checkbox">Agree Terms and Conditions</label>
									          
									        </div>
									      </div>
											
											<div class="container" style="text-align:center; display:none;" id="loader" >
												<span class="fa fa-refresh fa-spin fa-3x"></span>
												<h3>Please Wait</h3>
											
											</div>
									      
									      <br>
									      
									      <div style="text-align:center">
									      <button type="submit"  id="submit-btn"class="btn btn-primary" >Signup</button>
									      </div>
									      
									    </form>
			  	
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script>
	$(document).ready(function(){
		
		console.log("loaded....")
		
		$('#reg-form').on('submit',function(event){
			event.preventDefault();
			
			let form = new FormData(this);
			
			$('#loader').show();
			$('#submit-btn').hide();
			
			//send to register servlet
			
			$.ajax({
				url:"Register",
				type:"POST",
				data: form,
				success: function(data,textStatus,jqXHR){
					console.log(data)
					
					$('#loader').hide();
					$('#submit-btn').show();
					
					if(data.trim()==='Successfully Submitted')
					{
					swal("Successfully Registered redirecting to Login page")
					  .then((value) => {
					  window.location='Login.jsp'
					});
				   }
					else{
					swal(data);
				    }
					
				}
						
				,error: function(jqXHR,textStatus,errorThrown){
					console.log(jqXHR)
					$('#loader').hide();
					$('#submit-btn').show();
					
					swal("Successfully Registered redirecting to Login page");
					
				},
				processData : false,
				contentType : false
				
			});
			
		});
		
	});
	
	
	
	</script>
	
	
	
</body>
</html>