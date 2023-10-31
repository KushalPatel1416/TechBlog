<%@page import="com.blog.entities.*" %>
<%@page import="com.blog.dao.*" %>
<%@page import="com.blog.helper.*" %>
<%@page import="java.util.*" %>

<%@page errorPage="Error_page.jsp" %>


<div class="row">
   <% 
    //Thread.sleep(1000);
   
   User us = (User)session.getAttribute("currentUser");
   
   
   
	Postdao pd = new Postdao(ConnectionProvider.getConnection());
	
	
	
   	int cid = Integer.parseInt(request.getParameter("cid"));
   	
   	
   	
   	List<Posts> alist= null;
   	
   	if(cid==0){
   		alist = pd.getAllPosts();
   	}else{
   		alist = pd.getAllPostsById(cid);
   	}
   	
   	if(alist.size()==0){
   		out.print(" <h3 class='display-3 text-center ml-5'>No Post in this Category...</h3>");
   		return;
   	}
	
	for(Posts li : alist){
	
   %>
   
	<div class="col-md-6 mt-2">
		<div class="card" style="overflow:hidden; height:90%; width:100%;">
			<img class="card-img-top" src="blog_pictures/<%= li.getpPic() %>" alt="Card img">
				
				
				<div class="card-body">
				
					<b><%= li.getpTitle() %></b>
					<p><%= li.getpContent() %></p>
				
				</div>
		
				<div class="card-footer primary-background">
				
				<% LikeDao ld = new LikeDao(ConnectionProvider.getConnection());%>
				
				<a href="#!" onclick="doLike(<%= li.getPid() %>,<%= us.getId()%>)" class="btn btn-outline-light"> <i class="fa fa-thumbs-o-up "></i> <span class="like-counter-<%= li.getPid()%>"> <%= ld.countLikes(li.getPid()) %></span>  </a>
				<a href="#!" class="btn btn-outline-light"><i class="fa fa-commenting-o"></i> <span>20</span>  </a>
				<a href="show_blog_page.jsp?post_id=<%= li.getPid() %>" class="btn btn-outline-light">Read More </a>
				
				
				<script src="JS/myJsp.js"></script>
					
				
				</div>
		</div>
	</div>
	

<%  
	}
	
	%>
	
	</div>