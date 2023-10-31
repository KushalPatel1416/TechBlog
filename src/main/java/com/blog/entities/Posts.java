package com.blog.entities;
import java.sql.Timestamp;

public class Posts {
	
	private int pid;
	private String pTitle;
	private String pContent;
	private String pCode;
	private String pPic;
	private int cId;
	private Timestamp pdate;
	private int userId;
	
	
	
	public Posts() {
		
	}


	public Posts(int pid, String pTitle,Timestamp pdate ,String pContent, String pCode, String pPic, int userId, int cId) {
		
		this.pid = pid;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.cId = cId;
		this.pdate = pdate;
		this.userId = userId;
	}


	public Posts(String pTitle, String pContent,Timestamp pdate , String pCode, String pPic,int userId, int cId) {
		
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.cId = cId;
		this.pdate = pdate;
		this.userId = userId;

	}


	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}


	public String getpTitle() {
		return pTitle;
	}


	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}


	public String getpContent() {
		return pContent;
	}


	public void setpContent(String pContent) {
		this.pContent = pContent;
	}


	public String getpCode() {
		return pCode;
	}


	public void setpCode(String pCode) {
		this.pCode = pCode;
	}


	public String getpPic() {
		return pPic;
	}


	public void setpPic(String pPic) {
		this.pPic = pPic;
	}


	public int getcId() {
		return cId;
	}


	public void setcId(int cId) {
		this.cId = cId;
	}


	public Timestamp getPdate() {
		return pdate;
	}


	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	
	
	
	
	

}
