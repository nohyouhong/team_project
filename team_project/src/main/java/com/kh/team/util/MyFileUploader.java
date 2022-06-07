package com.kh.team.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class MyFileUploader {
	
	public static String uploadFile(String uploadPath, String originalFilename, byte[] fileData) {
		UUID uuid = UUID.randomUUID();
		
		String saveFilename = uploadPath + "/" + 
				uuid + "_" + originalFilename;
		System.out.println(saveFilename);
		//    C:/m_pic/5da10d8a-8d0d-4b3c-9eb1-81c80a783cfc_파일이름.pdf
		File fTarget = new File(saveFilename);
		try {
			FileCopyUtils.copy(fileData, fTarget);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return saveFilename;
	}
	
	public static boolean deleteFile(String filename) {
		File f = new File(filename);
		if(f.exists()) {
			f.delete();
			return true;
		}
		return false;
	}
}
