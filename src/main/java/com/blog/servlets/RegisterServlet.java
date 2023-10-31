package com.blog.servlets;
import java.io.IOException;
import java.io.PrintWriter;

import com.blog.dao.Userdao;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/Register")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException,ServletException{
		
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			
			e.printStackTrace();
		}		
		//Fetching Values
		
		PrintWriter out = res.getWriter();
		
		String check=req.getParameter("check");
	
		if(check==null) {
			
			out.println("Please Check the box");
			
		}else {
			
			String name=req.getParameter("user_name");
			String password=req.getParameter("password");
			String gender=req.getParameter("gender");
			String about=req.getParameter("about");
			String email=req.getParameter("user_email");
			
			//Set all data
			User user = new User(name,email,password,gender,about);
			
			//Create Dao object
			Userdao dao = new Userdao(ConnectionProvider.getConnection());
			
			if(dao.savedata(user)) {
				
				out.println("Successfully Submitted");
			}else {
				out.print("Error");
			}
			
			
		}
		
		
	}

}
