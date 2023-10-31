package com.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.blog.dao.Userdao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.Helper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;



@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		//Fetching All the values for updation
		String username = request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");
		String about = request.getParameter("user_about");
		Part image = request.getPart("user_image");
		String profileName = image.getSubmittedFileName();
		
		// get the user from the session
		HttpSession ses = request.getSession();
		User user = (User) ses.getAttribute("currentUser");
		
		user.setUsername(username);
		user.setEmail(email);
		user.setPassword(password);
		user.setAbout(about);
		String oldprofile = user.getProfile();
		user.setProfile(profileName);
		
		
		// update these values into database
		Userdao dao = new Userdao(ConnectionProvider.getConnection());
		boolean ans = dao.updateData(user);
		
		if(ans) {
			
			
			String path = "D:\\Eclipse\\TechBlog\\src\\main\\webapp\\Profile_pics"+File.separator + profileName;
			
			String oldFilePath = "D:\\Eclipse\\TechBlog\\src\\main\\webapp\\Profile_pics"+File.separator + oldprofile;
			
			//deleting old profile 
			Helper.deleteFile(oldFilePath);
			
			if(Helper.saveProfilePhoto(image.getInputStream(), path)) {
				
				out.print("Updated Successfully");
				Message msg = new Message("Updated Successfully ","success","alert-success");
				ses.setAttribute("message", msg);
				
			}
			else {
				Message msg = new Message("Something Went Wrong ","error","alert-danger");
				ses.setAttribute("message", msg);
			}
			
			
			
		}else {
			Message msg = new Message("Something Went Wrong ","error","alert-danger");
			ses.setAttribute("message", msg);
			
		}
		
		response.sendRedirect("Profile.jsp");
		
	}

}
