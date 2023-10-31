package com.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.blog.entities.Category;
import com.blog.entities.Posts;

public class Postdao {
	
	Connection con;

	public Postdao(Connection con) {
		
		this.con = con;
	}
	
	public ArrayList<Category> getCategories(){
		
		ArrayList<Category> list = new ArrayList<>();
		
		
		
		try {
			String query ="select * from categories";
			Statement prest = this.con.createStatement();
			ResultSet res = prest.executeQuery(query);
			
			while(res.next()) {
				
				int cid = res.getInt("cid");
				String name = res.getString("name");
				String description = res.getString("description");
				Category c = new Category(cid,name,description);
				list.add(c);
				
			}
						
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
		
	}
	
	public boolean savePosts(Posts p) {
		boolean flag=false;
		
		try {
			
			String q ="insert into posts(pTitle,pContent,pCode,pPicture,userId,catId) values(?,?,?,?,?,?)";
			PreparedStatement pstm = this.con.prepareStatement(q);
			pstm.setString(1, p.getpTitle());
			pstm.setString(2, p.getpContent());
			pstm.setString(3, p.getpCode());
			pstm.setString(4, p.getpPic());
			pstm.setInt(5, p.getUserId());
			pstm.setInt(6, p.getcId());
			
			pstm.executeUpdate();			
			flag=true;
			
		}catch(Exception e) {
			
			
		}
		
		
		return flag;
	}
	
	public List<Posts> getAllPosts(){
		
		List<Posts> list = new ArrayList<>();
		
		try {
			
			PreparedStatement prep = con.prepareStatement("select * from posts");
			
			ResultSet res = prep.executeQuery();
			
			while(res.next()) {
				
				int pid = res.getInt("pid");
				String pTitle = res.getString("pTitle");
				String pContent = res.getString("pContent");
				String pCode = res.getString("pCode");
				String pPicture = res.getString("pPicture");
				Timestamp date = res.getTimestamp("pDate");
				int userId = res.getInt("userId");
				int cid = res.getInt("catId");
				
				Posts p = new Posts(pid,pTitle,date,pContent,pCode,pPicture,userId,cid);
				
				list.add(p);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
    public List<Posts> getAllPostsById(int catId){
		
		List<Posts> list = new ArrayList<>();
		
		try {
			
			PreparedStatement prep = con.prepareStatement("select * from posts where catId=?");
			prep.setInt(1, catId );
			ResultSet res = prep.executeQuery();
			
			while(res.next()) {
				
				int pid = res.getInt("pid");
				String pTitle = res.getString("pTitle");
				String pContent = res.getString("pContent");
				String pCode = res.getString("pCode");
				String pPicture = res.getString("pPicture");
				Timestamp date = res.getTimestamp("pDate");
				int userId = res.getInt("userId");
				
				Posts p = new Posts(pid,pTitle,date,pContent,pCode,pPicture,userId,catId);
				
				list.add(p);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
    public Posts getPostByPostId(int postid) {
    	Posts post=null;
    	try {
    		String q ="select * from posts where pid=?";
    		PreparedStatement prest = con.prepareStatement(q);
    		prest.setInt(1, postid);
    		
    		ResultSet res = prest.executeQuery();
    		
    		while(res.next()) {
    			int pid = res.getInt("pid");
				String pTitle = res.getString("pTitle");
				String pContent = res.getString("pContent");
				String pCode = res.getString("pCode");
				String pPicture = res.getString("pPicture");
				Timestamp date = res.getTimestamp("pDate");
				int userId = res.getInt("userId");
				int catid = res.getInt("catId");
				
				post = new Posts(pid,pTitle,date,pContent,pCode,pPicture,userId,catid);

    			
    		}
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	
    	return post;
    }
    
    public ArrayList<Posts> getPostOfUser(int userid) {
    	
    	ArrayList<Posts> list = new ArrayList<>();
    	
    	
    	try {
    		
    		PreparedStatement prest = con.prepareStatement("select * from posts where userId=?");
    		prest.setInt(1, userid);
    		ResultSet res = prest.executeQuery();
    		
    		while(res.next()) {
    			
    			int pid = res.getInt("pid");
				String pTitle = res.getString("pTitle");
				String pContent = res.getString("pContent");
				String pCode = res.getString("pCode");
				String pPicture = res.getString("pPicture");
				Timestamp date = res.getTimestamp("pDate");
				int userId = res.getInt("userId");
				int catid = res.getInt("catId");
				
				Posts post = new Posts(pid,pTitle,date,pContent,pCode,pPicture,userId,catid);
				list.add(post);
    			
    		}
    		
    		
    	}catch(Exception e) {
    		
    		e.printStackTrace();
    		
    	}
    	
    	
    	return list;
    }
}
