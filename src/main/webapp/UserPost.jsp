<%@page import="com.blog.entities.*" %>
<%@page import="com.blog.dao.*" %>
<%@page import="com.blog.helper.*" %>
<%@page import="java.util.*" %>

<%@page errorPage="Error_page.jsp" %>

<%
User us = (User)session.getAttribute("currentUser");

Postdao p = new Postdao(ConnectionProvider.getConnection());
LikeDao ld = new LikeDao(ConnectionProvider.getConnection());

ArrayList<Posts> list = p.getPostOfUser(us.getId());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Posts</title>

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
	
	
	
	
	
	<!-- Navbar for profile -->
		<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="#"><span class="fa fa-gamepad"></span>Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="Profile.jsp"><span class="fa fa-asterisk"></span>Home <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
         <span class="fa fa-ellipsis-v"></span> Categories
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Data Structure</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Project Implementation</a>
        </div>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="#"><span class="fa fa-user-circle"></span>Contact</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="#"><span class="fa fa-code"></span> Your Posts</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#PostModal"><span class="fa fa-upload"></span>Create Post</a>
      </li>
      
    </ul>
    
    <ul class="navbar-nav mr-right">
    
    <li class="nav-item">
        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span>Profile</a>
      </li>
    
    	<li class="nav-item">
        <a class="nav-link" href="Logout" ><span class="fa fa-sign-out"></span>Logout</a>
      </li>
      
    </ul>
    
  </div>
</nav>
		
		<!-- End of Nav -->
		
		
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
							
							
						<!-- Profile Modal -->
		
	

<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
		<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
      
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
      </div>
      <div class="modal-body">
      
        
        <div class="container text-center">
      			
      			<img  src="Profile_pics/<%= us.getProfile()%>" alt="User Profile Image" style="width:100px; border-radius:50%">
      			<br>
              <h5 class="modal-title" id="profile-modal"><%= us.getUsername() %></h5>
      
      </div>
    
      <!-- table -->
      
      <div class="container" id="profile-details">
      <table class="table mt-3"  >
  
     <tbody>
    
    <tr>
      <th scope="row">1</th>
      <td>ID </td>
      <td><%= us.getId() %></td>
      
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Email </td>
      <td><%= us.getEmail() %></td>
      
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>About </td>
      <td><%= us.getAbout() %></td>
      
    </tr>
    <tr>
      <th scope="row">4</th>
      <td>Gender </td>
      <td><%= us.getGender() %></td>
     
    </tr>
    <tr>
      <th scope="row">5</th>
      <td>Register date </td>
      <td><%= us.getDate() %></td>
     
    </tr>
    
  </tbody>
</table>
     </div> 
        
      </div>
      
      
      
      <!-- Edit_Profile -->
      
      <div class="container text-center" id="edit-profile" style="display:none;">
      
      		<h3>Edit Your Details Here</h3>
      		
      		<form action="EditServlet" method="post" enctype="multipart/form-data">
      		<table class="table">
      			<tr>
      				<td>ID :</td>
      				<td><%= us.getId()%></td>
      			</tr>
      			
      			<tr>
      				<td >Name :</td>
      				<td><input class="form-control" type="text" name="user_name" value="<%= us.getUsername() %>"></td>
      			</tr>
      			
      			<tr>
      				<td>Email :</td>
      				<td><input class="form-control" type="email" name="user_email" value="<%= us.getEmail() %>"></td>
      			</tr>
      			
      			<tr>
      				<td>Password :</td>
      				<td><input class="form-control" type="password" name="user_password" value="<%= us.getPassword() %>"></td>
      			</tr>
      			
      			<tr>
      		 		<td>Gender :</td>
      				<td><%= us.getGender().toUpperCase() %></td>
      			</tr>
      			
      			<tr>
      				<td >About :</td>
      				<td><textarea class="form-control" name="user_about" value="<%= us.getAbout()%>"><%= us.getAbout()%>
      				
      				</textarea></td>
      			</tr>
      			
      			<tr>
      				<td>Profile :</td>
      				<td><input name="user_image" type="file" class="form-control"></td>
      			</tr>
      		
      		
      		</table>
      		
      		<div class="container text-center">
      		    <button type="submit" class="btn btn-outline-success">Save</button>
      		
      		</div>
      		
      		</form>
      
      </div>
      
      
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="edit-btn" class="btn btn-primary"">Edit</button>
      </div>
    </div>
  </div>
