package com.blog.servlets;

import java.io.IOException;

import com.blog.entities.Message;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


//@WebServlet("/Logout")
public class LogoutServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req , HttpServletResponse res)throws IOException,ServletException {
		
		HttpSession ses = req.getSession();
		ses.removeAttribute("currentUser");
		
		Message msg = new Message("Logout SuccessFully","success","alert-success");
		ses.setAttribute("message", msg);
		
		res.sendRedirect("Login.jsp");
		
		
		
		
	}

}
