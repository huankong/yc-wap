package com.ai.test;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class FileUtils {
	public static void ByteinfoFile(byte[] filedata, String file, int offset) {
		try {
			File f=new File(file);
		    if (!f.exists()) {
				f.createNewFile();
				System.out.println("Created file: " + f.getAbsolutePath());
		    } else {
		    	System.out.println("Overrided file: " + f.getAbsolutePath());
		    }
		    
            ByteArrayOutputStream baos = new ByteArrayOutputStream();  
            InputStream input = new ByteArrayInputStream(filedata);
            byte[] buffer = new byte[1024*1024];  
            int lens;
            while ((lens = input.read(buffer)) > -1 ) {  
                baos.write(buffer, 0, lens);  
            }  
            baos.flush();
            
            InputStream is = new ByteArrayInputStream(baos.toByteArray());
            is.skip(offset);
            FileOutputStream fos = new FileOutputStream(f.getAbsolutePath());
            
	        byte[] b = new byte[1024*1024];
	        int len = 0;
			while((len = is.read(b)) != -1) {
				fos.write(b,0,len);
			}
	        is.close();
	        fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}