</div>
		
		
		<!-- end of Modal -->
		
		
			<!-- Create post Modal -->
		
			<div class="modal fade" id="PostModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Create Post</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      
			      <form id="add-post-form" action="CreatePostServlet" method="post">
			      		
			      		<div class="form-group">
			      		
			      		<select class="form-control" name="cid">
			      		
			      		<option selected disabled>Select Category</option>
			      		
			      		<% 
				      		Postdao pdao = new Postdao(ConnectionProvider.getConnection());
				      		
				      		ArrayList<Category> list4 = pdao.getCategories();
				      		
				      		for(Category li: list4)
				      		{
			     			      		
			      		%>
			      		
			      			<option value="<%= li.getCid()%>"> <%= li.getName() %></option>
			      		
			      		<%
			      		 	}
			      		%>
			      		
			      		</select>
			      		
			     			      		
			      		<div class="form-group mt-3">
			      		<input name="pTitle" type="text" placeholder="Enter Your Title" class="form-control">
			      		</div>
			      		
			      		<div class="form-group">
			      		<textarea name="pContent" placeholder="Enter Your Content" style="height:150px" class="form-control"></textarea>
			      		</div>
			      		
			      		<div class="form-group">
			      		<textarea name="pCode" placeholder="Enter Your Program (Optional)" style="height:150px" class="form-control"></textarea>
			      		</div>
			      		
			      		<div class="form-group">
			      			<label>Select Picture</label>
			      			<br>
			      			<input type="file" name="picture">
			      		</div>
			      		
			      		<div class="container text-center">
			      		 <button type="submit" class="btn btn-outline-primary ">Post</button>
			      		
			      		</div>
			      
			      </div>
			      <div class="modal-footer ">
			       
			      </div>
			      </form>
			     
			      </div>
			      
			    </div>
			  </div>
			</div>


		
		<!-- End of Create post Modal -->
			
							
							
							
				<!-- Edit post Modal -->
		
			<div class="modal fade" id="EditProfileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Edit Post</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      
			      <form id="add-post-form" action="EditPostServlet" method="post">
			      		
			      		<div class="form-group">
			      		
			      		<select class="form-control" name="cid">
			      		
			      		<option selected disabled>Select Category</option>
			      		
			      		<% 
				      		Postdao pdao2 = new Postdao(ConnectionProvider.getConnection());
				      		
				      		ArrayList<Category> list2 = pdao2.getCategories();
				      		
				      		for(Category li: list2)
				      		{
			     			      		
			      		%>
			      		
			      			<option value="<%= li.getCid()%>"> <%= li.getName() %></option>
			      		
			      		<%
			      		 	}
			      		%>
			      		
			      		</select>
			      		
			     			      		
			      		<div class="form-group mt-3">
			      		<input name="pTitle" type="text" placeholder="Enter Your Title" class="form-control">
			      		</div>
			      		
			      		<div class="form-group">
			      		<textarea name="pContent" placeholder="Enter Your Content" style="height:150px" class="form-control"></textarea>
			      		</div>
			      		
			      		<div class="form-group">
			      		<textarea name="pCode" placeholder="Enter Your Program (Optional)" style="height:150px" class="form-control"></textarea>
			      		</div>
			      		
			      		<div class="form-group">
			      			<label>Select Picture</label>
			      			<br>
			      			<input type="file" name="picture">
			      		</div>
			      		
			      		<div class="container text-center">
			      		 <button type="submit" class="btn btn-outline-primary ">Post</button>
			      		
			      		</div>
			      
			      </div>
			      <div class="modal-footer ">
			       
			      </div>
			      </form>
			     
			      </div>
			      
			    </div>
			  </div>
			</div>


		
		<!-- End of Edit post Modal -->
		
					
