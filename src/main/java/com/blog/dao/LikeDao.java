package com.blog.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
	
	Connection con;
	
	public LikeDao(Connection con) {
		this.con = con;
	}
	
	public boolean insertLike(int pid , int userid) {
		boolean flag = false;
		
		try {
			String q = "insert into liked (pid,userid) values(?,?)";
			PreparedStatement prest = con.prepareStatement(q);
			prest.setInt(1, pid);
			prest.setInt(2, userid);
			
			prest.executeUpdate();
			flag=true;
			
		}catch(Exception e) {
			
			
		}
		
		
		return flag;
		
	}
	
	
	public int countLikes(int pid) {
		int count=0;
		
		try {
			
			PreparedStatement prest = con.prepareStatement("select count(*) from liked where pid=?");
			prest.setInt(1, pid);
			
			ResultSet res = prest.executeQuery();
			
			while(res.next()) {
				
				count = res.getInt("count(*)");
				
			}
			
		}catch(Exception e) {
			
			
		}
		
		return count;
		
	}

	
	public boolean isLikedByUser(int pid , int userid) {     // is post pr is user ne like kiya hai so like button disable hona chaiye
		boolean flag = false;
		
			try {
				PreparedStatement prest = con.prepareStatement("select * from liked where pid=? and userid=?");
				prest.setInt(1, pid);
				prest.setInt(2, userid);
				
				prest.executeQuery();
				flag=true;
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}
		
		
		return flag;
	}

	public boolean deletelike(int pid , int userid) {
		boolean flag = false;
		try {
			
			PreparedStatement prest = con.prepareStatement("delete from liked where pid=? and userid=?");
			prest.setInt(1, pid);
			prest.setInt(2, userid);
			
			prest.executeUpdate();
			flag=true;
		}catch(Exception e) {
			
			
		}
		
		
		return flag;
		
	}

}
