package com.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {
	
	
	public static boolean deleteFile(String path) {
		boolean flag=false;
		
		try {
			
			File file = new File(path);
			flag = file.delete();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
		
	}
	
	public static boolean saveProfilePhoto(InputStream is,String path ) {
		boolean flag = false;
		
		try {
			
			byte []b = new byte[is.available()];
			
			is.read(b);
			
			FileOutputStream iot = new FileOutputStream(path);
			iot.write(b);
			
			iot.flush();
			iot.close();
			
			flag = true;
		
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return flag;
		
		
	}
	

}