<!-- 		Main content of the page  -->
   <main>
 		<div class="container">
		
			<div class="row">
			
			<%
		
			
			if(list.size()==0){
		   		out.print(" <h3 class='display-3 text-center mt-5' style='margin-left:190px; ' >You Haven't Posted yet..</h3>");
		   		return;
		   	}
			
			for(Posts upost : list){
			
			%>
			
			<!-- <div class="col-md-2 mt-3">
			
			
			</div> -->
			
			
				 <div class="col-md-4 mt-3 offset-1 ">
				
					<div class="card" style="overflow:hidden; height:500px; width:400px">
						
				<img class="card-img-top" src="blog_pictures/<%= upost.getpPic() %>" alt="Card img">
				
				
				<div class="card-body">
				
					<b><%= upost.getpTitle() %></b>
					<p><%= upost.getpContent() %></p>
				
				</div>
		
				<div class="card-footer primary-background">
				
				
				<a href="#!" onclick="doLike(<%= upost.getPid() %>,<%= us.getId()%>)" class="btn btn-outline-light"> <i class="fa fa-thumbs-o-up "></i> <span class="like-counter"><%= ld.countLikes(upost.getPid()) %></span>  </a>
				<a href="#!" class="btn btn-outline-light"><i class="fa fa-commenting-o"></i> <span>20</span>  </a>
				<a href="show_blog_page.jsp?post_id=<%= upost.getPid() %>"  class="btn btn-outline-light">Read More </a>
				<a href="#" class="btn btn-outline-light" data-toggle="modal" data-target="#EditPostModal" >Edit Post </a>
				
			
					
				
				</div>
					
					</div>
				
				</div> 
				
				<%
				}
			%>
			
			</div>
		
		</div>
	
	
	</main>
	
	<!-- 		Main content of the page  -->
	
	<script src="JS/myJsp.js"></script>
	<!--JavaScript  -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		
		
		<script>
			$(document).ready(function(){
				let editprofile=false;
				
				$("#edit-btn").click(function(){
					
					if(editprofile==false){
						$("#edit-profile").show();
						$("#profile-details").hide();
						editprofile=true;
						$(this).text("Back")
					}
					else{
						$("#edit-profile").hide();
						$("#profile-details").show();
						editprofile=false;
						$(this).text("Edit")
					}
					
				})
				
				
			});
		
		
		</script>
		
		
	 <!-- Script for adding Post -->
	
	<script>
	 
		$(document).ready(function(e){
			
			
			$("#add-post-form").on("submit", function(event){
				//this code is called when form is submited...
				event.preventDefault();
				
				console.log("Submitted successfully")
				
				let form = new FormData(this);
				
				//now requesting to server
				$.ajax({
				  url : "CreatePostServlet",
				  type : 'POST',
				  data : form,
				  success : function(data, textStatus, jqXHR){
					  //success
					 console.log(data);
					  if(data.trim()=='done'){
						  swal("Good job","Submitted Successfully","success");
					  }else{
						  swal("Error!","Something Went Wrong","error");

					  }
				  },
				  error: function(jqXHR ,textStatus, errorThrown){
					  //error
					  swal("Error!","Something Went Wrong","error");

				  },
				  processData: false,
				  contentType: false
				 					
				})
				
			})
			
		})
	
	</script>
	
	
	<!-- For Loader -->
	
	<script>
	
	function getPost(catId,temp){
		$("#loader").show();
		$("#post-container").hide();
		$(".c-link").removeClass('active')
		
		$.ajax({
			url : 'post_Loader.jsp',
			data : {cid : catId},
			success :function(data, textStatus, jqXHR){
				console.log(data);
				$("#loader").hide();
				$("#post-container").show();
				$("#post-container").html(data);
				$(temp).addClass('active')
			}
			
		})
	}
	
	$(document).ready(function(e){
		let activepost = $('.c-link')[0]
		getPost(0,activepost)
		
		
	})
	
	
	</script>
	

</body>
</html>