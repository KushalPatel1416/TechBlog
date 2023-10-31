package com.blog.entities;
import java.sql.Timestamp;

public class User {
	private String username;
	private String email;
	private String password;
	private String gender;
	private Timestamp date;
	private String about;
	private int id;
	private String profile;

	
	//Set Values
	
	
	public User(String username, String email, String password ,String gender, String about) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		
		
	}
	
	public User() {
		
	}
	
	
	
	public User( int id , String username, String email, String password, String gender, Timestamp date, String about) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.date = date;
		this.about = about;
		this.id = id;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	

}
