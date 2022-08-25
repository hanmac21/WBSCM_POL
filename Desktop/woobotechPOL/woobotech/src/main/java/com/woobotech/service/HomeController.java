package com.woobotech.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.type.WhenNoDataTypeEnum;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

  private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

  @Autowired
  SessionLocaleResolver localeResolver;

  @Autowired
  MessageSource messageSource;

  /**
   * Simply selects the home view to render by returning its name.
   */
  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String home(Locale locale, Model model) {
    logger.info("Welcome home! The client locale is {}.", locale);

    Date date = new Date();
    DateFormat dateFormat =
        DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

    String formattedDate = dateFormat.format(date);

    model.addAttribute("serverTime", formattedDate);

    System.out.println("method-get@@@@@@@@@@@@@@@@@@@@@@");

    return "mng/mng_login";
  }

  @RequestMapping(value = "/", method = RequestMethod.POST)
  public String home2(Locale locale, Model model) {
    logger.info("Welcome home! The client locale is {}.", locale);

    Date date = new Date();
    DateFormat dateFormat =
        DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

    String formattedDate = dateFormat.format(date);

    model.addAttribute("serverTime", formattedDate);

    System.out.println("method-post@@@@@@@@@@@@@@@@@@@@@");

    return "mng/mng_login";
  }

  // 에러 페이지 처리 2022-04-26 정인우
  @GetMapping("/error")
  public String error() {
    return "error/error";
  }

  // 재스퍼 테스트 용 페이지. 필요없음 2022-04-26 정인우
  @GetMapping("/jaspertest")
  public String jaspertest(HttpServletRequest request, HttpServletResponse response,
      HttpSession session, Model model) {
    String folderPath = "C:\\report\\";
    Connection conn = null;

    try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
      conn = DriverManager.getConnection("jdbc:oracle:thin:@176.122.244.138:1521:REXPOL", "rexpol", "inbus");
      /*
       * " //218.147.154.81:1521:INBUS\", \"REXERP\", \"INBUS\"
       */      JasperReport jasperReport =
          JasperCompileManager.compileReport(folderPath + "WB_A4_Landscape.jrxml");
      JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, conn);
      jasperReport.setWhenNoDataType(WhenNoDataTypeEnum.ALL_SECTIONS_NO_DETAIL);

      JasperExportManager.exportReportToHtmlFile(jasperPrint, folderPath + "simpleTest.html");
      // System.out.println(jasperPrint);
      conn.close();
    } catch (Exception e) {
      e.printStackTrace();
    }

    model.addAttribute("folderPath", folderPath);
    System.out.println(folderPath);

    return "mng/jasper_test";
  }

}
