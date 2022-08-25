package com.woobotech.service.file;

import java.io.FileOutputStream;

import org.springframework.web.multipart.MultipartFile;

public class FileControlHelper {


  public static String getFileMainDir(String value) {
    String result = "";
    if (value.equals("1")) {
      result = "talk";
    } else if (value.equals("2")) {
      result = "app_img";
    } else if (value.equals("61")) {
      result = "test";
    }
    return result;
  }

  public static String getSubDir(String value) {
    String result = "";
    if (value.length() > 1) {
      result = value.substring(0, 2);
    }

    return result;
  }


  public static void writeFile(MultipartFile file, String path, String fileName) {
    FileOutputStream fos = null;
    try {
      byte fileData[] = file.getBytes();
      fos = new FileOutputStream(path + "\\" + fileName);
      fos.write(fileData);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (fos != null) {
        try {
          fos.close();
        } catch (Exception e) {
        }
      }
    }
  }

}
