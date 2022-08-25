package com.woobotech.service.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Service
public class SessionIntercepter extends HandlerInterceptorAdapter {

  // private static final Logger logger = Logger.getLogger(SessionIntercepter.class);

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    HttpSession session = request.getSession();

    String reqUrl = request.getServletPath();
    // logger.info("서비스 요청 URL : " + reqUrl);

    return true;

  }
}
