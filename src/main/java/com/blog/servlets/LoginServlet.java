package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.blog.dao.Userdao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginPage")
public class LoginServlet extends HttpServlet{
		
		public void doPost(HttpServletRequest req ,HttpServletResponse res)throws IOException,ServletException  {
			
			PrintWriter out = res.getWriter();
			
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			Userdao userdao = new Userdao(ConnectionProvider.getConnection());
			
			User user = userdao.getUsernameandPassword(email, password);
			
			if(user==null) {
				//Login error
				Message msg = new Message("Invalid Details ! Try Again","error","alert-danger");
				HttpSession ses = req.getSession();
				ses.setAttribute("message", msg);
				
				res.sendRedirect("Login.jsp");
				
			}else {
				HttpSession ses = req.getSession();
				ses.setAttribute("currentUser", user);
				res.sendRedirect("Profile.jsp");
				
			}
			
		}
	
}
