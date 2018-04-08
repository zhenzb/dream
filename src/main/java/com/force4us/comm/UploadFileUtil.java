package com.force4us.comm;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 * @Describe:
 * @Author:zhenzhuobin
 * @Date:
 */
public class UploadFileUtil {
    public  void uploadFile(InputStream file,String filePath,String fileName) throws Exception {
        File targetFile = new File(filePath);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        FileOutputStream out = new FileOutputStream(filePath+fileName);
       byte[] buffer = new byte[1024 * 1024];
        int length;
        while ((length = file.read(buffer)) > 0) {
            out.write(buffer, 0, length);
        }
        out.flush();
        out.close();
    }
}
