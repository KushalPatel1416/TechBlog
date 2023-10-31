package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.blog.dao.LikeDao;
import com.blog.helper.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LikeServlet
 */
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String operation = request.getParameter("operation");
		int pid = Integer.parseInt(request.getParameter("pid"));
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		
		if(operation.equals("like")) {
			
			LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
		    boolean b = ld.insertLike(pid, uid);
			out.print(b);
			
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			

	}

}
