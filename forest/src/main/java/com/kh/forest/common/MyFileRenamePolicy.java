package com.kh.forest.common;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;

public class MyFileRenamePolicy {


	public File rename(File oldFile) {
		
		File newFile = null;
		long currentTime = System.currentTimeMillis();
		
		System.out.println(currentTime);
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");
		int randomNumber = (int)(Math.random()*10000);
		
		String name = oldFile.getName();
		String body = null;
		String ext = null;
		int dot = name.lastIndexOf(".");
		System.out.println(dot);
		if(dot != -1) {		
			
			body = name.substring(0, dot);
			ext=name.substring(dot);
			
		}else {
			
			body =name;
			ext= "";
		}
		String fileName = ft.format(new Date(currentTime))+randomNumber+ext;
		
		newFile = new File(oldFile.getParentFile(),fileName);
		
		
		return newFile;
	}
	
	
}
	