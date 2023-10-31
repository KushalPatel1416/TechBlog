package com.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.blog.dao.Postdao;
import com.blog.entities.Posts;
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
public class CreatePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreatePostServlet() {
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
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		
		//Fetching Post Details
		int cid = Integer.parseInt(request.getParameter("cid"));
		String Title = request.getParameter("pTitle");
		String Content = request.getParameter("pContent");
		String Code = request.getParameter("pCode");
		Part part = request.getPart("picture");
		
		HttpSession ses = request.getSession();
		User user = (User)ses.getAttribute("currentUser");
		
		int userId = user.getId();
		String img = part.getSubmittedFileName();
		
		Posts p = new Posts(Title,Content,null,Code,img,userId,cid);
		
		Postdao pdao = new Postdao(ConnectionProvider.getConnection());
		boolean ans =pdao.savePosts(p);
		
		if(ans) {
			String path = "D:\\Eclipse\\TechBlog\\src\\main\\webapp\\blog_pictures"+File.separator + img;
			
			Helper.saveProfilePhoto(part.getInputStream(), path);
			out.print("done");
			
		}else {
			out.print("error");
		}
		
		
		
		
	}

}
