package com.woobotech.service.app;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.HttpClients;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.woobotech.service.common.ResponseJson;
import com.woobotech.service.jutil.DateUtil;

@Controller
public class AppController {

  private static final Logger logger = LoggerFactory.getLogger(AppController.class);

  @Resource(name = "uploadPath")
  private String uploadPath;

  /*
   * @Autowired private JavaMailSender mailSender;
   */

  // 로그인
  @RequestMapping(value = "/m_app_login", produces = "application/json;charset=UTF-8")
  public @ResponseBody String m_app_login(HttpServletRequest request, @RequestBody String param) {
    logger.info("▷▶▷▶▷▶ m_app_login start :" + DateUtil.getCurrentDateTime());
    ResponseJson result = new ResponseJson();
    JSONParser jp = new JSONParser();
    JSONObject res = null;

    try {
      Object obj = jp.parse(param);
      if (obj != null) {

        JSONObject json = (JSONObject) obj;
        logger.info("▷▶▷▶▷▶ m_app_login start :" + (String) json.get("USERID"));
        AppDao appDao = new AppDao();
        res = appDao.m_app_login(json);
        result.setResObject(res);
        result.setResult(true);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    Gson gson = new Gson();
    logger.info("◁◀◁◀◁◀ m_app_login end");
    return gson.toJson(result);
  }

  // 버젼체크
  @RequestMapping(value = "/m_app_version", produces = "text/plain;charset=UTF-8")
  public @ResponseBody String m_app_version(HttpServletRequest request, @RequestBody String param) {
    logger.info("▷▶▷▶▷▶ m_app_version start");
    ResponseJson result = new ResponseJson();
    JSONParser jp = new JSONParser();
    JSONObject res = null;

    try {
      Object obj = jp.parse(param);
      if (obj != null) {

        JSONObject json = (JSONObject) obj;
        AppDao appDao = new AppDao();
        res = appDao.m_app_version(json);
        result.setResObject(res);
        result.setResult(true);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }

    Gson gson = new Gson();
    logger.info("◁◀◁◀◁◀ m_app_version end");
    return gson.toJson(result);
  }
}
