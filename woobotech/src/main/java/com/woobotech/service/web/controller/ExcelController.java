package com.woobotech.service.web.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.RedirectView;

import com.woobotech.service.jutil.DateUtil;
import com.woobotech.service.web.dao.WooboTechDao;
import com.woobotech.tools.F;
import com.woobotech.tools.ListController;

// 엑셀 요청 들어오면 다 이쪽 컨트롤러로 넘어옴 2022-04-25 정인우

@Controller
public class ExcelController {

  private static final org.slf4j.Logger logger = LoggerFactory.getLogger(ExcelController.class);

  @Autowired
  SessionLocaleResolver localeResolver;

  @Autowired
  MessageSource messageSource;

  @RequestMapping(value = "/mng_buy_plan_excel")
  public ModelAndView mng_buy_plan_excel(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {

    logger.info("▷▶▷▶▷▶mng_buy_plan_excel start");

    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_buy_plan_excel");
    String startdate = F.nullCheck(request.getParameter("startdate"), "");
    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));
    int itemCountPerPage =
        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "30"));

    HttpSession session = request.getSession();

    String text = (String) session.getAttribute("cu_sangho");
    System.out.print("세션에서 받아오는 값 ->" + text);
    String session_cu_code = (String) session.getAttribute("cu_code");

    if (session_cu_code == null) {
      RedirectView redirectView = new RedirectView("mng_login?menu=0");
      // redirectView.set
      redirectView.setExposeModelAttributes(false);
      logger.info("◁◀◁◀◁◀  mng_login_user end");
      return new ModelAndView(redirectView);

    }
    param.put("session_cu_code", session_cu_code);

    String str_dayWeek1 = "";
    String str_dayWeek2 = "";
    String str_dayWeek3 = "";
    String str_dayWeek4 = "";
    String str_dayWeek5 = "";
    String str_dayWeek6 = "";
    String str_dayWeek7 = "";
    String str_dayWeek8 = "";
    String str_dayWeek9 = "";
    String str_dayWeek10 = "";
    String str_dayWeek11 = "";
    String str_dayWeek12 = "";
    String str_dayWeek13 = "";
    String str_dayWeek14 = "";

    String str_day1 = "";
    String str_day2 = "";
    String str_day3 = "";
    String str_day4 = "";
    String str_day5 = "";
    String str_day6 = "";
    String str_day7 = "";
    String str_day8 = "";
    String str_day9 = "";
    String str_day10 = "";
    String str_day11 = "";
    String str_day12 = "";
    String str_day13 = "";
    String str_day14 = "";

    String temp_dayWeek = "";
    String[] arrayDay = new String[14];
    // String[] arrayDay = new String[7];
    if (!"".equals(startdate)) {
      startdate = startdate.replaceAll("-", "");
    } else {
      startdate = DateUtil.getCurrentDate();
    }
    System.out.println("mng_buy_plan_excel_controller" + startdate);
    try {
      for (int i = 0; i < 14; i++) {
        // for(int i=0; i<7; i++) {
        String temp_date = DateUtil.addDays(startdate, i);
        // System.out.println("temp_Date==>"+temp_date);
        int dayWeek = DateUtil.getDayOfWeek(temp_date);
        temp_date = DateUtil.addFormat(temp_date);

        if (dayWeek == 0) {
          temp_dayWeek = "일";
        } else if (dayWeek == 1) {
          temp_dayWeek = "월";
        } else if (dayWeek == 2) {
          temp_dayWeek = "화";
        } else if (dayWeek == 3) {
          temp_dayWeek = "수";
        } else if (dayWeek == 4) {
          temp_dayWeek = "목";
        } else if (dayWeek == 5) {
          temp_dayWeek = "금";
        } else if (dayWeek == 6) {
          temp_dayWeek = "토";
        }

        if (i == 0) {
          str_day1 = temp_date;
          str_dayWeek1 = temp_dayWeek;
        } else if (i == 1) {
          str_day2 = temp_date;
          str_dayWeek2 = temp_dayWeek;
        } else if (i == 2) {
          str_day3 = temp_date;
          str_dayWeek3 = temp_dayWeek;
        } else if (i == 3) {
          str_day4 = temp_date;
          str_dayWeek4 = temp_dayWeek;
        } else if (i == 4) {
          str_day5 = temp_date;
          str_dayWeek5 = temp_dayWeek;
        } else if (i == 5) {
          str_day6 = temp_date;
          str_dayWeek6 = temp_dayWeek;
        } else if (i == 6) {
          str_day7 = temp_date;
          str_dayWeek7 = temp_dayWeek;
        } else if (i == 7) {
          str_day8 = temp_date;
          str_dayWeek8 = temp_dayWeek;
        } else if (i == 8) {
          str_day9 = temp_date;
          str_dayWeek9 = temp_dayWeek;
        } else if (i == 9) {
          str_day10 = temp_date;
          str_dayWeek10 = temp_dayWeek;
        } else if (i == 10) {
          str_day11 = temp_date;
          str_dayWeek11 = temp_dayWeek;
        } else if (i == 11) {
          str_day12 = temp_date;
          str_dayWeek12 = temp_dayWeek;
        } else if (i == 12) {
          str_day13 = temp_date;
          str_dayWeek13 = temp_dayWeek;
        } else if (i == 13) {
          str_day14 = temp_date;
          str_dayWeek14 = temp_dayWeek;
        }
        // System.out.println("i==>"+i);
        arrayDay[i] = temp_date.replaceAll("-", "");
        // 0~6 : 일~월
      }

      model.addAttribute("str_day1", str_day1);
      model.addAttribute("str_day2", str_day2);
      model.addAttribute("str_day3", str_day3);
      model.addAttribute("str_day4", str_day4);
      model.addAttribute("str_day5", str_day5);
      model.addAttribute("str_day6", str_day6);
      model.addAttribute("str_day7", str_day7);
      model.addAttribute("str_day8", str_day8);
      model.addAttribute("str_day9", str_day9);
      model.addAttribute("str_day10", str_day10);
      model.addAttribute("str_day11", str_day11);
      model.addAttribute("str_day12", str_day12);
      model.addAttribute("str_day13", str_day13);
      model.addAttribute("str_day14", str_day14);

      model.addAttribute("str_dayWeek1", str_dayWeek1);
      model.addAttribute("str_dayWeek2", str_dayWeek2);
      model.addAttribute("str_dayWeek3", str_dayWeek3);
      model.addAttribute("str_dayWeek4", str_dayWeek4);
      model.addAttribute("str_dayWeek5", str_dayWeek5);
      model.addAttribute("str_dayWeek6", str_dayWeek6);
      model.addAttribute("str_dayWeek7", str_dayWeek7);
      model.addAttribute("str_dayWeek8", str_dayWeek8);
      model.addAttribute("str_dayWeek9", str_dayWeek9);
      model.addAttribute("str_dayWeek10", str_dayWeek10);
      model.addAttribute("str_dayWeek11", str_dayWeek11);
      model.addAttribute("str_dayWeek12", str_dayWeek12);
      model.addAttribute("str_dayWeek13", str_dayWeek13);
      model.addAttribute("str_dayWeek14", str_dayWeek14);

      try {
        page = Integer.parseInt(request.getParameter("page"));

      } catch (Exception e) {
        // TODO Auto-generated catch block
        // e.printStackTrace();
      }

      int itemCount = 0;
      // int itemCountPerPage = 30;
      int pageCountPerPaging = 10;
      List board = null;

      WooboTechDao dao = new WooboTechDao();

      if (!"mng_buy_plan".equals(pageView)) {
        itemCount = dao.mng_buy_plan_count(arrayDay, param);
        board = dao.mng_buy_plan_excel(arrayDay, param, page, itemCountPerPage);
      }

      int maxPage = ListController.getMaxPage(itemCount, itemCountPerPage);
      List paging = ListController.getPaging(page, maxPage, pageCountPerPaging);
      model.addAttribute("board", board);
      model.addAttribute("itemCount", itemCount);
      model.addAttribute("currentPage", page);
      model.addAttribute("maxPage", maxPage);
      model.addAttribute("paging", paging);
      model.addAttribute("startdate", DateUtil.addFormat(startdate));
      model.addAttribute("itemCountPerPage", itemCountPerPage);


    } catch (Exception e) {
      e.printStackTrace();
    }

    // DateUtil.getDayOfWeek("");
    logger.info("◁◀◁◀◁◀ mng_buy_plan_excel end");
    return new ModelAndView("mng/" + pageView);
  }

  @RequestMapping(value = "/mng_biz_plan_excel")
  public ModelAndView mng_biz_plan_excel(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("▷▶▷▶▷▶mng_biz_plan_excel start");

    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_biz_plan_excel");
    String startdate = F.nullCheck(request.getParameter("startdate"), "");
    String result = F.nullCheck(request.getParameter("alldtate"), "");
    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));
    int itemCountPerPage =
        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "30"));

    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    if (session_cu_code == null) {
      RedirectView redirectView = new RedirectView("mng_login?menu=0");
      // redirectView.set
      redirectView.setExposeModelAttributes(false);
      logger.info("◁◀◁◀◁◀  mng_login_user end");
      return new ModelAndView(redirectView);

    }
    param.put("session_cu_code", session_cu_code);
    param.put("result", result);


    String str_day1 = "";
    String str_day2 = "";
    String str_day3 = "";
    String str_day4 = "";
    String str_day5 = "";
    String str_day6 = "";
    String str_day7 = "";
    String str_day8 = "";
    String str_day9 = "";
    String str_day10 = "";
    String str_day11 = "";
    String str_day12 = "";
    String str_day13 = "";
    String str_day14 = "";

    String temp_dayWeek = "";
    String[] arrayDay = new String[14];
    if (!"".equals(startdate)) {
      startdate = startdate.replaceAll("-", "");
    } else {
      startdate = DateUtil.getCurrentDate();
    }
    try {
      for (int i = 0; i < 14; i++) {

        String temp_date = DateUtil.addDays(startdate, i);
        int dayWeek = DateUtil.getDayOfWeek(temp_date);
        temp_date = DateUtil.addFormat(temp_date);

        if (i == 0) {
          str_day1 = temp_date;
        } else if (i == 1) {
          str_day2 = temp_date;
        } else if (i == 2) {
          str_day3 = temp_date;
        } else if (i == 3) {
          str_day4 = temp_date;
        } else if (i == 4) {
          str_day5 = temp_date;
        } else if (i == 5) {
          str_day6 = temp_date;
        } else if (i == 6) {
          str_day7 = temp_date;
        } else if (i == 7) {
          str_day8 = temp_date;
        } else if (i == 8) {
          str_day9 = temp_date;
        } else if (i == 9) {
          str_day10 = temp_date;
        } else if (i == 10) {
          str_day11 = temp_date;
        } else if (i == 11) {
          str_day12 = temp_date;
        } else if (i == 12) {
          str_day13 = temp_date;
        } else if (i == 13) {
          str_day14 = temp_date;
        }

        arrayDay[i] = temp_date.replaceAll("-", "");
        // 0~6 : 일~월
      }

      model.addAttribute("str_day1", str_day1);
      model.addAttribute("str_day2", str_day2);
      model.addAttribute("str_day3", str_day3);
      model.addAttribute("str_day4", str_day4);
      model.addAttribute("str_day5", str_day5);
      model.addAttribute("str_day6", str_day6);
      model.addAttribute("str_day7", str_day7);
      model.addAttribute("str_day8", str_day8);
      model.addAttribute("str_day9", str_day9);
      model.addAttribute("str_day10", str_day10);
      model.addAttribute("str_day11", str_day11);
      model.addAttribute("str_day12", str_day12);
      model.addAttribute("str_day13", str_day13);
      model.addAttribute("str_day14", str_day14);

      try {
        page = Integer.parseInt(request.getParameter("page"));

      } catch (Exception e) {
        // TODO Auto-generated catch block
        // e.printStackTrace();
      }

      int itemCount = 0;
      // int itemCountPerPage = 30;
      int pageCountPerPaging = 10;
      List board = null;


      WooboTechDao dao = new WooboTechDao();

      if (!"mng_biz_plan".equals(pageView)) {
        itemCount = dao.mng_biz_plan_count(arrayDay, param);
        board = dao.mng_biz_plan_excel(arrayDay, param, page, itemCountPerPage);
      }

      int maxPage = ListController.getMaxPage(itemCount, itemCountPerPage);
      List paging = ListController.getPaging(page, maxPage, pageCountPerPaging);

      model.addAttribute("board", board);
      model.addAttribute("itemCount", itemCount);
      model.addAttribute("currentPage", page);
      model.addAttribute("maxPage", maxPage);
      model.addAttribute("paging", paging);
      model.addAttribute("startdate", DateUtil.addFormat(startdate));
      model.addAttribute("itemCountPerPage", itemCountPerPage);
    } catch (Exception e) {
      e.printStackTrace();
    }

    logger.info("◁◀◁◀◁◀ mng_biz_plan_excel end");
    return new ModelAndView("mng/" + pageView);
  }

  @RequestMapping(value = "/mng_production_plan_excel")
  public ModelAndView mng_production_plan(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("▷▶▷▶▷▶mng_production_plan_excel start");

    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_production_plan_excel");
    String startdate = F.nullCheck(request.getParameter("startdate"), "");
    String result = F.nullCheck(request.getParameter("alldtate"), "");
    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));
    int itemCountPerPage =
        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "30"));

    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    if (session_cu_code == null) {
      RedirectView redirectView = new RedirectView("mng_login?menu=0");
      // redirectView.set
      redirectView.setExposeModelAttributes(false);
      logger.info("◁◀◁◀◁◀  mng_login_user end");
      return new ModelAndView(redirectView);

    }
    param.put("session_cu_code", session_cu_code);
    param.put("result", result);


    String str_day1 = "";
    String str_day2 = "";
    String str_day3 = "";
    String str_day4 = "";
    String str_day5 = "";
    String str_day6 = "";
    String str_day7 = "";
    String str_day8 = "";
    String str_day9 = "";
    String str_day10 = "";
    String str_day11 = "";
    String str_day12 = "";
    String str_day13 = "";
    String str_day14 = "";

    String temp_dayWeek = "";
    String[] arrayDay = new String[14];
    if (!"".equals(startdate)) {
      startdate = startdate.replaceAll("-", "");
    } else {
      startdate = DateUtil.getCurrentDate();
    }
    try {
      for (int i = 0; i < 14; i++) {

        String temp_date = DateUtil.addDays(startdate, i);
        int dayWeek = DateUtil.getDayOfWeek(temp_date);
        temp_date = DateUtil.addFormat(temp_date);

        if (i == 0) {
          str_day1 = temp_date;
        } else if (i == 1) {
          str_day2 = temp_date;
        } else if (i == 2) {
          str_day3 = temp_date;
        } else if (i == 3) {
          str_day4 = temp_date;
        } else if (i == 4) {
          str_day5 = temp_date;
        } else if (i == 5) {
          str_day6 = temp_date;
        } else if (i == 6) {
          str_day7 = temp_date;
        } else if (i == 7) {
          str_day8 = temp_date;
        } else if (i == 8) {
          str_day9 = temp_date;
        } else if (i == 9) {
          str_day10 = temp_date;
        } else if (i == 10) {
          str_day11 = temp_date;
        } else if (i == 11) {
          str_day12 = temp_date;
        } else if (i == 12) {
          str_day13 = temp_date;
        } else if (i == 13) {
          str_day14 = temp_date;
        }

        arrayDay[i] = temp_date.replaceAll("-", "");
        // 0~6 : 일~월
      }

      model.addAttribute("str_day1", str_day1);
      model.addAttribute("str_day2", str_day2);
      model.addAttribute("str_day3", str_day3);
      model.addAttribute("str_day4", str_day4);
      model.addAttribute("str_day5", str_day5);
      model.addAttribute("str_day6", str_day6);
      model.addAttribute("str_day7", str_day7);

      model.addAttribute("str_day8", str_day8);
      model.addAttribute("str_day9", str_day9);
      model.addAttribute("str_day10", str_day10);
      model.addAttribute("str_day11", str_day11);
      model.addAttribute("str_day12", str_day12);
      model.addAttribute("str_day13", str_day13);
      model.addAttribute("str_day14", str_day14);



      try {
        page = Integer.parseInt(request.getParameter("page"));

      } catch (Exception e) {
        // TODO Auto-generated catch block
        // e.printStackTrace();
      }

      int itemCount;
      // int itemCountPerPage = 30;
      int pageCountPerPaging = 10;

      WooboTechDao dao = new WooboTechDao();

      itemCount = 0;
      List board = null;
      // List board = dao.mng_production_plan(arrayDay,param,page,itemCountPerPage);
      if (!"mng_production_plan".equals(pageView)) {
        itemCount = dao.mng_production_plan_count(arrayDay, param);
        board = dao.mng_production_plan_excel(arrayDay, param, page, itemCountPerPage);
      }


      int maxPage = ListController.getMaxPage(itemCount, itemCountPerPage);
      List paging = ListController.getPaging(page, maxPage, pageCountPerPaging);

      model.addAttribute("board", board);
      model.addAttribute("itemCount", itemCount);
      model.addAttribute("currentPage", page);
      model.addAttribute("maxPage", maxPage);
      model.addAttribute("paging", paging);
      model.addAttribute("startdate", DateUtil.addFormat(startdate));
      model.addAttribute("itemCountPerPage", itemCountPerPage);
    } catch (Exception e) {
      e.printStackTrace();
    }

    logger.info("◁◀◁◀◁◀ mng_production_plan_excel end");
    return new ModelAndView("mng/" + pageView);
  }

  @RequestMapping(value = "/mng_stock_plan_excel")
  public ModelAndView mng_stock_plan(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("▷▶▷▶▷▶mng_stock_plan_excel start");

    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_stock_plan_excel");
    String startdate = F.nullCheck(request.getParameter("startdate"), "");
    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));

    int itemCountPerPage =
        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "30"));
    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");
    if (session_cu_code == null) {
      RedirectView redirectView = new RedirectView("mng_login?menu=0");
      // redirectView.set
      redirectView.setExposeModelAttributes(false);
      logger.info("◁◀◁◀◁◀  mng_login_user end");
      return new ModelAndView(redirectView);

    }
    param.put("session_cu_code", session_cu_code);

    String temp_dayWeek = "";
    String[] arrayDay = new String[2];
    if (!"".equals(startdate)) {
      startdate = startdate.replaceAll("-", "");
    } else {
      startdate = DateUtil.getCurrentDate();
    }
    try {
      arrayDay[0] = startdate.substring(0, 6) + "01"; // 그달에 시작일
      arrayDay[1] = startdate; // 생산일자


      try {
        page = Integer.parseInt(request.getParameter("page"));

      } catch (Exception e) {
        // TODO Auto-generated catch block
        // e.printStackTrace();
      }

      int itemCount = 0;;
      // int itemCountPerPage = 30;
      int pageCountPerPaging = 10;
      List board = null;
      WooboTechDao dao = new WooboTechDao();
      if (!"mng_stock_plan".equals(pageView)) {
        itemCount = dao.mng_stock_plan_count(arrayDay, param);
        logger.info("◁◀◁◀◁◀ mng_biz_plan end2");
        board = dao.mng_stock_plan_excel(arrayDay, param, page, itemCountPerPage);
      }

      int maxPage = ListController.getMaxPage(itemCount, itemCountPerPage);
      List paging = ListController.getPaging(page, maxPage, pageCountPerPaging);

      model.addAttribute("board", board);
      model.addAttribute("itemCount", itemCount);
      model.addAttribute("currentPage", page);
      model.addAttribute("maxPage", maxPage);
      model.addAttribute("paging", paging);
      model.addAttribute("startdate", DateUtil.addFormat(startdate));
      model.addAttribute("itemCountPerPage", itemCountPerPage);

    } catch (Exception e) {
      e.printStackTrace();
    }

    logger.info("◁◀◁◀◁◀ mng_biz_plan_plan end");
    return new ModelAndView("mng/" + pageView);

  }

}
