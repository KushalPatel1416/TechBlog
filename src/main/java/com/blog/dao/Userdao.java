package com.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import com.blog.entities.User;

public class Userdao {
	
	private Connection con;
	
	public Userdao(Connection con) {
		this.con=con;
	}
	
	
	//After registeration saving data to database
	public boolean savedata(User user) {
		
		boolean flag=false;
		try {
			
			String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
			
			PreparedStatement pst = this.con.prepareStatement(query);
			pst.setString(1, user.getUsername());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getGender());
			pst.setString(5, user.getAbout());
			
			pst.executeUpdate();
			flag=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	
	// For Login
	public User getUsernameandPassword(String email, String password) {
		
		User user = null;
		
		try {
		String query = "select * from user where email=? and password=?";
		PreparedStatement prst =  con.prepareStatement(query);
		prst.setString(1, email);
		prst.setString(2, password);
		
		ResultSet res = prst.executeQuery();
		while(res.next()) {
			user =new User();
			user.setId(res.getInt("id"));
			user.setUsername(res.getString("name"));
			user.setPassword(res.getString("password"));
			user.setEmail(res.getString("email"));
			user.setProfile(res.getString("profile"));
			user.setAbout(res.getString("about"));
			user.setGender(res.getString("gender"));
			user.setDate(res.getTimestamp("regdate"));
			
		}

		}
		catch(Exception e) {
			//Wrong Email and Password
			
			
		}
		
		return user;
		
	}
	
	
	//Updating Values
	public boolean updateData(User user) {
		boolean flag= false;
		
		try {
			
			String query = "update user set name=?, email=?, password=? , gender=?, about=?, profile=? where id=? ";
			
			PreparedStatement prst = con.prepareStatement(query);
			prst.setString(1, user.getUsername());
			prst.setString(2, user.getEmail());
			prst.setString(3, user.getPassword());
			prst.setString(4, user.getGender());
			prst.setString(5, user.getAbout());
			prst.setString(6, user.getProfile());
			prst.setInt(7, user.getId());
			
			prst.executeUpdate();
			
			flag=true;
						
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
		
		
	}
	
	//Getting the name by id
	public User getNameByUserid(int userId) {
		User user=null;
		
		try {
			
			String q = "select * from user where id=?";
			PreparedStatement prest = con.prepareStatement(q);
			prest.setInt(1, userId);
			ResultSet res = prest.executeQuery();
			
			while(res.next()) {
				int userid = res.getInt("id");
				String name = res.getString("name");
				String email = res.getString("email");
				String password = res.getString("password");
				String gender = res.getString("gender");
				String about = res.getString("about");
				Timestamp date = res.getTimestamp("regdate");
				String Profile = res.getString("profile");
				
				user = new User(userid,name , email, password,gender,date,about);
				
			}
			
			
		}catch(Exception e){
			
			e.printStackTrace();
			
		}
		
		
		return user;
	}

	




}
