package com.woobotech.service.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woobotech.service.common.Constant;

@Controller
public class FileDownload {

  @RequestMapping(value = "/filedownload.do")
  public void handleFileDownload(HttpServletRequest request, HttpServletResponse response) {


    String file_name = request.getParameter("f_name");
    String file_type = request.getParameter("file_type");

    if (file_name != null && file_type != null && file_name.equals("") == false
        && file_type.equals("") == false) {
      String filepath = Constant.default_dir + "/" + file_name;

      if (filepath != "") {
        File file = new File(filepath);
        response.setContentType("application/octet-stream");
        response.addHeader("Content-Disposition", "attachment; filename=" + file_name);
        response.setContentLength(new Long(file.length()).intValue());

        try {
          FileCopyUtils.copy(new FileInputStream(file), response.getOutputStream());
        } catch (IOException e) {
          e.printStackTrace();
        }
      }
    }
    return;
  }
}
