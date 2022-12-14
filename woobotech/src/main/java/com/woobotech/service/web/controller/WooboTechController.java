package com.woobotech.service.web.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.krysalis.barcode4j.impl.code128.Code128Bean;
import org.krysalis.barcode4j.impl.code128.Code128Constants;
import org.krysalis.barcode4j.output.bitmap.BitmapCanvasProvider;
import org.krysalis.barcode4j.tools.UnitConv;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.RedirectView;
import com.woobotech.service.MngLoginService;
import com.woobotech.service.WooboService;
import com.woobotech.service.jutil.DateUtil;
import com.woobotech.service.jutil.Script;
import com.woobotech.service.web.dao.WooboTechDao;
import com.woobotech.service.web.dto.DeliveryDTO;
import com.woobotech.service.web.dto.ExportDTO;
import com.woobotech.service.web.dto.LabelDTO;
import com.woobotech.service.web.dto.MangerDTO;
import com.woobotech.service.web.dto.MemberDTO;
import com.woobotech.service.web.dto.MngDTO;
import com.woobotech.service.web.dto.NotiDTO;
import com.woobotech.service.web.dto.QnADTO;
import com.woobotech.service.web.dto.TrnsDTO;
import com.woobotech.tools.F;
import com.woobotech.tools.ListController;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import java.net.URLDecoder;

@Controller
public class WooboTechController {

  private static final Logger logger = LoggerFactory.getLogger(WooboTechController.class);

  @Autowired
  SessionLocaleResolver localeResolver;

  @Autowired
  MessageSource messageSource;

  @Autowired
  MngLoginService mngLoginService;
  @Autowired
  WooboService wooboService;

  @Resource(name = "uploadPath")
  private String uploadPath;

  // ??????????????? ?????? ?????? - useyn ??????
  @RequestMapping(value = "mng_trns_del")
  public void mng_trns_del(Locale locale, HttpServletRequest request, Model model,
      @RequestParam Map<String, String> param) throws SQLException {

    WooboTechDao wdao = new WooboTechDao();

    System.out.println("del ????????????");

    wdao.mng_trns_del(param);
    wdao.mng_moni_del(param);

  }

  // ??????????????? ?????? ?????? ?????? - useyn ??????
  @RequestMapping(value = "mng_trns_delAll")
  public void mng_trns_delAll(Locale locale, HttpServletRequest request, Model model,
      @RequestParam Map<String, String> param,
      @RequestParam(value = "delList[]") List<String> chArr) throws SQLException {

    WooboTechDao wdao = new WooboTechDao();

    System.out.println("delAll ????????????");

    int result = 0;
    String barNum = "";

    for (String i : chArr) {
      barNum = i;
      wdao.mng_trns_delAll(i);                                      ////???????????????????????????220721??????????????? mng_trns_del??? ???????????? ???????????? ???????????? dao??? ?????? ??????
      wdao.mng_moni_delAll(i);                                     ////???????????????????????????220721??????????????? mng_moni_del??? ???????????? ???????????? ???????????? dao??? ?????? ??????
    }

    // result = 1;

    // wdao.mng_trns_delAll(param);
    // wdao.mng_moni_delAll(param);

  }

  // ?????? ?????? ?????? 2022-04-25 ?????????
  @RequestMapping(value = "/mng_delivery_moni")
  public String mng_delivery_moni(Locale locale, HttpServletRequest request, Model model,
      @RequestParam Map<String, String> param) {
    HttpSession session = request.getSession();
    System.out.println("moni controller@@@@@@@@@@@@@@@@@@@@@@@@@@");
    String session_cu_code = (String) session.getAttribute("cu_code");
    // System.out.println(session_cu_code);

    if (session_cu_code == null) {
      RedirectView redirectView = new RedirectView("mng_login?menu=0");
      redirectView.setExposeModelAttributes(false);
    }

    param.put("session_cu_code", session_cu_code);

    Date date = new Date();
    DateFormat dateFormat =
        DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_delivery_moni");
    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));
    String indate = DateUtil.getConvertDate(F.nullCheck(request.getParameter("indate"), ""));
    int itemCountPerPage =
        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "10"));

    try {
      page = Integer.parseInt(request.getParameter("page"));
    } catch (Exception e) {
      // TODO Auto-generated catch block
      // e.printStackTrace();
    }
    if (!"".equals(indate)) {
      indate = indate.replaceAll("-", "");
    } else {
      indate = DateUtil.getCurrentDate();
    }

    int itemCount;
    int totalCount;
    int pageCountPerPaging = 10;

    String formattedDate = dateFormat.format(date);
    WooboTechDao wdao = new WooboTechDao();
    param.put("indate", indate);
    // System.out.println(indate);
    itemCount = wdao.mng_delivery_moni_count(param);
    System.out.println("220926??????");
    totalCount = wdao.mng_delivery_moni_total(param);
    System.out.println("?????? : " + itemCount);

    List board = wdao.mng_delivery_moni(param, page, itemCountPerPage);
    System.out.println("220926??????1");
    int maxPage = ListController.getMaxPage(itemCount, itemCountPerPage);System.out.println("220926??????2");
    List paging = ListController.getPaging(page, maxPage, pageCountPerPaging);System.out.println("220926??????3");

    model.addAttribute("serverTime", formattedDate);
    model.addAttribute("board", board);
    model.addAttribute("itemCount", itemCount);
    model.addAttribute("totalCount", totalCount);
    model.addAttribute("currentPage", page);
    model.addAttribute("maxPage", maxPage);
    model.addAttribute("paging", paging);
    model.addAttribute("itemCountPerPage", itemCountPerPage);

    return "mng/mng_delivery_moni";
  }

  // ?????? ?????? ?????? ?????? (????????? ?????? ??????)
  @RequestMapping(value = "/mng_delivery_detail")
  public String mng_delivery_dt(Locale locale, HttpServletRequest request, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_delivery_detail start");
    HttpSession session = request.getSession();
    String session_cu_code = (String) session.getAttribute("cu_code");

    if (session_cu_code == null) {
      RedirectView redirectView = new RedirectView("mng_login?menu=0");
      redirectView.setExposeModelAttributes(false);
    }

    param.put("session_cu_code", session_cu_code);
   
    Date date = new Date();
    DateFormat dateFormat =
        DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_delivery_moni");
    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));
    String indate = DateUtil.getConvertDate(F.nullCheck(request.getParameter("indate"), ""));
    String cno = F.nullCheck(request.getParameter("cno"), "");
    String branch = F.nullCheck(request.getParameter("branch"), "");
    int itemCountPerPage =
        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "10"));
    System.out.println("cno:" + cno);
    System.out.println("branch:" + branch);
    try {           //???????????????????????????220725??????????????? try-catch??? ??????
      page = Integer.parseInt(request.getParameter("page"));
    } catch (Exception e) {
      // TODO Auto-generated catch block
      // e.printStackTrace();
    }
    if (!"".equals(indate)) {
      indate = indate.replaceAll("-", "");
    } else {
      indate = DateUtil.getCurrentDate();
    }

    int itemCount;
    int pageCountPerPaging = 10;

    String formattedDate = dateFormat.format(date);
    WooboTechDao wdao = new WooboTechDao();
    param.put("indate", indate);
    param.put("cno", cno);
    param.put("branch", branch);
    // System.out.println(indate);

    itemCount = wdao.mng_delivery_dt_count(param);
    System.out.println("?????? : " + itemCount);
    List board = wdao.mng_delivery_detail(param, page, itemCountPerPage);

    int maxPage = ListController.getMaxPage(itemCount, itemCountPerPage);
    List paging = ListController.getPaging(page, maxPage, pageCountPerPaging);
System.out.println("220926 dtime?????? "+board.get(0));
    model.addAttribute("serverTime", formattedDate);
    model.addAttribute("board", board);
    model.addAttribute("itemCount", itemCount);
    model.addAttribute("currentPage", page);
    model.addAttribute("maxPage", maxPage);
    model.addAttribute("paging", paging);
    model.addAttribute("itemCountPerPage", itemCountPerPage);
    logger.info("?????????????????? mng_delivery_detail end");
    return "mng/mng_delivery_detail";
  }

    // ?????????????????? - ???????????????  ??????????????????
  @RequestMapping(value = "/mng_trns_invoice_u", method = {RequestMethod.POST})
  public String mng_trns_memo_u(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_trns_memo_u start");
    int result = -1;
    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    param.put("session_cu_code", session_cu_code);

    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_trns_invoice_u(param);
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_trns_memo_u end");
    return "ajaxResult";
  }
  
  // ?????????????????? - ???????????????  ????????????
  @RequestMapping(value = "/mng_trns_memo_sub_u", method = {RequestMethod.POST})
  public String mng_trns_memo_sub_u(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_trns_memo_sub_u start");
    int result = -1;
    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    param.put("session_cu_code", session_cu_code);

    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_trns_memo_sub_u(param);
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_trns_memo_sub_u end");
    return "ajaxResult";
  }
  
//?????????????????? - ???????????????  ????????????   221024 ?????????
 @RequestMapping(value = "/mng_trns_memo_sub_u2", method = {RequestMethod.POST})
 public String mng_trns_memo_sub_u2(HttpServletRequest request, Locale locale, Model model,
     @RequestParam Map<String, String> param) {
   logger.info("?????????????????? mng_trns_memo_sub_u start");
   int result = -1;
   HttpSession session = request.getSession();

   String session_cu_code = (String) session.getAttribute("cu_code");

   param.put("session_cu_code", session_cu_code);
   String memo1 = request.getParameter("memo");
   System.out.println("memo????????????"+memo1);
   
   param.put("memo1",memo1);
   System.out.println("param??????"+param);
   WooboTechDao dao = new WooboTechDao();
   result = dao.mng_trns_memo_sub_u2(param);
   model.addAttribute("result", result);
   logger.info("?????????????????? mng_trns_memo_sub_u end");
   return "ajaxResult";
 }

  // ?????? ?????? ??? ?????? 2022-04-25 ?????????
  @RequestMapping(value = "/mng_trns_memo2_u", method = {RequestMethod.POST})
  public String mng_trns_memo2_u(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_trns_memo2_u start");
    int result = -1;
    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    param.put("session_cu_code", session_cu_code);

    WooboTechDao wdao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = wdao.mng_trns_memo2_u(param);
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_trns_memo2_u end");


    return "ajaxResult";
  }
  
  //?????????????????? ?????? ????????? ???????????? 220620
  @RequestMapping(value = "/mng_trns_memo3_u", method = {RequestMethod.POST})
  public String mng_trns_memo3_u(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_trns_memo3_u start");
    int result = -1;
    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    param.put("session_cu_code", session_cu_code);

    WooboTechDao wdao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = wdao.mng_trns_memo3_u(param);
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_trns_memo3_u end");


    return "ajaxResult";
  }

  // ?????? - ????????? ????????? ??????                    //???????????????????????????220725???????????????
  @RequestMapping(value = "/mng_print")
  public String mng_print(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("??????????????????mng_print start");


    WooboTechDao dao = new WooboTechDao();
    dao.mng_re_trns_data_text(param);
    List<TrnsDTO> arrList = dao.mng_re_trns_data(param);

    HttpSession session = request.getSession();

    TrnsDTO info = arrList.get(0);
    String cu_sano = (String) session.getAttribute("cu_sano");
    String cu_sangho = (String) session.getAttribute("cu_sangho");
    String cu_juso = (String) session.getAttribute("cu_juso");
    System.out.println("cu_juso:" + cu_juso);

    // model.addAttribute("cu_sano",
    // cu_sano.substring(0,3)+"-"+cu_sano.substring(3,6)+"-"+cu_sano.substring(5,cu_sano.length()));
    model.addAttribute("cu_sano",
        info.getCu_sano().substring(0, 3) + "-" + info.getCu_sano().substring(3, 5) + "-"
            + info.getCu_sano().substring(5, info.getCu_sano().length()));
    model.addAttribute("cu_sangho", info.getCustname());
    model.addAttribute("cu_master", info.getCu_master());

    model.addAttribute("cu_juso", info.getCu_juso());
    System.out.println("cu_juso:" + info.getCu_juso());
    model.addAttribute("bak_juso", info.getBak_juso());
    // model.addAttribute("cu_juso", text);
    System.out.println(info.getPrdate());
    model.addAttribute("prdate", info.getPrdate().substring(0, 4) + "???"
        + info.getPrdate().substring(5, 7) + "???" + info.getPrdate().substring(8, 10) + "???");// ????????????
    // model.addAttribute("indate", info.get//????????????
    model.addAttribute("cu_uptae", info.getUptae());// ??????
    model.addAttribute("cu_upjong", info.getUpjong());// ??????
    model.addAttribute("barcode", info.getBarcode());
    model.addAttribute("board", arrList);
    model.addAttribute("memo", info.getMemo());

    logger.info("?????????????????? mng_print end");
    return "mng/mng_print";
  }

  // ??????????????? ????????? ??????
  @RequestMapping(value = "/mng_re_trns_data")
  public String mng_re_trns_data(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("??????????????????mng_retrns_data start");

    System.out.println("here!");

    WooboTechDao dao = new WooboTechDao();
    List<TrnsDTO> arrList = dao.mng_re_trns_data(param);

    HttpSession session = request.getSession();

    TrnsDTO info = arrList.get(0);
    // System.out.println(info.getPrdate().length()+"@@@@@@@@@@@@@");
    
    String cu_sano = (String) session.getAttribute("cu_sano");
    String cu_sangho = (String) session.getAttribute("cu_sangho");
    String cu_juso = (String) session.getAttribute("cu_juso");
    String cu_master = (String) session.getAttribute("cu_master");

    double sumqty = 0;
    for (int i = 0; i < arrList.size(); i++) {
      String temp_itemcode = arrList.get(i).getItemcode1();
      sumqty = sumqty + Double.parseDouble(arrList.get(i).getI_qty());
    }
    System.out.println("info??????"+info);
    // System.out.println("cu_juso:"+cu_juso);
    // model.addAttribute("cu_sano",
    // cu_sano.substring(0,3)+"-"+cu_sano.substring(3,6)+"-"+cu_sano.substring(5,cu_sano.length()));

    // ?????? ?????? ????????? ?????? ?????? 3-2-5
    if(info.getCu_sano().length()>7) {
    model.addAttribute("cu_sano",
        info.getCu_sano().substring(0, 3) + "-" + info.getCu_sano().substring(3, 5) + "-"
            + info.getCu_sano().substring(5, info.getCu_sano().length()));
    }
    String sangho = info.getCustname();
    sangho = sangho.replace("<br>", "");
    model.addAttribute("cu_sangho", sangho);
    model.addAttribute("cu_juso", info.getCu_juso());
    System.out.println("cu_juso:" + cu_juso);
    model.addAttribute("prdate", info.getPrdate());
    System.out.println(" ????????? ????????????" + info.getPrdate());
    
    System.out.println(" ????????? ???" + info.getPrdate().substring(4, 7));
    // model.addAttribute("outdate", info.getPrdate().substring(0,4)+"???"
    // +info.getPrdate().substring(5,7)+"???" +info.getPrdate().substring(8,10)+"???");//????????????
    model.addAttribute("cu_code", info.getCuCode());
    model.addAttribute("cu_master", info.getCu_master());
    // model.addAttribute("indate", info.get//????????????
    model.addAttribute("cu_uptae", info.getUptae());// ??????
    model.addAttribute("cu_upjong", info.getUpjong());// ??????
    model.addAttribute("bak_juso", info.getBak_juso());
    model.addAttribute("barcode", info.getBarcode());
    model.addAttribute("board", arrList);
    model.addAttribute("pageview", "mng_re_trns_data");
    model.addAttribute("memo", info.getMemo());
    model.addAttribute("memo2", info.getMemo2());
    model.addAttribute("invoiceno", info.getInvoiceno());
    
    System.out.println(" ????????? ????????????" + info.getPrdate());
    model.addAttribute("itemcode", info.getItemcode1());
    model.addAttribute("sumqty",sumqty );
    logger.info("?????????????????? mng_retrns_data end");
    return "mng/mng_retrns_dt";
  }
//?????????
  @RequestMapping(value = "/mng_export_data")
  public String mng_export_data(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("??????????????????mng_export_data start");

    System.out.println("here!");

    WooboTechDao dao = new WooboTechDao();
   
    List<ExportDTO> arrList = dao.mng_export_data(param);
    
    HttpSession session = request.getSession();
    System.out.println("here!"+arrList);
    ExportDTO info = arrList.get(0);
    // System.out.println(info.getPrdate().length()+"@@@@@@@@@@@@@");
    System.out.println("here!");
    String cu_sano = (String) session.getAttribute("cu_sano");
    String cu_sangho = (String) session.getAttribute("cu_sangho");
    String cu_juso = (String) session.getAttribute("cu_juso");
    String cu_master = (String) session.getAttribute("cu_master");
    
    int sumqty = 0;
    for (int i = 0; i < arrList.size(); i++) {
      String temp_itemcode = arrList.get(i).getItemcode1();
      sumqty = sumqty + Integer.parseInt(arrList.get(i).getI_qty());
    }
    // System.out.println("cu_juso:"+cu_juso);
    // model.addAttribute("cu_sano",
    // cu_sano.substring(0,3)+"-"+cu_sano.substring(3,6)+"-"+cu_sano.substring(5,cu_sano.length()));

    // ?????? ?????? ????????? ?????? ?????? 3-2-5
    if(info.getCu_sano().length()>7) {
    model.addAttribute("cu_sano",
        info.getCu_sano().substring(0, 3) + "-" + info.getCu_sano().substring(3, 5) + "-"
            + info.getCu_sano().substring(5, info.getCu_sano().length()));
    }
    model.addAttribute("cu_sangho", info.getCustname());
    model.addAttribute("cu_juso", info.getCu_juso());
    System.out.println("cu_juso:" + cu_juso);
    System.out.println(" ????????? ????????????" + info.getPrdate());
    System.out.println(" ????????? ???" + info.getPrdate().substring(4, 7));
    // model.addAttribute("outdate", info.getPrdate().substring(0,4)+"???"
    // +info.getPrdate().substring(5,7)+"???" +info.getPrdate().substring(8,10)+"???");//????????????
    model.addAttribute("cname",info.getCname());
    model.addAttribute("cu_master", info.getCu_master());
    // model.addAttribute("indate", info.get//????????????
    model.addAttribute("cu_uptae", info.getUptae());// ??????
    model.addAttribute("cu_upjong", info.getUpjong());// ??????
    model.addAttribute("bak_juso", info.getBak_juso());
    model.addAttribute("barcode", info.getBarcode());
    model.addAttribute("board", arrList);
    model.addAttribute("pageview", "mng_export_data");
    model.addAttribute("memo", info.getMemo());
    model.addAttribute("memo2", info.getMemo2());
    model.addAttribute("prdate", info.getPrdate());
    model.addAttribute("itemcode", info.getItemcode1());
    model.addAttribute("sumqty",sumqty );
    //model.addAttribute("carname",info.getCarname());
    logger.info("?????????????????? mng_export end");
    return "mng/mng_export_dt";
  }
//===========================================================================================
  
  // ?????????????????????
  @RequestMapping(value = "/mng_re_trns")
  public String mng_re_trns(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("??????????????????mng_re_trns start");

    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    if (session_cu_code == null) {
      RedirectView redirectView = new RedirectView("mng_login?menu=0");
      // redirectView.set
      redirectView.setExposeModelAttributes(false);
      logger.info("??????????????????  mng_login_user end");
      // return new ModelAndView(redirectView);

    }
    param.put("session_cu_code", session_cu_code);

    Date date = new Date();
    DateFormat dateFormat =
        DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_re_trns");
    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));
    String startdate = DateUtil.getConvertDate(F.nullCheck(request.getParameter("startdate"), ""));

    int itemCountPerPage =
        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "300"));
    try {           //???????????????????????????220725???????????????   try-catch?????? ??????
      page = Integer.parseInt(request.getParameter("page"));
System.out.println("300??????"+itemCountPerPage);
    } catch (Exception e) {
      // TODO Auto-generated catch block
      // e.printStackTrace();
    }
    /*
    if (!"".equals(startdate)) {
      startdate = startdate.replaceAll("-", "");
    } else {
      startdate = DateUtil.getCurrentDate();
    }
     */
    int itemCount;
    // int itemCountPerPage = 30;
    int pageCountPerPaging = 10;

    String formattedDate = dateFormat.format(date);
    WooboTechDao dao = new WooboTechDao();
    param.put("startdate", startdate);
    if(pageView!="mng_re_trns") {
      itemCount = dao.mng_re_trns_count(param);
      List board = dao.mng_re_trns(param, page, itemCountPerPage);
      
      int maxPage = ListController.getMaxPage(itemCount, itemCountPerPage);
      List paging = ListController.getPaging(page, maxPage, pageCountPerPaging);
  
      model.addAttribute("serverTime", formattedDate);
      model.addAttribute("board", board);
      model.addAttribute("board", board);
      model.addAttribute("itemCount", itemCount);
      model.addAttribute("currentPage", page);
      model.addAttribute("maxPage", maxPage);
      model.addAttribute("paging", paging);
      model.addAttribute("startdate", DateUtil.addFormat(startdate));
      model.addAttribute("itemCountPerPage", itemCountPerPage);
      model.addAttribute("prdate", board);
    }
    logger.info("?????????????????? mng_re_trns end");
    return "mng/" + pageView;
  }

  // ??????????????? ??????
  @RequestMapping(value = "/mng_manger_view_u", method = {RequestMethod.POST})
  public String mng_manger_view_u(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_manger_view_u start");
    int result = -1;
    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    param.put("session_cu_code", session_cu_code);

    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_manger_view_u(param);
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_manger_view_u end");
    return "ajaxResult";
  }

  // ????????? ??????
  @RequestMapping(value = "/mng_manger_view")
  public ModelAndView mng_manager_view(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) throws SQLException {
    logger.info("??????????????????mng_manger_view start");


    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");
    if (session_cu_code == null) {
      RedirectView redirectView = new RedirectView("mng_login?menu=0");
      // redirectView.set
      redirectView.setExposeModelAttributes(false);
      logger.info("??????????????????  mng_login_user end");
      return new ModelAndView(redirectView);

    }
    param.put("cust_code", session_cu_code);
    WooboTechDao dao = new WooboTechDao();
    int cnt = dao.userCount(session_cu_code);
    if(cnt>0) {
      MangerDTO board = dao.mng_manger_view(param);
      model.addAttribute("board", board);
      logger.info("?????????????????? mng_manger_view end");
      return new ModelAndView("mng/mng_manger_view");
    }else {
      model.addAttribute("msg","There is no registered user information.");
      logger.info("?????????????????? mng_manger_view end");
      return new ModelAndView("mng/mng_manger_view");
    }
  }

  // ????????? ??? ??????
  @RequestMapping(value = "/mng_data_file_d", method = {RequestMethod.POST})
  public String mng_data_file_d(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_data_file_d start");
    int result = -1;

    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_data_file_d(param, uploadPath + "//atach");
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_data_file_d end");
    return "ajaxResult";
  }

  // ????????? ??? ??????
  @RequestMapping(value = "/mng_data_file_dt_u", method = {RequestMethod.POST})
  public String mng_data_file_dt_u(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_data_file_u start");
    int result = -1;
    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    param.put("session_cu_code", session_cu_code);
    System.out.println("session_cu_code:" + session_cu_code);
    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_data_file_dt_u(request, param, uploadPath + "//atach");
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_data_file_u end");
    return "ajaxResult";
  }

  // ????????? ????????????
  @RequestMapping(value = "/mng_data_file_dt", method = {RequestMethod.GET, RequestMethod.POST})
  public String mng_data_file_dt(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) throws SQLException {
    logger.info("?????????????????? mng_data_file_dt start");
    HttpSession session = request.getSession();
    String adminId = (String) session.getAttribute("cu_code");
    System.out.println("mng_noti_dt ???????????? ==>" + adminId);
    WooboTechDao dao = new WooboTechDao();

    dao.hit_brd(param);         // ????????? ????????? ??????

    NotiDTO board = dao.mng_data_file_dt(param);        // ????????????
    List file = dao.mng_noti_file(param);                       // ??????
    model.addAttribute("board", board);
    model.addAttribute("board2", file);
    model.addAttribute("adminId", adminId);
    logger.info("?????????????????? mng_data_file_dt end");
    return "mng/mng_data_file_dt";
  }

  // ????????? ??? ??????
  @RequestMapping(value = "/mng_data_file_add_i", method = {RequestMethod.POST})
  public String mng_data_file_add_i(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_data_file_add_i start");
    int result = -1;
    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    param.put("session_cu_code", session_cu_code);
    System.out.println("session_cu_code:" + session_cu_code);
    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_data_file_add_i(request, param, uploadPath + "//atach");
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_data_file_add_i end");
    return "ajaxResult";
  }

  // ????????? ????????????
  @RequestMapping(value = "/mng_data_file_add")
  public String mng_data_file_add(Locale locale, Model model) {
    logger.info("??????????????????mng_data_file_add start");

    logger.info("?????????????????? mng_data_file_add end");
    return "mng/mng_data_file_add";
  }

  // ????????? ????????? ?????????
  @RequestMapping(value = "/mng_data_file")
  public String mng_data_file(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("??????????????????mng_data_file start");

    Date date = new Date();
    DateFormat dateFormat =
        DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_data_file");
    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));
    int itemCountPerPage =
        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "300"));

    try {       //???????????????????????????220725??????????????? try-catch???
      page = Integer.parseInt(request.getParameter("page"));

    } catch (Exception e) {
      // TODO Auto-generated catch block
      // e.printStackTrace();
    }

    int itemCount;

    // int itemCountPerPage = 30;
    int pageCountPerPaging = 10;

    String formattedDate = dateFormat.format(date);
    WooboTechDao dao = new WooboTechDao();
    if(pageView!="mng_data_file") {
      itemCount = dao.mng_data_file_count(param);
      List board = dao.mng_data_file(param, page, itemCountPerPage);
  
      int maxPage = ListController.getMaxPage(itemCount, itemCountPerPage);
      List paging = ListController.getPaging(page, maxPage, pageCountPerPaging);
  
      model.addAttribute("serverTime", formattedDate);
      model.addAttribute("board", board);
      model.addAttribute("itemCount", itemCount);
      model.addAttribute("currentPage", page);
      model.addAttribute("maxPage", maxPage);
      model.addAttribute("paging", paging);
      model.addAttribute("itemCountPerPage", itemCountPerPage);
    }
    logger.info("?????????????????? mng_data_file end");
    return "mng/" + pageView;
  }

  // ????????????????????? - ???????????? ????????? -> ???????????? ??????
  @RequestMapping(value = "/mng_delivery_state_u2", method = {RequestMethod.POST})
  public String mng_delivery_state_u2(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_delivery_state_u2 start");
    int result = -1;
    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    param.put("session_cu_code", session_cu_code);
    System.out.println("session_cu_code:" + session_cu_code);
    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_delivery_state_u2(param);
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_delivery_state_u2 end");
    return "ajaxResult";
  }

  // ??????                    //??? mng_delivery??????
  @RequestMapping(value = "/mng_delivery_state_u", method = {RequestMethod.POST})
  public String mng_delivery_state_u(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_delivery_state_u start");
    int result = -1;
    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    param.put("session_cu_code", session_cu_code);
    System.out.println("session_cu_code:" + session_cu_code);
    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_delivery_state_u(param);
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_delivery_state_u end");
    return "ajaxResult";
  }

  // ??????     //???????????????????????????220725???????????????mng_delivery_dt??????
  @RequestMapping(value = "/mng_delivery_dt", method = {RequestMethod.POST})
  public String mng_delivery_dt(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_delivery_dt start");
    int result = -1;
    HttpSession session = request.getSession();

    // String session_cu_code = (String)session.getAttribute("cu_code");

    // param.put("session_cu_code",session_cu_code);
    // System.out.println("session_cu_code:"+session_cu_code);
    WooboTechDao dao = new WooboTechDao();
    List board = dao.mng_delivery_dt(param);
    // result = dao.mng_delivery_state_u(param);
    model.addAttribute("board", board);
    logger.info("?????????????????? mng_delivery_dt end");
    return "mng/mng_delivery_dt";
  }
  
//???????????????????????????220725??????????????? mng_delivery??????
  @RequestMapping(value = "/mng_delivery")
  public String mng_delivery(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("??????????????????mng_delivery start");
    Date date = new Date();
    DateFormat dateFormat =
        DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_delivery");
    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));
    String startdate = DateUtil.getConvertDate(F.nullCheck(request.getParameter("startdate"), ""));
    int itemCountPerPage =
        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "30"));
    try {
      page = Integer.parseInt(request.getParameter("page"));

    } catch (Exception e) {
      // TODO Auto-generated catch block
      // e.printStackTrace();
    }
    if (!"".equals(startdate)) {
      startdate = startdate.replaceAll("-", "");
    } else {
      startdate = DateUtil.getCurrentDate();
    }

    int itemCount;
    // int itemCountPerPage = 30;
    int pageCountPerPaging = 10;

    String formattedDate = dateFormat.format(date);
    WooboTechDao dao = new WooboTechDao();
    param.put("startdate", startdate);
    itemCount = dao.mng_delivery_count(param);
    List board = dao.mng_delivery(param, page, itemCountPerPage);


    int maxPage = ListController.getMaxPage(itemCount, itemCountPerPage);
    List paging = ListController.getPaging(page, maxPage, pageCountPerPaging);

    model.addAttribute("serverTime", formattedDate);
    model.addAttribute("board", board);
    model.addAttribute("board", board);
    model.addAttribute("itemCount", itemCount);
    model.addAttribute("currentPage", page);
    model.addAttribute("maxPage", maxPage);
    model.addAttribute("paging", paging);
    model.addAttribute("startdate", DateUtil.addFormat(startdate));
    model.addAttribute("itemCountPerPage", itemCountPerPage);
    logger.info("?????????????????? mng_delivery end");
    return "mng/" + pageView;
  }
//???????????????????????????220725??????????????? ???????????? ???????????? ??????
  @RequestMapping(value = "/mng_report_sample")
  public String mng_report_sample(Locale locale, Model model) {
    logger.info("??????????????????mng_report_sample start");


    logger.info("?????????????????? mng_report_sample end");
    return "mng/mng_report_sample";
  }

  // ??????????????????
  @RequestMapping(value = "/mng_production_plan")
  public ModelAndView mng_production_plan(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("??????????????????mng_production_plan start");

    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_production_plan");
    String startdate = DateUtil.getConvertDate(F.nullCheck(request.getParameter("startdate"), ""));
    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));
    int itemCountPerPage =
        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "300"));

    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    if (session_cu_code == null) {
      RedirectView redirectView = new RedirectView("mng_login?menu=0");
      // redirectView.set
      redirectView.setExposeModelAttributes(false);
      logger.info("??????????????????  mng_login_user end");
      return new ModelAndView(redirectView);

    }
    param.put("session_cu_code", session_cu_code);

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
        // 0~6 : ???~???
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
        board = dao.mng_production_plan(arrayDay, param, page, itemCountPerPage);
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

    logger.info("?????????????????? mng_production_plan end");
    return new ModelAndView("mng/" + pageView);
  }
 
  // ????????? ????????? ??????
  @RequestMapping(value = "/mng_cw_noti_dt_u", method = {RequestMethod.POST})
  public String mng_cw_noti_dt_u(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_cw_noti_dt_u start");
    int result = -1;
    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    param.put("session_cu_code", session_cu_code);
    System.out.println("session_cu_code:" + session_cu_code);
    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_noti_dt_u(request, param, uploadPath + "//atach");
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_cw_noti_dt_u end");
    return "ajaxResult";
  }

  // ????????? ???????????? ?????? , ???????????? ???????????? ??????
  @RequestMapping(value = "/mng_file_d", method = {RequestMethod.POST})
  public String mng_file_d(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_file_d start");
    int result = -1;

    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_file_d(param, uploadPath + "//atach");
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_file_d end");
    return "ajaxResult";
  }
 
  // ????????? ????????? ?????? ??????
  @RequestMapping(value = "/mng_cw_qna_add_i", method = {RequestMethod.POST})
  public String mng_cw_qna_add_i(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_cw_qna_add_i start");
    int result = -1;
    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");
    String session_cu_sangho = (String) session.getAttribute("cu_sangho");
    param.put("session_cu_code", session_cu_code);
    param.put("session_cu_sangho", session_cu_sangho);
    System.out.println("session_cu_code:" + session_cu_code);
    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_noti_qna_add_i(request, param, uploadPath + "//atach");
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_cw_qna_add_i end");
    return "ajaxResult";
  }
 
  // ????????? ????????? ?????? ??????
  @RequestMapping(value = "/mng_cw_qna_u", method = {RequestMethod.POST})
  public String mng_cw_qna_u(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_cw_qna_u start");
    int result = -1;

    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_noti_qna_u(request, param, uploadPath + "//atach");
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_cw_qna_u end");
    return "ajaxResult";
  }

  // ????????? ????????? ?????? ??????
  @RequestMapping(value = "/mng_cw_qna_d", method = {RequestMethod.POST})
  public String mng_cw_qna_d(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_cw_qna_d start");
    int result = -1;

    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_noti_qna_d(request, param, uploadPath + "//atach");
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_cw_qna_d end");
    return "ajaxResult";
  }
  
  // ????????? ????????? ??????
  @RequestMapping(value = "/mng_cw_noti_dt", method = {RequestMethod.GET, RequestMethod.POST})
  public String mng_cw_noti_dt(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) throws SQLException {
    logger.info("?????????????????? mng_cw_noti_dt start");
    HttpSession session = request.getSession();
    String session_cu_sangho = (String) session.getAttribute("cu_sangho");
    String adminId = (String) session.getAttribute("cu_code");
    WooboTechDao dao = new WooboTechDao();

    System.out.println("hit++");
    dao.hit_brd(param);     // ?????????

    NotiDTO board = dao.mng_cw_noti_dt(param);
    List file = dao.mng_cw_noti_file(param);
    List<QnADTO> qna = dao.mng_noti_qna(param);// ????????? ????????????
    model.addAttribute("board", board);
    model.addAttribute("board2", file);
    model.addAttribute("text", qna);
    model.addAttribute("session_cu_sangho", session_cu_sangho);
    model.addAttribute("adminId", adminId);
    System.out.println(session_cu_sangho);
    System.out.println(adminId);

    logger.info("?????????????????? mng_cw_noti_dt end");
    return "mng/mng_cw_noti_dt";
  }

  // ????????? ????????? ??????
  @RequestMapping(value = "/mng_cw_noti_add_i", method = {RequestMethod.POST})
  public String mng_cw_noti_add_i(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_cw_noti_add_i start");
    int result = -1;
    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    param.put("session_cu_code", session_cu_code);
    System.out.println("session_cu_code:" + session_cu_code);
    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_cw_noti_add_i(request, param, uploadPath + "//atach");
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_cw_noti_add_i end");
    return "ajaxResult";
  }

  // ????????? ????????? ?????? ??????
  @RequestMapping(value = "/mng_cw_noti_add")
  public String mng_cw_noti_add(Locale locale, Model model) {
    logger.info("??????????????????mng_noti_add start");


    logger.info("?????????????????? mng_cw_noti_add end");
    return "mng/mng_cw_noti_add";
  }
  
  // ????????? ????????? ??????
  @RequestMapping(value = "/mng_cw_noti")
  public String mng_cw_noti(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    long date1;
    logger.info("??????????????????mng_cw_noti start");

    Date date = new Date();
    DateFormat dateFormat =
        DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_cw_noti");
    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));
    int itemCountPerPage =
        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "300"));

    /*
     * try {page = Integer.parseInt(request.getParameter("page"));
     * 
     * } catch (Exception e) { // TODO Auto-generated catch block e.printStackTrace(); }
     */

    int itemCount;
    // int itemCountPerPage = 30;
    int pageCountPerPaging = 10;
    HttpSession session = request.getSession();
    String session_cu_code = (String) session.getAttribute("cu_code");
 
    param.put("session_cu_code", session_cu_code);
    String formattedDate = dateFormat.format(date);
    WooboTechDao dao = new WooboTechDao();
    if(pageView!="mng_cw_noti") {
      itemCount = dao.mng_cw_noti_count(param);      
      List board = dao.mng_cw_noti(param, page, itemCountPerPage);
     
      int maxPage = ListController.getMaxPage(itemCount, itemCountPerPage);
      List paging = ListController.getPaging(page, maxPage, pageCountPerPaging);
  
      int num = (itemCount - (page - 1) * itemCountPerPage);
  
      model.addAttribute("serverTime", formattedDate);
      model.addAttribute("board", board);
      model.addAttribute("board", board);
      model.addAttribute("num", num);
      model.addAttribute("itemCount", itemCount);
      model.addAttribute("currentPage", page);
      model.addAttribute("maxPage", maxPage);
      model.addAttribute("paging", paging);
      model.addAttribute("itemCountPerPage", itemCountPerPage);
    }
   
    logger.info("?????????????????? mng_cw_noti end");
    return "mng/" + pageView;
  }

  // ????????? ????????? ?????? ???????????????
  @RequestMapping(value = "/mng_cu_sangho")
  public String mng_cu_sangho(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("??????????????????mng_cu_sangho start");

    Date date = new Date();
    DateFormat dateFormat =
        DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_cu_sangho");

    String formattedDate = dateFormat.format(date);
    WooboTechDao dao = new WooboTechDao();

    List board = dao.mng_cu_sangho(param);

    model.addAttribute("serverTime", formattedDate);
    model.addAttribute("board", board);

    logger.info("?????????????????? mng_cu_sangho end");
    return "mng/" + pageView;
  }

 
  
  // ???????????? ??????
  @RequestMapping(value = "/mng_noti_dt_u", method = {RequestMethod.POST})
  public String mng_noti_dt_u(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_noti_dt_u start");
    int result = -1;
    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    param.put("session_cu_code", session_cu_code);
    System.out.println("session_cu_code:" + session_cu_code);
    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_noti_dt_u(request, param, uploadPath + "//atach");
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_noti_dt_u end");
    return "ajaxResult";
  }

  // ???????????? ??????
  @RequestMapping(value = "/mng_noti_d", method = {RequestMethod.POST})
  public String mng_category_biz_d(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_noti_d start");
    int result = -1;

    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_noti_d(param, uploadPath + "//atach");
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_noti_d end");
    return "ajaxResult";
  }

  // ???????????? ?????? ??????
  @RequestMapping(value = "/mng_noti_qna_u", method = {RequestMethod.POST})
  public String mng_noti_qna_u(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_noti_qna_u start");
    int result = -1;

    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_noti_qna_u(request, param, uploadPath + "//atach");
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_noti_qna_u end");
    return "ajaxResult";
  }

  // ???????????? ?????? ??????
  @RequestMapping(value = "/mng_noti_qna_d", method = {RequestMethod.POST})
  public String mng_noti_qna_d(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_noti_qna_d start");
    int result = -1;
    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_noti_qna_d(request, param, uploadPath + "//atach");

    model.addAttribute("result", result);

    logger.info("?????????????????? mng_noti_qna_d end");
    return "ajaxResult";
    // return "mng/"+pageView;
  }

  // ???????????? ?????? ??????
  @RequestMapping(value = "/mng_noti_qna_add_i", method = {RequestMethod.POST})
  public String mng_noti_qna_add_i(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_noti_qna_add_i start");
    int result = -1;
    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");
    String session_cu_sangho = (String) session.getAttribute("cu_sangho");
    param.put("session_cu_code", session_cu_code);
    param.put("session_cu_sangho", session_cu_sangho);
    System.out.println("session_cu_code:" + session_cu_code);
    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_noti_qna_add_i(request, param, uploadPath + "//atach");
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_noti_qna_add_i end");
    return "ajaxResult";
  }

  // ???????????? ????????????
  @RequestMapping(value = "/mng_noti_dt", method = {RequestMethod.GET, RequestMethod.POST})
  public String mng_noti_dt(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) throws SQLException {
    logger.info("?????????????????? mng_noti_dt start");
    HttpSession session = request.getSession();
    String adminId = (String) session.getAttribute("cu_code");
    String session_cu_sangho = (String) session.getAttribute("cu_sangho");
    System.out.println("mng_noti_dt ???????????? ==>" + adminId);
    WooboTechDao dao = new WooboTechDao();

    dao.hit_brd(param);

    NotiDTO board = dao.mng_noti_dt(param);// ???????????? ??????,?????? ????????? ????????????
    List file = dao.mng_noti_file(param);// ??????????????? ????????? ?????? ????????????
    List<QnADTO> qna = dao.mng_noti_qna(param);// ????????? ????????????
    model.addAttribute("board", board);
    model.addAttribute("board2", file);
    model.addAttribute("text", qna);
    model.addAttribute("adminId", adminId);
    model.addAttribute("session_cu_sangho", session_cu_sangho);
    return "mng/mng_noti_dt";
  }

  // ???????????? ??? ??????
  @RequestMapping(value = "/mng_noti_add_i", method = {RequestMethod.POST})
  public String mng_noti_add_i(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("?????????????????? mng_noti_add_i start");
    int result = -1;
    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    param.put("session_cu_code", session_cu_code);
    System.out.println("session_cu_code:" + session_cu_code);
    WooboTechDao dao = new WooboTechDao();
    // MemberBizDTO board = dao.mng_biz_dt(param);
    result = dao.mng_noti_add_i(request, param, uploadPath + "//atach");
    model.addAttribute("result", result);
    logger.info("?????????????????? mng_noti_add_i end");
    return "ajaxResult";
  }

  // ???????????? ????????????
  @RequestMapping(value = "/mng_noti_add")
  public String mng_noti_add(Locale locale, Model model) {
    logger.info("??????????????????mng_noti_add start");


    logger.info("?????????????????? mng_noti_add end");
    return "mng/mng_noti_add";
  }

  // ???????????? ???????????? ?????????
  @RequestMapping(value = "/mng_noti")
  public String mng_noti(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("??????????????????mng_noti start");

    Date date = new Date();
    DateFormat dateFormat =
        DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_noti");System.out.println("@@@@@@@@@@@@@@@@@@@@@"+request.getParameter("pageView"));
    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));
    int itemCountPerPage =
        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "300"));

    try {
      page = Integer.parseInt(request.getParameter("page"));

    } catch (Exception e) {
      // TODO Auto-generated catch block
      // e.printStackTrace();
    }

    int itemCount;
    // int itemCountPerPage = 30;
    int pageCountPerPaging = 10;

    String formattedDate = dateFormat.format(date);
    WooboTechDao dao = new WooboTechDao();
    if(pageView!="mng_noti") {
      itemCount = dao.mng_noti_count(param);
      List board = dao.mng_noti(param, page, itemCountPerPage);
      // List file = dao.mng_noti_file(param);
  
      int maxPage = ListController.getMaxPage(itemCount, itemCountPerPage);
      List paging = ListController.getPaging(page, maxPage, pageCountPerPaging);
  
      int num = (itemCount - (page - 1) * itemCountPerPage);
  
      model.addAttribute("serverTime", formattedDate);
      model.addAttribute("board", board);
      model.addAttribute("num", num);
      model.addAttribute("board", board);
      model.addAttribute("itemCount", itemCount);
      model.addAttribute("currentPage", page);
      model.addAttribute("maxPage", maxPage);
      model.addAttribute("paging", paging);
      model.addAttribute("itemCountPerPage", itemCountPerPage);
    }
    // model.addAttribute("board2", file );
    logger.info("?????????????????? mng_noti end");
    return "mng/" + pageView;
  }

  // ???????????? ?????????
  @RequestMapping(value = "/mng_stock_plan")
  public ModelAndView mng_stock_plan(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("??????????????????mng_stock_plan start");

    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_stock_plan");
    String startdate = DateUtil.getConvertDate(F.nullCheck(request.getParameter("startdate"), ""));
    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));

    int itemCountPerPage =
        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "300"));
    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");
    if (session_cu_code == null) {
      RedirectView redirectView = new RedirectView("mng_login?menu=0");
      // redirectView.set
      redirectView.setExposeModelAttributes(false);
      logger.info("??????????????????  mng_login_user end");
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
      arrayDay[0] = startdate.substring(0, 6) + "01"; // ????????? ?????????
      arrayDay[1] = startdate; // ????????????

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
        //itemCount = dao.mng_stock_plan_count(arrayDay, param);
        logger.info("?????????????????? mng_biz_plan end2");
        board = dao.mng_stock_plan(arrayDay, param, page, itemCountPerPage);
       
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

    logger.info("?????????????????? mng_stock_plan end");
    return new ModelAndView("mng/" + pageView);

  }

  // ??????????????????
  @RequestMapping(value = "/mng_biz_plan")
  public ModelAndView mng_biz_plan(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("??????????????????mng_biz_plan start");

    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_biz_plan");
    String startdate = DateUtil.getConvertDate(F.nullCheck(request.getParameter("startdate"), ""));
    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));
    int itemCountPerPage =
        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "300"));

    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    if (session_cu_code == null) {
      RedirectView redirectView = new RedirectView("mng_login?menu=0");
      // redirectView.set
      redirectView.setExposeModelAttributes(false);
      logger.info("??????????????????  mng_login_user end");
      return new ModelAndView(redirectView);

    }
    param.put("session_cu_code", session_cu_code);

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
        // 0~6 : ???~???
      }
System.out.println("????????????220919"+str_day1);
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
      // List colist = null;

      WooboTechDao dao = new WooboTechDao();

      if (!"mng_biz_plan".equals(pageView)) {
        itemCount = dao.mng_biz_plan_count(arrayDay, param);
        board = dao.mng_biz_plan(arrayDay, param, page, itemCountPerPage);
        // colist = dao.mng_co_list(param);
      }

      int maxPage = ListController.getMaxPage(itemCount, itemCountPerPage);
      List paging = ListController.getPaging(page, maxPage, pageCountPerPaging);

      // colist = dao.mng_co_list(param);

      model.addAttribute("board", board);
      // model.addAttribute("colist",colist);
      model.addAttribute("itemCount", itemCount);
      model.addAttribute("currentPage", page);
      model.addAttribute("maxPage", maxPage);
      model.addAttribute("paging", paging);
      model.addAttribute("startdate", DateUtil.addFormat(startdate));
      model.addAttribute("itemCountPerPage", itemCountPerPage);
    } catch (Exception e) {
      e.printStackTrace();
    }

    logger.info("?????????????????? mng_biz_plan end");
    return new ModelAndView("mng/" + pageView);
  }
  
// shortage
 @RequestMapping(value = "/mng_shortage")
 public ModelAndView mng_shortage(HttpServletRequest request, Locale locale, Model model,
     @RequestParam Map<String, String> param) {
   logger.info("??????????????????mng_shortage start");

   String pageView = F.nullCheck(request.getParameter("pageView"), "mng_shortage");
   String division = F.nullCheck(request.getParameter("division"), "001");
   String startdate = DateUtil.getConvertDate(F.nullCheck(request.getParameter("startdate"), ""));
   int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));
   int itemCountPerPage =
       Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "300"));

   HttpSession session = request.getSession();

   String session_cu_code = (String) session.getAttribute("cu_code");

   if (session_cu_code == null) {
     RedirectView redirectView = new RedirectView("mng_login?menu=0");
     // redirectView.set
     redirectView.setExposeModelAttributes(false);
     logger.info("??????????????????  mng_login_user end");
     return new ModelAndView(redirectView);

   }
   param.put("session_cu_code", session_cu_code);

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
  

   String temp_dayWeek = "";
   String[] arrayDay = new String[10];
   if (!"".equals(startdate)) {
     startdate = startdate.replaceAll("-", "");
   } else {
     startdate = DateUtil.getCurrentDate();
   }
   try {
     for (int i = 0; i < 10; i++) {

       String temp_date = DateUtil.addDays(startdate, i);
       //int dayWeek = DateUtil.getDayOfWeek(temp_date);
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
       }

       arrayDay[i] = temp_date.replaceAll("-", "");
       System.out.println("?????? ?????? ??????"+arrayDay[i]);
       // 0~6 : ???~???
     }
     String temp_date = DateUtil.addDays(startdate, -1);
     //int dayWeek = DateUtil.getDayOfWeek(temp_date);
     temp_date = DateUtil.addFormat(temp_date);
     temp_date = temp_date.replace("-","");
System.out.println("????????????220919"+str_day1);
System.out.println("????????????221103"+temp_date);
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
     model.addAttribute("str_day10", str_day10);
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
     List board2 = null;
     // List colist = null;

     WooboTechDao dao = new WooboTechDao();

     if (!"mng_shortage".equals(pageView)) {
       //itemCount = dao.mng_biz_plan_count(arrayDay, param);
       board = dao.mng_shortage1(arrayDay, param, page, itemCountPerPage, temp_date,division);
     }

     int maxPage = ListController.getMaxPage(itemCount, itemCountPerPage);
     List paging = ListController.getPaging(page, maxPage, pageCountPerPaging);

     // colist = dao.mng_co_list(param);

     model.addAttribute("board", board);
     //model.addAttribute("board2", board2);
     // model.addAttribute("colist",colist);
     model.addAttribute("division", division);
     model.addAttribute("itemCount", itemCount);
     model.addAttribute("currentPage", page);
     model.addAttribute("maxPage", maxPage);
     model.addAttribute("paging", paging);
     model.addAttribute("startdate", DateUtil.addFormat(startdate));
     model.addAttribute("itemCountPerPage", itemCountPerPage);
   } catch (Exception e) {
     e.printStackTrace();
   }

   logger.info("?????????????????? mng_shortage end");
   return new ModelAndView("mng/" + pageView);
 }

  // ???????????? ?????? ??????
  @RequestMapping(value = "/mng_delivery_view")
  public ModelAndView mng_delivery_view(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("??????????????????mng_delivery_view start");
    String dstate = param.get("dstate");
    String deliveryno = param.get("deliveryno");
    String plant = param.get("plant");
    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");
    param.put("cust_code", session_cu_code);
    if (session_cu_code == null) {
      RedirectView redirectView = new RedirectView("mng_login?menu=0");
      // redirectView.set
      redirectView.setExposeModelAttributes(false);
      logger.info("??????????????????  mng_login_user end");
      return new ModelAndView(redirectView);

    }

    WooboTechDao dao = new WooboTechDao();
    MangerDTO board = dao.mng_manger_view(param);
    model.addAttribute("board", board);
    model.addAttribute("dstate", dstate);
    model.addAttribute("deliveryno", deliveryno);
    model.addAttribute("plant", plant);

    logger.info("?????????????????? mng_delivery_view end");
    return new ModelAndView("mng/mng_delivery_view");
  }

  // ????????????????????? - ????????? - ???????????? 
  @RequestMapping(value = "/mng_delivery_view2")
  public ModelAndView mng_delivery_view2(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("??????????????????mng_delivery_view2 start");
    String dstate = param.get("dstate");
    String deliveryno = param.get("deliveryno");
    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");
    param.put("cust_code", session_cu_code);
    if (session_cu_code == null) {
      RedirectView redirectView = new RedirectView("mng_login?menu=0");
      // redirectView.set
      redirectView.setExposeModelAttributes(false);
      logger.info("??????????????????  mng_login_user end");
      return new ModelAndView(redirectView);

    }

    // WooboTechDao dao = new WooboTechDao();
    // MangerDTO board = dao.mng_manger_view(param);
    // model.addAttribute("board", board );
    model.addAttribute("dstate", dstate);
    model.addAttribute("deliveryno", deliveryno);

    logger.info("?????????????????? mng_delivery_view2 end");
    return new ModelAndView("mng/mng_delivery_view2");
  }


  // ???????????? ??????        //???????????????????????????220726???????????????
  @RequestMapping(value = "/mng_delivery_i")
  public String mng_delivery_i(Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("??????????????????mng_delivery_i start");

    String indate = param.get("indate"); // ????????????
    String custcodes = param.get("custcode"); // ???????????????
    String custnames = param.get("custname"); // ????????????
    String itemcode1 = param.get("itemcode1");// ??????
    String itemnames = param.get("itemname");// ??????
    String i_qtys = param.get("i_qty"); // ??????
    String dstate = param.get("dstate"); // ????????????
    String branch = param.get("branch");

    String delivery_date = param.get("delivery_date"); // ?????? ????????????
    String delivery_hour = param.get("delivery_hour"); // ?????? ??????(??????)
    String delivery_min = param.get("delivery_min"); // ?????? ??????(???)
    // String dtime = delivery_date +" " +delivery_hour +":"+ delivery_min;
    String dtime = "";
    String du_hour = param.get("du_hour"); // ?????? ??????(??????)
    String du_min = param.get("du_min"); // ?????? ??????(???)
    // String dtime2 = delivery_date +" " + du_hour +":"+ du_min;
    String dtime2 = "";
    // String dtime = param.get("dtime"); //??????????????????
    String[] arr_custcodes = custcodes.split(",");
    String[] arr_custnames = custnames.split(",");
    String[] arr_itemnames = itemnames.split(",");
    String[] arr_itemcode1 = itemcode1.split(",");
    String[] arr_i_qty = i_qtys.split(",");

    ArrayList<DeliveryDTO> arrlist = new ArrayList<DeliveryDTO>();
    for (int i = 0; i < arr_custcodes.length; i++) {
      DeliveryDTO info = new DeliveryDTO();
      info.setIndate(indate);
      info.setCno(arr_custcodes[i]);
      info.setCname(arr_custnames[i]);
      info.setPno(arr_itemcode1[i]);
      info.setPname(arr_itemnames[i]);
      info.setQty(arr_i_qty[i]);
      info.setDstate(dstate);
      info.setDtime(dtime);
      info.setDtime2(dtime2);
      arrlist.add(info);
    }

    WooboTechDao dao = new WooboTechDao();

    dao.insertDeliveryData(param, arrlist);

    logger.info("?????????????????? mng_delivery_i end");
    return "ajaxResult";
  }

  // ?????????????????? ???????????????
  @RequestMapping(value = "/mng_trns_data")
  public String mng_trns_data(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("??????????????????mng_trns_data start");

    String custcodes = param.get("custcode");
    System.out.println("??????????????? ?????? ???????????? ??? ????????? cno==> " + custcodes);
    String custnames = param.get("custname");
    System.out.println("??????????????? ?????? ???????????? ??? ????????? custnames==> " + custnames);
    String itemcode1 = param.get("itemcode1");
    System.out.println("??????????????? ?????? ???????????? ??? ????????? itemcode1==> " + itemcode1);
    String itemnames = param.get("itemname");
    System.out.println("??????????????? ?????? ???????????? ??? ????????? itemnames==> " + itemnames);
    String car_types = param.get("car_type");
    System.out.println("??????????????? ?????? ???????????? ??? ????????? car_types==> " + car_types);
    String i_qtys = param.get("i_qty");
    System.out.println("??????????????? ?????? ???????????? ??? ????????? i_qtys==> " + i_qtys);
    String lotnos = param.get("lotno");
    System.out.println("??????????????? ?????? ???????????? ??? ????????? lotnos==> " + lotnos);
    String unit = param.get("unit");
    System.out.println("??????????????? ?????? ???????????? ??? ????????? unit==> " + unit);
    String label_idxs = param.get("label_idx");
    System.out.println("idx??? ==>" + label_idxs);
    String check_date = param.get("check_date"); // ????????????
    System.out.println("??????????????? ?????? ???????????? ??? ????????? check_date==> " + check_date);
    String prdate = param.get("prdate");
    String prdate2 = prdate.substring(0, 4)+"-"+prdate.substring(4, 6)+"-"+prdate.substring(6,8);
    prdate = prdate2;
    String branch = "000";//param.get("branch");
    System.out.println("???????????? ?????? ==>" + branch);
    String tqty2 = param.get("tqty2");
    System.out.println("?????? ?????? ==> " + tqty2);

    String[] arr_custcodes = custcodes.split(",");
    String[] arr_custnames = custnames.split(",");
    String[] arr_custname = custnames.split(",");
    String[] arr_itemnames = itemnames.split(",");
    String[] arr_itemcode1 = itemcode1.split(",");
    String[] arr_car_type = car_types.split(",");
    String[] arr_i_qty = i_qtys.split(",");
    String[] arr_lotno = lotnos.split(",");
    String[] arr_unit = unit.split(",");
    String[] label_idx = label_idxs.split(",");
    String[] arr_tqty2 = tqty2.split(",");

    ArrayList<TrnsDTO> arrlist = new ArrayList<TrnsDTO>();
    for (int i = 0; i < arr_custname.length; i++) {
      TrnsDTO info = new TrnsDTO();
      info.setCustname(arr_custnames[i]);
      info.setCustcode(arr_custcodes[i]);
      info.setItemcode1(arr_itemcode1[i]);
      String itemname = arr_itemnames[i].replace("|", ",");
      /*
       * if(itemname.length()>30) { itemname = itemname.substring(0,30) +"<br>"
       * +itemname.substring(30,itemname.length()); }
       */
      info.setItemname(itemname);
      info.setCar_type(arr_car_type[i]);
      info.setUnit(arr_unit[i]);
      info.setI_qty(arr_i_qty[i]);


      if (i < arr_lotno.length) {
        info.setMadate(arr_lotno[i]); // lotno -> ??????????????? ?????????
        // info.setLotno(arr_lotno[i]);
      }
      info.setLabel_idx(label_idx[i]);
      info.setTqty2(arr_tqty2[i]);

      System.out.println(arr_tqty2[i]);

      arrlist.add(info);
    }

    String outdate = DateUtil.addFormat(DateUtil.getCurrentDate());
    param.put("prdate", prdate);
    // param.put("car_types", car_types);
    param.put("branch", branch);
    WooboTechDao dao = new WooboTechDao();

    String result_barcode = dao.insertTransData(param, arrlist);
    // System.out.println(result_barcode+"=?????????");
    // String result_barcode2 = dao.insertTransDataMS(param,arrlist);
    // System.out.println(result_barcode2+"=MS???");

    try {
      Code128Bean barcode128Bean = new Code128Bean();
      barcode128Bean.setCodeset(Code128Constants.CODESET_B);

      final int dpi = 250;

      // Configure the barcode generator
      // adjust barcode width here
      barcode128Bean.setModuleWidth(UnitConv.in2mm(5.0f / dpi));
      // barcode128Bean.setModuleWidth(20);
      barcode128Bean.doQuietZone(false);

      // Open output file
      File outputFile = new File(uploadPath + "//barcode//" + result_barcode + ".png");
      OutputStream out = new FileOutputStream(outputFile);
      BitmapCanvasProvider canvasProvider = new BitmapCanvasProvider(out, "image/x-png", dpi,
          BufferedImage.TYPE_BYTE_BINARY, false, 0);

      barcode128Bean.generateBarcode(canvasProvider, result_barcode);

      canvasProvider.finish();
      out.close();
    } catch (Exception e) {
      e.printStackTrace();
    } finally {

    }

    ArrayList<DeliveryDTO> arrlist2 = new ArrayList<DeliveryDTO>();
    for (int i = 0; i < arr_custcodes.length; i++) {
      DeliveryDTO info = new DeliveryDTO();
      info.setIndate(check_date);
      info.setCno(arr_custcodes[i]);
      info.setCname(arr_custnames[i]);
      info.setPno(arr_itemcode1[i]);
      info.setPname(arr_itemnames[i]);
      info.setQty(arr_i_qty[i]);
      info.setDstate("Preparing for shipment");
      info.setDtime("");
      info.setDtime2("");
      info.setTradebarcode(result_barcode);
      info.setTqty2(arr_tqty2[i]);
      arrlist2.add(info);
    }

    dao.insertDeliveryData(param, arrlist2); // ???????????? ??????

    // 211105 ?????????????????? ??????????????? ?????? ????????? ????????? ????????? ??????
    ArrayList<DeliveryDTO> arrlist3 = new ArrayList<DeliveryDTO>();
    DeliveryDTO info2 = new DeliveryDTO();
    info2.setIndate(check_date);
    info2.setCno(arr_custcodes[0]);
    info2.setCname(arr_custnames[0]);
    info2.setPno(arr_itemcode1[0]);
    info2.setPname(arr_itemnames[0]);
    info2.setQty(arr_i_qty[0]);
    info2.setDstate("Preparing for shipment");
    info2.setDtime("");
    info2.setDtime2("");
    info2.setTradebarcode(result_barcode);
    info2.setTqty2(tqty2);
    arrlist3.add(info2);

    HttpSession session = request.getSession();

    String cu_sano = (String) session.getAttribute("cu_sano");
    String cu_sangho = (String) session.getAttribute("cu_sangho");
    String cu_master = (String) session.getAttribute("cu_master");
    String cu_juso = (String) session.getAttribute("cu_juso");
    System.out.println("????????????"+cu_sangho);
    // model.addAttribute("cu_sano",
    // cu_sano.substring(0,3)+"-"+cu_sano.substring(3,6)+"-"+cu_sano.substring(5,cu_sano.length()));//????????????
    // model.addAttribute("cu_sangho", cu_sangho);//????????????
    //
    // model.addAttribute("cu_master", cu_master );
    // model.addAttribute("cu_juso", cu_juso );
    //
    // //model.addAttribute("outdate", DateUtil.addFormat(DateUtil.getCurrentDate()));//????????????
    // model.addAttribute("outdate",
    // DateUtil.addFormat(DateUtil.getCurrentDate()).substring(0,4)+"???"
    // +DateUtil.addFormat(DateUtil.getCurrentDate()).substring(5,7)+"???"
    // +DateUtil.addFormat(DateUtil.getCurrentDate()).substring(8,10)+"???");//????????????
    // model.addAttribute("indate", check_date );//????????????
    // model.addAttribute("barcode", result_barcode );
    // model.addAttribute("board", arrlist );
    // model.addAttribute("pageview", "mng_trns_data" );
    // model.addAttribute("memo", "" );
    //
    param.put("barcode", result_barcode);
    double sumqty = 0;
    List<TrnsDTO> arrList = dao.mng_re_trns_data(param);
    for (int i = 0; i < arrList.size(); i++) {
      String temp_itemcode = arrList.get(i).getItemcode1();
      sumqty = sumqty + Double.parseDouble(arrList.get(i).getI_qty());
      System.out.println(temp_itemcode);
      for (int j = 0; j < arrlist.size(); j++) {
        if (temp_itemcode.equals(arrlist.get(j).getItemcode1())) {
          arrList.get(j).setLabel_idx(arrlist.get(j).getLabel_idx());
        }
      }
    }
    
    TrnsDTO info = arrList.get(0);
    String sangho = info.getCustname();
    sangho = sangho.replace("<br>", "");
    System.out.println("????????????"+info.getCustname());
    System.out.println("22092??????????????? ??????"+info.getCu_sano());
    // model.addAttribute("cu_sano",
    // cu_sano.substring(0,3)+"-"+cu_sano.substring(3,6)+"-"+cu_sano.substring(5,cu_sano.length()));
    if(info.getCu_sano().length()>7) {
    model.addAttribute("cu_sano",
        info.getCu_sano().substring(0, 3) + "-" + info.getCu_sano().substring(3, 5) + "-"
            + info.getCu_sano().substring(5, info.getCu_sano().length()));
    }
    model.addAttribute("cu_code", info.getCuCode());
    model.addAttribute("cu_sangho", sangho);
    model.addAttribute("cu_master", info.getCu_master());
    model.addAttribute("cu_juso", info.getCu_juso());
    model.addAttribute("bak_juso", info.getBak_juso());// 211101 ?????????
    // System.out.println("bak_juso==>"+info.getbak_juso());
    // model.addAttribute("outdate", info.getPrdate().substring(0,4)+"???"
    // +info.getPrdate().substring(5,7)+"???" +info.getPrdate().substring(8,10)+"???");//????????????
    model.addAttribute("indate", check_date);// ????????????
    model.addAttribute("cu_uptae", info.getUptae());// ??????
    model.addAttribute("cu_upjong", info.getUpjong());// ??????
    model.addAttribute("deliveryno", info.getDeliveryno()); // 211102 ???????????? ??????
    // model.addAttribute("indate", info.get//????????????
    model.addAttribute("barcode", info.getBarcode());
    model.addAttribute("board", arrList);
    model.addAttribute("text", arrlist3);// 211102 ????????????
    model.addAttribute("memo", "");
    model.addAttribute("memo2", info.getMemo2());
    model.addAttribute("pageview", "mng_trns_data");
    model.addAttribute("prdate", info.getPrdate());
    model.addAttribute("sumqty", sumqty);

    logger.info("?????????????????? mng_trns_data end");
    return "mng/mng_trns_dt";
  }

  // ?????????????????? - ??????????????? - ???????????? - ??????
  @RequestMapping(value = "/mng_label_print")
  public String mng_label_print(Locale locale, Model model, @RequestParam Map<String, String> param)
      throws SQLException {
    logger.info("??????????????????mng_label_print start");

    String itemname = param.get("itemname");
    String itemcode1 = param.get("itemcode1");
    String custname = param.get("custname");
    String custcode = param.get("custcode");
    String car_type = param.get("car_type");
    
    double qty = Double.parseDouble(param.get("qty"));
    double box_qty = Double.parseDouble(param.get("box_qty"));
    double box_qty2 = Double.parseDouble(param.get("box_qty2")); //20220614
    double box_qty3 = Double.parseDouble(param.get("box_qty3"));
    String lotno = param.get("lotno");
    String indate = param.get("indate");
    String madate = DateUtil.getConvertDate2(param.get("madate"));
    String madate2 = DateUtil.getConvertDate2(F.nullCheck(param.get("madate2"), ""));
    String madate3 = DateUtil.getConvertDate2(F.nullCheck(param.get("madate3"), ""));
    System.out.println("220919@@@@@@@@@@@@@@@@@@@"+madate);
    String memo = param.get("memo");
    String branch = param.get("branch");
    String production = param.get("production");
    String production2 = param.get("production2");
    String production3 = param.get("production3");
    String batchMode = param.get("batchMode"); //nomal, batch
    String batchDate = DateUtil.getConvertDate2(param.get("batch_date"));
    String batchContent = param.get("batch_content");
    String color = F.nullCheck(param.get("color"),"");
    System.out.println(branch);
    System.out.println("[mng_label_print] batchMode["+batchMode+"] batchDate["+batchDate+"] batchContent["+batchContent+"]");
    String[] batchContentArr = null;
    Map<String, Object> splitMap = null;
    List<Map<String, Object>> splitMapList = new ArrayList<Map<String, Object>>();
    if(batchContent != null && !"".equals(batchContent) && "batch".equals(batchMode)) {
      batchContentArr = batchContent.split("<br>");
      for (int i = 0; i < batchContentArr.length; i++) {
        String[] splitArr = batchContentArr[i].split("/");
        splitMap = new HashMap<String, Object>();
        
        if(!splitArr[0].equals("") || !splitArr[0].isEmpty()) {     //????????????
          splitMap.put("qty", splitArr[0]);     //?????????????????? ??????
           if(splitArr.length>1) {
              if(splitArr[1].equals("") || splitArr[1].isEmpty()) {
                splitMap.put("date", DateUtil.getConvertDate3(batchDate));
              }else {
                splitMap.put("date", splitArr[1]);
              }
           }else {
             splitMap.put("date", DateUtil.getConvertDate3(batchDate));
           }
          splitMapList.add(splitMap);
          
        }
        
        
      }
    }
    // ???????????? /????????????
    System.out.println("???????????????"+splitMapList);
    WooboTechDao dao = new WooboTechDao();
    
    dao.mng_label_del(param); 
   
    int is_exist = dao.mng_qty_exist(param);
   
    System.out.println(is_exist);

    if (is_exist == 0) {
      dao.mng_insert_qty(param);
    } else { 
      dao.mng_update_qty(param);
    }

    ArrayList<LabelDTO> arrList_Label = null;
    
    if("batch".equals(batchMode)) {
      arrList_Label = wooboService.get_Label_list(param, splitMapList);      
    }else {
      arrList_Label = dao.get_Label_list(param);
    }
    
    for (int i = 0; i < arrList_Label.size(); i++) {
      String barcodeString = arrList_Label.get(i).getBarcode();
      try {
        Code128Bean barcode128Bean = new Code128Bean();
        barcode128Bean.setCodeset(Code128Constants.CODESET_B);

        final int dpi = 200;

        // Configure the barcode generator
        // adjust barcode width here
        barcode128Bean.setModuleWidth(UnitConv.in2mm(5.0f / dpi));
        // barcode128Bean.setModuleWidth(20);
        barcode128Bean.doQuietZone(false);

        // Open output file
        File outputFile = new File(uploadPath + "//barcode//" + barcodeString + ".png");
        OutputStream out = new FileOutputStream(outputFile);
        BitmapCanvasProvider canvasProvider = new BitmapCanvasProvider(out, "image/x-png", dpi,
            BufferedImage.TYPE_BYTE_BINARY, false, 0);

        barcode128Bean.generateBarcode(canvasProvider, barcodeString);

        canvasProvider.finish();
        out.close();
      } catch (Exception e) {
        e.printStackTrace();
      } finally {

      }

    }
    madate = madate.replaceAll("-", "");
    String year = madate.substring(0, 4);
    String month = madate.substring(4, 6);
    String day = madate.substring(6, 8);
    madate = day +"-"+ month +"-"+ year;
    System.out.println("madate ??????"+madate);
    model.addAttribute("board", arrList_Label);
    model.addAttribute("itemname", itemname);
    model.addAttribute("itemcode1", itemcode1);
    model.addAttribute("custname", custname);
    model.addAttribute("custcode", custcode);
    model.addAttribute("car_type", car_type);
    model.addAttribute("qty", qty);
    model.addAttribute("box_qty", box_qty);
    model.addAttribute("lotno", lotno);
    model.addAttribute("indate", indate);
    model.addAttribute("madate", madate);
    model.addAttribute("memo", memo);
    model.addAttribute("color", color);
    logger.info("?????????????????? mng_label_print end");
    return "mng/mng_label_print";
  }

  // ???????????????
  @RequestMapping(value = "/mng_label_reprint")
  public String mng_label_reprint(Locale locale, Model model,
      @RequestParam Map<String, String> param) throws SQLException {
    logger.info("??????????????????mng_label_reprint start");
    // String itemname = param.get("itemname");
    // String itemcode1 = param.get("itemcode1");
    // String custname = param.get("custname");
    // String custcode = param.get("custcode");
    // String car_type = param.get("car_type");
    // int qty = Integer.parseInt(param.get("qty"));
    // int box_qty = Integer.parseInt(param.get("box_qty"));
    // String lotno = param.get("lotno");
     String indate = param.get("indate");
     String color = F.nullCheck(param.get("color"),"");
    // String madate = param.get("madate");
    // String memo= param.get("memo");

    // ???????????? /????????????
     
    String trbarcode = param.get("trbarcode");
    String pno = param.get("pno");
    WooboTechDao wdao = new WooboTechDao();

    System.out.println(trbarcode);
    System.out.println(pno);

    ArrayList<LabelDTO> arrList_Label = wdao.get_Label_relist(param);

    /*
     * dao.mng_label_del(param);
     * 
     * ArrayList<LabelDTO> arrList_Label = dao.get_Label_list(param); for(int i=0;
     * i<arrList_Label.size(); i++) { String barcodeString = arrList_Label.get(i).getBarcode(); try
     * { Code128Bean barcode128Bean = new Code128Bean();
     * barcode128Bean.setCodeset(Code128Constants.CODESET_B);
     * 
     * final int dpi = 200;
     * 
     * // Configure the barcode generator // adjust barcode width here
     * barcode128Bean.setModuleWidth(UnitConv.in2mm(5.0f / dpi));
     * //barcode128Bean.setModuleWidth(20); barcode128Bean.doQuietZone(false);
     * 
     * // Open output file File outputFile = new
     * File(uploadPath+"//barcode//"+barcodeString+".png"); OutputStream out = new
     * FileOutputStream(outputFile); BitmapCanvasProvider canvasProvider = new
     * BitmapCanvasProvider(out, "image/x-png", dpi, BufferedImage.TYPE_BYTE_BINARY, false, 0);
     * 
     * barcode128Bean.generateBarcode(canvasProvider, barcodeString);
     * 
     * canvasProvider.finish(); out.close(); } catch (Exception e) { e.printStackTrace(); } finally
     * {
     * 
     * }
     * 
     * }
     */

    // model.addAttribute("board", arrList_Label );
    // model.addAttribute("itemname", itemname );
    // model.addAttribute("itemcode1", itemcode1 );
    // model.addAttribute("custname", custname );
    // model.addAttribute("custcode", custcode );
    // model.addAttribute("car_type", car_type );
    // model.addAttribute("qty", qty );
    // model.addAttribute("box_qty", box_qty );
    // model.addAttribute("lotno", lotno );
     model.addAttribute("indate", indate );
     model.addAttribute("color", color );
    // model.addAttribute("madate", madate );
    // model.addAttribute("memo", memo);
    model.addAttribute("board", arrList_Label);
    System.out.println(arrList_Label);
    System.out.println(indate);
    logger.info("?????????????????? mng_label_reprint end");
    return "mng/mng_label_reprint";
  }

  // ?????????????????? - ??????????????? - ????????????
  @RequestMapping(value = "/mng_label_add")
  public String mng_label_add(Locale locale, Model model, @RequestParam Map<String, String> param)
      throws SQLException {
    logger.info("??????????????????mng_label_add start");
    String custname = param.get("custname");
    String itemcode1 = param.get("itemcode1");
    String itemname = param.get("itemname");
    String indate =  param.get("indate");
    indate = indate.replaceAll("-", "");
    String year = indate.substring(0, 4);
    String month = indate.substring(4, 6);
    String day = indate.substring(6, 8);
    indate = day +"-"+ month+"-" + year;
    String qty = param.get("qty");
    String i_qty = param.get("i_qty");
    String custcode = param.get("custcode");
    String car_type = param.get("car_type");
    String lotno = param.get("lotno");
    String prdate = param.get("prdate");
    String branch = param.get("branch");
    String color = F.nullCheck(param.get("color"),"");
    System.out.println(itemname);

    WooboTechDao wdao = new WooboTechDao();

    int is_exist = wdao.mng_qty_exist(param);

    System.out.println(is_exist);

    String box_qty = "";
    String box_qty2 = "0";
    String box_qty3 = "0";
    if (is_exist != 0) {
      // wdao.mng_update_qty(param);
      box_qty = wdao.mng_box_qty(param);
    } else {
      // wdao.mng_insert_qty(param);
      box_qty = "";
    }
    
    String madate2 = "";
    String madate3 = "";
    String production =i_qty;
    String production2 = "0";
    String production3 = "0";
    System.out.println(production+"123465789");
    
    model.addAttribute("custname", custname);
    model.addAttribute("itemcode1", itemcode1);
    model.addAttribute("itemname", itemname);
    model.addAttribute("indate", indate);
    model.addAttribute("qty", qty);
    model.addAttribute("custcode", custcode);
    model.addAttribute("car_type", car_type);
    model.addAttribute("i_qty", i_qty);
    model.addAttribute("box_qty", box_qty);
    model.addAttribute("box_qty2", box_qty2);
    model.addAttribute("box_qty3", box_qty3);
    // model.addAttribute("lotno", lotno );
    model.addAttribute("madate", lotno);        // 2022-06-09 ???????????? ????????????
    model.addAttribute("madate2", madate2);
    model.addAttribute("madate3", madate3);
    model.addAttribute("production", production);
    model.addAttribute("production2", production2);
    model.addAttribute("production3", production3);
    model.addAttribute("prdate", prdate);
    model.addAttribute("color", color);

    logger.info("?????????????????? mng_label_add end");
    return "mng/mng_label_add";
  }

  // ?????????????????? - ???????????????     //???????????????????????????220726???????????????

  @RequestMapping(value = "/mng_trns_dt")
  public String mng_trns_dt(Locale locale, Model model) {
    logger.info("??????????????????mng_trns_dt start");

    logger.info("?????????????????? mng_trns_dt end");
    return "mng/mng_trns_dt";
  }

  // ??????????????????
  @RequestMapping(value = "/mng_buy_plan")
  public ModelAndView mng_buy_plan(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("??????????????????mng_buy_plan start");
    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_buy_plan");
    String startdate = DateUtil.getConvertDate(F.nullCheck(request.getParameter("startdate"), ""));
    int addDate = Integer.parseInt(F.nullCheck(request.getParameter("addDate"), "15"));
    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));
    int itemCountPerPage =
        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "300"));
    String incomeChk = F.nullCheck(request.getParameter("income"), "");
    String item2 =  F.nullCheck(request.getParameter("item2"), "");
    String custname = F.nullCheck(request.getParameter("custname"),"");
    System.out.println("incomeChk : " + incomeChk);
    HttpSession session = request.getSession();

    String text = (String) session.getAttribute("cu_sangho");
    System.out.println("???????????? ???????????? ??? ->" + text+custname);
    String session_cu_code = (String) session.getAttribute("cu_code");
    
    if (session_cu_code == null) {
      RedirectView redirectView = new RedirectView("mng_login?menu=0");
      // redirectView.set
      redirectView.setExposeModelAttributes(false);
      logger.info("??????????????????  mng_login_user end");
      return new ModelAndView(redirectView);

    }
    param.put("session_cu_code", session_cu_code);
    
    String temp_dayWeek = "";
    String[] arrayDay = new String[addDate];
 
    if (!"".equals(startdate)) {
      startdate = startdate.replaceAll("-", "");
    } else {
      startdate = DateUtil.getCurrentDate();
    }

    try {
      
      String strTempDate = DateUtil.addDays(startdate,-1);  //???????????? ??????
      int idate = 0;                                        //?????????????????? ????????? ?????? ??????
      
      for (int i = 0; i < addDate; i++) {   
        String temp_date = DateUtil.addDays(startdate, i+idate);
         
        if(temp_date.toString().equals(strTempDate.toString())) {   //????????? ???????????? ??????????????? ?????????
          idate = idate+1;      //????????? ?????? 1??? ??????
          temp_date = DateUtil.addDays(startdate, i+idate);     // temp_date + 1??? ????????? ????????? ??????
        }
        strTempDate = temp_date.replaceAll("-", "").toString();     //?????? ?????? ??????
        arrayDay[i] = temp_date.replaceAll("-", "");                //????????? ??????
        
        System.out.println("???????????? : temp_date ->" + temp_date +" ???????????? : strTempDate ->" + strTempDate );
        System.out.println("???????????? : arrayDay["+i+"] ->" + arrayDay[i] );
      }

      
//      for (int i = 0; i < addDate; i++) {   
//        String temp_date = DateUtil.addDays(startdate, i);       
//        arrayDay[i] = temp_date.replaceAll("-", "");     
//        System.out.println("arrayDay["+i+"] ->" + arrayDay[i] );
//      }

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
      int income = 0;
      // List colist = null;
      List item = null;
      WooboTechDao dao = new WooboTechDao();
     
      /*
       * if(!"mng_buy_plan".equals(pageView)) { itemCount = dao.mng_buy_plan_count(arrayDay,param);
       * board = dao.mng_buy_plan(arrayDay,arrayDay2,param,page,itemCountPerPage); income =
       * dao.mng_buy_income(param); //colist = dao.mng_co_list(param); }
       */
     // item = dao.itemList();          ?????????????????? ???????????? 220726??????
      if (incomeChk.equals("0")) {

        if (!"mng_buy_plan".equals(pageView)) {
          //2022-06-13
          itemCount = dao.mng_buy_plan_count(arrayDay, param);
          board = dao.mng_buy_plan(arrayDay, param, page, itemCountPerPage);
          income = dao.mng_buy_income(param);//???????????????????????????220726???????????????  ?????? ?????? ????????? ??? ????????????
          //item = dao.itemList();
          // colist = dao.mng_co_list(param);
        }

      } else {
        if (!"mng_buy_plan".equals(pageView)) {
          System.out.println("????????????@@@@@@@@@@@@@@@@@");
          itemCount = dao.mng_buy_plan_incomecount(arrayDay, param);
          board = dao.mng_buy_incomeplan(arrayDay, param, page, itemCountPerPage);
          income = dao.mng_buy_income(param);//???????????????????????????220726??????????????? 
          
         // item = dao.itemList();
          
          // colist = dao.mng_co_list(param);
        }
      }

      // colist = dao.mng_co_list(param);
      int maxPage = ListController.getMaxPage(itemCount, itemCountPerPage);
      List paging = ListController.getPaging(page, maxPage, pageCountPerPaging);
      model.addAttribute("board", board);
      model.addAttribute("income", income);     //???????????????????????????220726??????????????? 
      model.addAttribute("item", item);
      // model.addAttribute("colist", colist);
      model.addAttribute("itemCount", itemCount);
      model.addAttribute("currentPage", page);
      model.addAttribute("maxPage", maxPage);
      model.addAttribute("paging", paging);
      model.addAttribute("startdate", DateUtil.addFormat(startdate));
      model.addAttribute("itemCountPerPage", itemCountPerPage);
      model.addAttribute("addDate", addDate);
      model.addAttribute("arrayDay", arrayDay);
      model.addAttribute("arrayCnt", arrayDay.length);
      
    } catch (Exception e) {
      e.printStackTrace();
    }
System.out.println("????????? ??? ?????? "+pageView);
    // DateUtil.getDayOfWeek("");
    logger.info("?????????????????? mng_buy_plan end");
    return new ModelAndView("mng/" + pageView);
  }

  // ??????????????? ???????????? 2022-04-25 ?????????
  // ??????????????????
  @RequestMapping(value = "/mng_buy_incomeplan")
  public ModelAndView mng_buy_incomeplan(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("??????????????????mng_buy_incomeplan start");
    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_buy_plan");
    String startdate = DateUtil.getConvertDate(F.nullCheck(request.getParameter("startdate"), ""));
    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));
    int itemCountPerPage =
        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "30"));
    String incomeChk = F.nullCheck(request.getParameter("income"), "");

    System.out.println("incomeChk : " + incomeChk);

    HttpSession session = request.getSession();

    String text = (String) session.getAttribute("cu_sangho");
    System.out.print("???????????? ???????????? ??? ->" + text);
    String session_cu_code = (String) session.getAttribute("cu_code");

    if (session_cu_code == null) {
      RedirectView redirectView = new RedirectView("mng_login?menu=0");
      // redirectView.set
      redirectView.setExposeModelAttributes(false);
      logger.info("??????????????????  mng_login_user end");
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
    String[] arrayDay2 = new String[14];
    // String[] arrayDay = new String[7];

    if (!"".equals(startdate)) {
      startdate = startdate.replaceAll("-", "");
    } else {
      startdate = DateUtil.getCurrentDate();
    }

    try {
      for (int i = 0; i < 14; i++) {
        // for(int i=0; i<7; i++) {
        String temp_date = DateUtil.addDays(startdate, i);
        // System.out.println("temp_Date==>"+temp_date);
        int dayWeek = DateUtil.getDayOfWeek(temp_date);
        temp_date = DateUtil.addFormat(temp_date);

        if (dayWeek == 0) {
          temp_dayWeek = "???";
        } else if (dayWeek == 1) {
          temp_dayWeek = "???";
        } else if (dayWeek == 2) {
          temp_dayWeek = "???";
        } else if (dayWeek == 3) {
          temp_dayWeek = "???";
        } else if (dayWeek == 4) {
          temp_dayWeek = "???";
        } else if (dayWeek == 5) {
          temp_dayWeek = "???";
        } else if (dayWeek == 6) {
          temp_dayWeek = "???";
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
        // 0~6 : ???~???
      }

      for (int i = 0; i < 14; i++) {
        // for(int i=0; i<7; i++) {
        String temp_date = DateUtil.addDays(startdate, i);
        // System.out.println("temp_Date==>"+temp_date);
        int dayWeek = DateUtil.getDayOfWeek(temp_date);
        temp_date = DateUtil.addFormat(temp_date);

        if (dayWeek == 0) {
          temp_dayWeek = "???";
        } else if (dayWeek == 1) {
          temp_dayWeek = "???";
        } else if (dayWeek == 2) {
          temp_dayWeek = "???";
        } else if (dayWeek == 3) {
          temp_dayWeek = "???";
        } else if (dayWeek == 4) {
          temp_dayWeek = "???";
        } else if (dayWeek == 5) {
          temp_dayWeek = "???";
        } else if (dayWeek == 6) {
          temp_dayWeek = "???";
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

        arrayDay2[i] = temp_date;
        // System.out.println("i==>"+i);
        // 0~6 : ???~???
      }
//      System.out.println("????????????220919"+str_day1);
//      model.addAttribute("str_day1", str_day1);
//      model.addAttribute("str_day2", str_day2);
//      model.addAttribute("str_day3", str_day3);
//      model.addAttribute("str_day4", str_day4);
//      model.addAttribute("str_day5", str_day5);
//      model.addAttribute("str_day6", str_day6);
//      model.addAttribute("str_day7", str_day7);
//      model.addAttribute("str_day8", str_day8);
//      model.addAttribute("str_day9", str_day9);
//      model.addAttribute("str_day10", str_day10);
//      model.addAttribute("str_day11", str_day11);
//      model.addAttribute("str_day12", str_day12);
//      model.addAttribute("str_day13", str_day13);
//      model.addAttribute("str_day14", str_day14);
//
//      model.addAttribute("str_dayWeek1", str_dayWeek1);
//      model.addAttribute("str_dayWeek2", str_dayWeek2);
//      model.addAttribute("str_dayWeek3", str_dayWeek3);
//      model.addAttribute("str_dayWeek4", str_dayWeek4);
//      model.addAttribute("str_dayWeek5", str_dayWeek5);
//      model.addAttribute("str_dayWeek6", str_dayWeek6);
//      model.addAttribute("str_dayWeek7", str_dayWeek7);
//      model.addAttribute("str_dayWeek8", str_dayWeek8);
//      model.addAttribute("str_dayWeek9", str_dayWeek9);
//      model.addAttribute("str_dayWeek10", str_dayWeek10);
//      model.addAttribute("str_dayWeek11", str_dayWeek11);
//      model.addAttribute("str_dayWeek12", str_dayWeek12);
//      model.addAttribute("str_dayWeek13", str_dayWeek13);
//      model.addAttribute("str_dayWeek14", str_dayWeek14);
//
//      try {
//        page = Integer.parseInt(request.getParameter("page"));
//
//      } catch (Exception e) {
//        // TODO Auto-generated catch block
//        // e.printStackTrace();
//      }
//
//      int itemCount = 0;
//      // int itemCountPerPage = 30;
//      int pageCountPerPaging = 10;
//      List board = null;
//      int income = 0;
//      // List colist = null;
//      List item = null;
//      WooboTechDao dao = new WooboTechDao();
//     
//      /*
//       * if(!"mng_buy_plan".equals(pageView)) { itemCount = dao.mng_buy_plan_count(arrayDay,param);
//       * board = dao.mng_buy_plan(arrayDay,arrayDay2,param,page,itemCountPerPage); income =
//       * dao.mng_buy_income(param); //colist = dao.mng_co_list(param); }
//       */
//     // item = dao.itemList();          ?????????????????? ???????????? 220726??????
//      if (incomeChk.equals("0")) {
//
//        if (!"mng_buy_plan".equals(pageView)) {
//          //2022-06-13
//          itemCount = dao.mng_buy_plan_count(arrayDay, param);
//          board = dao.mng_buy_plan(arrayDay, arrayDay2, param, page, itemCountPerPage);
//          income = dao.mng_buy_income(param);//???????????????????????????220726???????????????  ?????? ?????? ????????? ??? ????????????
//          //item = dao.itemList();
//          // colist = dao.mng_co_list(param);
//        }
//
//      } else {
//        if (!"mng_buy_plan".equals(pageView)) {
//          System.out.println("????????????@@@@@@@@@@@@@@@@@");
//          itemCount = dao.mng_buy_plan_incomecount(arrayDay, param);
//          board = dao.mng_buy_incomeplan(arrayDay, arrayDay2, param, page, itemCountPerPage);
//          income = dao.mng_buy_income(param);//???????????????????????????220726??????????????? 
//          
//         // item = dao.itemList();
//          
//          // colist = dao.mng_co_list(param);
//        }
//      }
//
//      // colist = dao.mng_co_list(param);
//      int maxPage = ListController.getMaxPage(itemCount, itemCountPerPage);
//      List paging = ListController.getPaging(page, maxPage, pageCountPerPaging);
//      model.addAttribute("board", board);
//      model.addAttribute("income", income);     //???????????????????????????220726??????????????? 
//      model.addAttribute("item", item);
//      // model.addAttribute("colist", colist);
//      model.addAttribute("itemCount", itemCount);
//      model.addAttribute("currentPage", page);
//      model.addAttribute("maxPage", maxPage);
//      model.addAttribute("paging", paging);
//      model.addAttribute("startdate", DateUtil.addFormat(startdate));
//      model.addAttribute("itemCountPerPage", itemCountPerPage);
//
//    } catch (Exception e) {
//      e.printStackTrace();
//    }
//System.out.println("????????? ??? ?????? "+pageView);
//    // DateUtil.getDayOfWeek("");
//    logger.info("?????????????????? mng_buy_plan end");
//    return new ModelAndView("mng/" + pageView);
//  }
//
//  // ??????????????? ???????????? 2022-04-25 ?????????
//  // ??????????????????
//  @RequestMapping(value = "/mng_buy_incomeplan")
//  public ModelAndView mng_buy_incomeplan(HttpServletRequest request, Locale locale, Model model,
//      @RequestParam Map<String, String> param) {
//    logger.info("??????????????????mng_buy_incomeplan start");
//    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_buy_plan");
//    String startdate = DateUtil.getConvertDate(F.nullCheck(request.getParameter("startdate"), ""));
//    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));
//    int itemCountPerPage =
//        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "30"));
//    String incomeChk = F.nullCheck(request.getParameter("income"), "");
//
//    System.out.println("incomeChk : " + incomeChk);
//
//    HttpSession session = request.getSession();
//
//    String text = (String) session.getAttribute("cu_sangho");
//    System.out.print("???????????? ???????????? ??? ->" + text);
//    String session_cu_code = (String) session.getAttribute("cu_code");
//
//    if (session_cu_code == null) {
//      RedirectView redirectView = new RedirectView("mng_login?menu=0");
//      // redirectView.set
//      redirectView.setExposeModelAttributes(false);
//      logger.info("??????????????????  mng_login_user end");
//      return new ModelAndView(redirectView);
//
//    }
//    param.put("session_cu_code", session_cu_code);
//
//    String str_dayWeek1 = "";
//    String str_dayWeek2 = "";
//    String str_dayWeek3 = "";
//    String str_dayWeek4 = "";
//    String str_dayWeek5 = "";
//    String str_dayWeek6 = "";
//    String str_dayWeek7 = "";
//    String str_dayWeek8 = "";
//    String str_dayWeek9 = "";
//    String str_dayWeek10 = "";
//    String str_dayWeek11 = "";
//    String str_dayWeek12 = "";
//    String str_dayWeek13 = "";
//    String str_dayWeek14 = "";
//
//    String str_day1 = "";
//    String str_day2 = "";
//    String str_day3 = "";
//    String str_day4 = "";
//    String str_day5 = "";
//    String str_day6 = "";
//    String str_day7 = "";
//    String str_day8 = "";
//    String str_day9 = "";
//    String str_day10 = "";
//    String str_day11 = "";
//    String str_day12 = "";
//    String str_day13 = "";
//    String str_day14 = "";
//
//    String temp_dayWeek = "";
//    String[] arrayDay = new String[14];
//    String[] arrayDay2 = new String[14];
//    // String[] arrayDay = new String[7];
//    if (!"".equals(startdate)) {
//      startdate = startdate.replaceAll("-", "");
//    } else {
//      startdate = DateUtil.getCurrentDate();
//    }
//    System.out.println("mng_buy_plan_controller" + startdate);
//    try {
//      for (int i = 0; i < 14; i++) {
//        // for(int i=0; i<7; i++) {
//        String temp_date = DateUtil.addDays(startdate, i);
//        // System.out.println("temp_Date==>"+temp_date);
//        int dayWeek = DateUtil.getDayOfWeek(temp_date);
//        temp_date = DateUtil.addFormat(temp_date);
//
//        if (dayWeek == 0) {
//          temp_dayWeek = "???";
//        } else if (dayWeek == 1) {
//          temp_dayWeek = "???";
//        } else if (dayWeek == 2) {
//          temp_dayWeek = "???";
//        } else if (dayWeek == 3) {
//          temp_dayWeek = "???";
//        } else if (dayWeek == 4) {
//          temp_dayWeek = "???";
//        } else if (dayWeek == 5) {
//          temp_dayWeek = "???";
//        } else if (dayWeek == 6) {
//          temp_dayWeek = "???";
//        }
//
//        if (i == 0) {
//          str_day1 = temp_date;
//          str_dayWeek1 = temp_dayWeek;
//        } else if (i == 1) {
//          str_day2 = temp_date;
//          str_dayWeek2 = temp_dayWeek;
//        } else if (i == 2) {
//          str_day3 = temp_date;
//          str_dayWeek3 = temp_dayWeek;
//        } else if (i == 3) {
//          str_day4 = temp_date;
//          str_dayWeek4 = temp_dayWeek;
//        } else if (i == 4) {
//          str_day5 = temp_date;
//          str_dayWeek5 = temp_dayWeek;
//        } else if (i == 5) {
//          str_day6 = temp_date;
//          str_dayWeek6 = temp_dayWeek;
//        } else if (i == 6) {
//          str_day7 = temp_date;
//          str_dayWeek7 = temp_dayWeek;
//        } else if (i == 7) {
//          str_day8 = temp_date;
//          str_dayWeek8 = temp_dayWeek;
//        } else if (i == 8) {
//          str_day9 = temp_date;
//          str_dayWeek9 = temp_dayWeek;
//        } else if (i == 9) {
//          str_day10 = temp_date;
//          str_dayWeek10 = temp_dayWeek;
//        } else if (i == 10) {
//          str_day11 = temp_date;
//          str_dayWeek11 = temp_dayWeek;
//        } else if (i == 11) {
//          str_day12 = temp_date;
//          str_dayWeek12 = temp_dayWeek;
//        } else if (i == 12) {
//          str_day13 = temp_date;
//          str_dayWeek13 = temp_dayWeek;
//        } else if (i == 13) {
//          str_day14 = temp_date;
//          str_dayWeek14 = temp_dayWeek;
//        }
//        // System.out.println("i==>"+i);
//        arrayDay[i] = temp_date.replaceAll("-", "");
//        // 0~6 : ???~???
//      }
//
//      for (int i = 0; i < 14; i++) {
//        // for(int i=0; i<7; i++) {
//        String temp_date = DateUtil.addDays(startdate, i);
//        // System.out.println("temp_Date==>"+temp_date);
//        int dayWeek = DateUtil.getDayOfWeek(temp_date);
//        temp_date = DateUtil.addFormat(temp_date);
//
//        if (dayWeek == 0) {
//          temp_dayWeek = "???";
//        } else if (dayWeek == 1) {
//          temp_dayWeek = "???";
//        } else if (dayWeek == 2) {
//          temp_dayWeek = "???";
//        } else if (dayWeek == 3) {
//          temp_dayWeek = "???";
//        } else if (dayWeek == 4) {
//          temp_dayWeek = "???";
//        } else if (dayWeek == 5) {
//          temp_dayWeek = "???";
//        } else if (dayWeek == 6) {
//          temp_dayWeek = "???";
//        }
//
//        if (i == 0) {
//          str_day1 = temp_date;
//          str_dayWeek1 = temp_dayWeek;
//        } else if (i == 1) {
//          str_day2 = temp_date;
//          str_dayWeek2 = temp_dayWeek;
//        } else if (i == 2) {
//          str_day3 = temp_date;
//          str_dayWeek3 = temp_dayWeek;
//        } else if (i == 3) {
//          str_day4 = temp_date;
//          str_dayWeek4 = temp_dayWeek;
//        } else if (i == 4) {
//          str_day5 = temp_date;
//          str_dayWeek5 = temp_dayWeek;
//        } else if (i == 5) {
//          str_day6 = temp_date;
//          str_dayWeek6 = temp_dayWeek;
//        } else if (i == 6) {
//          str_day7 = temp_date;
//          str_dayWeek7 = temp_dayWeek;
//        } else if (i == 7) {
//          str_day8 = temp_date;
//          str_dayWeek8 = temp_dayWeek;
//        } else if (i == 8) {
//          str_day9 = temp_date;
//          str_dayWeek9 = temp_dayWeek;
//        } else if (i == 9) {
//          str_day10 = temp_date;
//          str_dayWeek10 = temp_dayWeek;
//        } else if (i == 10) {
//          str_day11 = temp_date;
//          str_dayWeek11 = temp_dayWeek;
//        } else if (i == 11) {
//          str_day12 = temp_date;
//          str_dayWeek12 = temp_dayWeek;
//        } else if (i == 12) {
//          str_day13 = temp_date;
//          str_dayWeek13 = temp_dayWeek;
//        } else if (i == 13) {
//          str_day14 = temp_date;
//          str_dayWeek14 = temp_dayWeek;
//        }
//
//        arrayDay2[i] = temp_date;
//        // System.out.println("i==>"+i);
//        // 0~6 : ???~???
//      }

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
      int income = 0;
      List item = null;
      // List colist = null;

      WooboTechDao dao = new WooboTechDao();
      
      /*
       * if(!"mng_buy_plan".equals(pageView)) { itemCount = dao.mng_buy_plan_count(arrayDay,param);
       * board = dao.mng_buy_plan(arrayDay,arrayDay2,param,page,itemCountPerPage); income =
       * dao.mng_buy_income(param); //colist = dao.mng_co_list(param); }
       */

      if (incomeChk.equals("0")) {

        if (!"mng_buy_plan".equals(pageView)) {
          System.out.println("??????@@@@@@@@@@@@@@@@@@@");
          itemCount = dao.mng_buy_plan_count(arrayDay, param);
          board = dao.mng_buy_plan(arrayDay,  param, page, itemCountPerPage);
          income = dao.mng_buy_income(param);//???????????????????????????220726???????????????  ??????????????????
          // colist = dao.mng_co_list(param);
        }

      } else {
        if (!"mng_buy_plan".equals(pageView)) {
          System.out.println("????????????@@@@@@@@@@@@@@@@@");
          itemCount = dao.mng_buy_plan_incomecount(arrayDay, param);
          board = dao.mng_buy_incomeplan(arrayDay,  param, page, itemCountPerPage);
          income = dao.mng_buy_income(param);       //???????????????????????????220726???????????????
          // colist = dao.mng_co_list(param);
        }
      }

      // colist = dao.mng_co_list(param);

      int maxPage = ListController.getMaxPage(itemCount, itemCountPerPage);
      List paging = ListController.getPaging(page, maxPage, pageCountPerPaging);
      model.addAttribute("board", board);
      model.addAttribute("income", income);     //???????????????????????????220726??????????????? 
      // model.addAttribute("colist", colist);
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
    logger.info("?????????????????? mng_buy_incomeplan end");
    return new ModelAndView("mng/" + pageView);
  }


  @RequestMapping(value = "/mng_login")
  public String mng_login(Locale locale, Model model) {
    logger.info("??????????????????mng_login start");

    Date date = new Date();
    DateFormat dateFormat =
        DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

    String formattedDate = dateFormat.format(date);

    model.addAttribute("serverTime", formattedDate);

    logger.info("?????????????????? mng_login end");
    return "mng/mng_login";
  }

  // ????????? ??? ????????? ?????????
  @RequestMapping(value = "/mng_login_user", method = RequestMethod.POST)
  public ModelAndView mng_login_user(HttpServletRequest request, Locale locale, Model model)
      throws SQLException {
    logger.info("[mng_login_user] start");
   
    // ???????????? ??????
    String loginId = F.nullCheck(request.getParameter("loginId"), "").trim();
    String loginPw = F.nullCheck(request.getParameter("loginPw"), "").trim();
    String lang = F.nullCheck(request.getParameter("lang"), "ko");
    
    int ccustChk = mngLoginService.checkCuSano(loginId);
   
    int tscmChk = mngLoginService.checkTscmCuSano(loginId);
  
    int checkSum = ccustChk + tscmChk;

    logger.info("[mng_login_user] ccustChk:"+ccustChk+", tscmChk:"+tscmChk+" checkSum:"+checkSum);

    if (loginId != null && !"".equals(loginId) && loginPw != null && !"".equals(loginPw)) {
      HttpSession session = request.getSession();    
      if ("master".equals(loginId) && mngLoginService.checkLoginMng(loginId, loginPw)) {
        session.setAttribute("admin_id", "master");
        session.setAttribute("cu_sano", "master");
        session.setAttribute("cu_master", "");
        session.setAttribute("cu_sangho", "WOOBOTECH");
        session.setAttribute("cu_code", "master");
        session.setMaxInactiveInterval(-1);

      } else if (checkSum == 2||checkSum ==3) {
        MngDTO mm = mngLoginService.selectMngDTO(loginId);
        logger.info("[mng_login_user] getCu_code:"+mm.getCu_code()+", loginPW:"+loginPw);

        if (mngLoginService.checkPWD(mm.getCu_code(), loginPw)) {
          // ** ????????????
          session.setAttribute("admin_id", mm.getCu_sano());
          session.setAttribute("cu_sano", mm.getCu_sano());
          session.setAttribute("cu_master", mm.getCu_master());
          session.setAttribute("cu_sangho", mm.getCu_sangho());
          session.setAttribute("cu_code", mm.getCu_code());
          session.setAttribute("cu_juso", mm.getCu_juso());
          session.setMaxInactiveInterval(-1);
        } else {
          ModelAndView mav = new ModelAndView();
          logger.info("[mng_login_user] login fail!!!");
          mav.setViewName("mng/mng_login");
          mav.addObject("msg", "Your ID or password is incorrect.");
          logger.info("[mng_login_user] end");
          return mav;
        }
      } else if (checkSum == 1) {
        String cu_code = mngLoginService.getCuCode(loginId);
        logger.info("[mng_login_user] cu_code:"+cu_code+", checkSum:"+checkSum);

        // insert ??? ??????
        mngLoginService.insertScmCust(cu_code);

        ModelAndView mav = new ModelAndView();
        mav.setViewName("mng/mng_login");
        mav.addObject("msg", "Registered. Pleas login again.");

        return mav;
      } else {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mng/mng_login");
        mav.addObject("msg", "Your ID or password is incorrect.");

        return mav;
      }

      // ** ????????????
      RedirectView redirectView = new RedirectView("mng_buy_plan?menu=0&lang=" + lang);
      // redirectView.set
      redirectView.setExposeModelAttributes(false);
      logger.info("[mng_login_user] end");
      return new ModelAndView(redirectView);

    } else {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("mng/mng_login");
      mav.addObject("msg", "Your ID or password is incorrect.");

      logger.info("[mng_login_user] end");
      return mav;
    }
  }

  // ????????? ????????????
  @RequestMapping(value = "/logout", method = RequestMethod.GET)
  public ModelAndView mnt_logout(HttpServletRequest request, Locale locale, Model model) {
    logger.info("?????????????????? mng_logout start");

    // ???????????? ??????
    HttpSession session = request.getSession();
    session.invalidate();

    RedirectView redirectView = new RedirectView("mng_login");
    // redirectView.set
    redirectView.setExposeModelAttributes(false);

    logger.info("?????????????????? mng_logout end");
    return new ModelAndView(redirectView);
  }

  // ?????? ?????? ??????  //???????????????????????????220726???????????????
  @RequestMapping(value = "/mng_label_exist")
  public @ResponseBody String mng_label_exist(Locale locale, HttpServletRequest request,
      Model model, @RequestParam Map<String, String> param) throws SQLException {

    WooboTechDao wdao = new WooboTechDao();

    System.out.println("?????? ?????? ?????? chk @@@@@");

    String data = wdao.mng_label_exist(param);

    System.out.println(data);

    return data;
  }
  // ????????? ?????? 2022-04-25 ?????????  ?????? ????????? ??????
  @RequestMapping(value = "/mng_label_jprint")
  public String mng_label_jprint(HttpServletRequest request, Locale lopcale, Model model,
      @RequestParam Map<String, String> param, String chk) {
    logger.info("Jasper label print Strat@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

    // ?????? ?????? ?????? pdf ?????? ????????????
    String templatePath = "";
    String destPath = "";
    if(chk.equals("1")) {
      templatePath = "/report/WB_Label_9x7_AS.jrxml";
      destPath = "/report/WB_Label_9x7_AS.pdf";
    }else {
      templatePath = "/report/WB_Label_9x7.jrxml";
      destPath = "/report/WB_Label_9x7.pdf";
    }

    String qtrbarcode = param.get("trbarcode");
    String qpno = param.get("pno");
    String qmemo = F.nullCheck(param.get("memo"), "  ");

    System.out.println(qtrbarcode);
    System.out.println(qpno);

    Connection conn = null;
    try {

      System.out.println("?????????1");

      JasperReport jasperReport = JasperCompileManager.compileReport(templatePath);

      System.out.println("?????????2");

      Map<String, Object> paramMap = new HashMap<String, Object>();

      System.out.println("?????????3");

      // ???????????? ?????? ????????????
      paramMap.put("qpno", qpno);
      paramMap.put("qtrbarcode", qtrbarcode);
      paramMap.put("qmemo", qmemo);

      System.out.println("@@@@@@@@@@??????@@@@@@@@@@@@@");
      System.out.println(paramMap.toString());

      // Map<String, Object> parameters = new HashMap<String, Object>();

      /*
       * parameters.put("param1", "value");
       * 
       * List<Map<String,?>> paramMaps = new ArrayList<Map<String,?>>(); Map<String,Object> addMap =
       * null;
       * 
       * for(int i=0;i<2;i++) { addMap = new HashMap<String, Object>(); addMap.put("qpno", qpno);
       * addMap.put("qtrbarcode", qtrbarcode); paramMaps.add(addMap); }
       */

      // parameters.put("LabelDataSource", new JRMapCollectionDataSource(paramMaps));

      Class.forName("oracle.jdbc.driver.OracleDriver");
      conn = DriverManager.getConnection("jdbc:oracle:thin:@176.122.244.138:1521:REXPOL", "rexpol", "inbus");/*"jdbc:oracle:thin:@218.147.154.81:1521:INBUS", "REXERP",
          "INBUS");*/

      JasperPrint print = JasperFillManager.fillReport(jasperReport, paramMap, conn);

      JasperExportManager.exportReportToPdfFile(print, destPath);

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      try {
        if (conn.isClosed() == false) {
          conn.close();
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
    }

    logger.info("Jasper label print End@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    return "/mng/mng_label_jprint";
  }
  
  // ????????? 220622
  @RequestMapping(value = "/mng_export_jprint")
  public String mng_export_jprint(HttpServletRequest request, Locale lopcale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("Jasper trns export Strat@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

    String templatePath = "/report/WB_A4_Export1.jrxml";
    String destPath = "/report/WB_A4_Export1.pdf";

    String qbarcode = param.get("qprbarcode");
    String qamount = param.get("amount");
    String qmemo = F.nullCheck(param.get("memo"), "  ");
    String qprdate = F.nullCheck(param.get("prdate"), "  ");
    String qsumqty = F.nullCheck(param.get("sumqty"), "  ");
    String cname = F.nullCheck(param.get("cname")," ");
    System.out.println(param.toString());
    Connection conn = null;
    try {
      JasperReport jasperReport = JasperCompileManager.compileReport(templatePath);

      Map<String, Object> paramMap = new HashMap<String, Object>();

      paramMap.put("qbarcode", qbarcode);
      paramMap.put("qamount", qamount);
      paramMap.put("qmemo", qmemo);
      paramMap.put("qprdate", qprdate);
      paramMap.put("qsumqty", qsumqty);
      paramMap.put("cname", URLDecoder.decode(cname, "utf-8"));

      System.out.println("@@@@@@@@@@??????@@@@@@@@@@@@@");
      System.out.println(paramMap.toString());

      Class.forName("oracle.jdbc.driver.OracleDriver");
      conn = DriverManager.getConnection("jdbc:oracle:thin:@176.122.244.138:1521:REXPOL", "rexpol", "inbus");/*"jdbc:oracle:thin:@218.147.154.81:1521:INBUS", "REXERP",
          "INBUS");*/

      JasperPrint print = JasperFillManager.fillReport(jasperReport, paramMap, conn);

      JasperExportManager.exportReportToPdfFile(print, destPath);

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      try {
        if (conn.isClosed() == false) {
          conn.close();
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
    }

    logger.info("Jasper export jprint End@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    return "/mng/mng_export_jprint";
  }

  // ????????? ?????? 2022-04-25 ?????????  ?????? ????????? ??????(??? 2???)
  @RequestMapping(value = "/mng_label_jprintDouble")
  public String mng_label_jprintDouble(HttpServletRequest request, Locale lopcale, Model model,
      @RequestParam Map<String, String> param, String chk) {
    logger.info("Jasper label print Strat@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

    // ?????? ?????? ?????? pdf ?????? ????????????
    String templatePath = "";
    String destPath = "";
    if(chk.equals("1")) {
        templatePath = "/report/WB_Label_9x7_Double_AS.jrxml";
        destPath = "/report/WB_Label_9x7_Double_AS.pdf";

    }else {
        templatePath = "/report/WB_Label_9x7_Double.jrxml";
        destPath = "/report/WB_Label_9x7_Double.pdf";

    }

    String qtrbarcode = param.get("trbarcode");
    String qpno = param.get("pno");
    String qmemo = F.nullCheck(param.get("memo"), "  ");

    System.out.println(qtrbarcode);
    System.out.println(qpno);

    Connection conn = null;
    try {

      System.out.println("?????????11");

      JasperReport jasperReport = JasperCompileManager.compileReport(templatePath);

      System.out.println("?????????2");

      Map<String, Object> paramMap = new HashMap<String, Object>();

      System.out.println("?????????3");

      // ???????????? ?????? ????????????
      paramMap.put("qpno", qpno);
      paramMap.put("qtrbarcode", qtrbarcode);
      paramMap.put("qmemo", qmemo);

      System.out.println("@@@@@@@@@@??????@@@@@@@@@@@@@");
      System.out.println(paramMap.toString());

      // Map<String, Object> parameters = new HashMap<String, Object>();

      /*
       * parameters.put("param1", "value");
       * 
       * List<Map<String,?>> paramMaps = new ArrayList<Map<String,?>>(); Map<String,Object> addMap =
       * null;
       * 
       * for(int i=0;i<2;i++) { addMap = new HashMap<String, Object>(); addMap.put("qpno", qpno);
       * addMap.put("qtrbarcode", qtrbarcode); paramMaps.add(addMap); }
       */

      // parameters.put("LabelDataSource", new JRMapCollectionDataSource(paramMaps));

      Class.forName("oracle.jdbc.driver.OracleDriver");
      conn = DriverManager.getConnection("jdbc:oracle:thin:@176.122.244.138:1521:REXPOL", "rexpol", "inbus");/*"jdbc:oracle:thin:@218.147.154.81:1521:INBUS", "REXERP",
          "INBUS");*/

      JasperPrint print = JasperFillManager.fillReport(jasperReport, paramMap, conn);

      JasperExportManager.exportReportToPdfFile(print, destPath);

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      try {
        if (conn.isClosed() == false) {
          conn.close();
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
    }

    logger.info("Jasper label print End@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    return "/mng/mng_label_jprintDouble";
  }

  // ??????????????? ?????????
  @RequestMapping(value = "/mng_trns_jprint")
  public String mng_trns_jprint(HttpServletRequest request, Locale lopcale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("Jasper trns jprint Strat@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

    String templatePath = "/report/WB_A4_Landscape.jrxml";
    String destPath = "/report/WB_A4_Landscape.pdf";

    String qbarcode = param.get("barcode");
    String qamount = param.get("amount");
    String qmemo = F.nullCheck(param.get("memo"), "  ");
    String qprdate = param.get("prdate");
    String qsumqty = param.get("sumqty");
   
    Connection conn = null;
    try {

      System.out.println("?????????");

      JasperReport jasperReport = JasperCompileManager.compileReport(templatePath);

      System.out.println("?????????2");

      Map<String, Object> paramMap = new HashMap<String, Object>();

      System.out.println("?????????3");

      paramMap.put("qbarcode", qbarcode);
      paramMap.put("qamount", qamount);
      paramMap.put("qmemo", qmemo);
      paramMap.put("qprdate", qprdate);
      paramMap.put("qsumqty", qsumqty);

      System.out.println("@@@@@@@@@@??????@@@@@@@@@@@@@");
      System.out.println(paramMap.toString());

      // Map<String, Object> parameters = new HashMap<String, Object>();

      /*
       * parameters.put("param1", "value");
       * 
       * List<Map<String,?>> paramMaps = new ArrayList<Map<String,?>>(); Map<String,Object> addMap =
       * null;
       * 
       * for(int i=0;i<2;i++) { addMap = new HashMap<String, Object>(); addMap.put("qpno", qpno);
       * addMap.put("qtrbarcode", qtrbarcode); paramMaps.add(addMap); }
       */

      // parameters.put("LabelDataSource", new JRMapCollectionDataSource(paramMaps));

      Class.forName("oracle.jdbc.driver.OracleDriver");
      conn = DriverManager.getConnection("jdbc:oracle:thin:@176.122.244.138:1521:REXPOL", "rexpol", "inbus");/*"jdbc:oracle:thin:@218.147.154.81:1521:INBUS", "REXERP",
          "INBUS");*/

      JasperPrint print = JasperFillManager.fillReport(jasperReport, paramMap, conn);

      JasperExportManager.exportReportToPdfFile(print, destPath);

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      try {
        if (conn.isClosed() == false) {
          conn.close();
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
    }

    logger.info("Jasper trns jprint End@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    return "/mng/mng_trns_jprint";
  }

  // ??????????????? ????????? - ?????? ????????? ??????
  @RequestMapping(value = "/mng_label_rejprint")
  public String mng_label_rejprint(Locale locale, Model model,
      @RequestParam Map<String, String> param,String chk) throws SQLException {
    logger.info("Jasper label reprint Strat@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    String templatePath = "";
    String destPath = "";
    if(chk.equals("1")) {
      templatePath = "/report/WB_Label_9x7_AS.jrxml";
      destPath = "/report/WB_Label_9x7_AS.pdf";
    }else {
      templatePath = "/report/WB_Label_9x7.jrxml";
      destPath = "/report/WB_Label_9x7.pdf";
    }

   

    String qtrbarcode = param.get("trbarcode");
    String qpno = param.get("pno");
    String qmemo = F.nullCheck(param.get("qmemo"), "  ");

    System.out.println(qtrbarcode);
    System.out.println(qpno);

    Connection conn = null;
    try {

      System.out.println("?????????");

      JasperReport jasperReport = JasperCompileManager.compileReport(templatePath);

      System.out.println("?????????2");

      Map<String, Object> paramMap = new HashMap<String, Object>();

      System.out.println("?????????3");

      paramMap.put("qpno", qpno);
      paramMap.put("qtrbarcode", qtrbarcode);
      paramMap.put("qmemo", qmemo);

      System.out.println("@@@@@@@@@@??????@@@@@@@@@@@@@");
      System.out.println(paramMap.toString());

      // Map<String, Object> parameters = new HashMap<String, Object>();

      /*
       * parameters.put("param1", "value");
       * 
       * List<Map<String,?>> paramMaps = new ArrayList<Map<String,?>>(); Map<String,Object> addMap =
       * null;
       * 
       * for(int i=0;i<2;i++) { addMap = new HashMap<String, Object>(); addMap.put("qpno", qpno);
       * addMap.put("qtrbarcode", qtrbarcode); paramMaps.add(addMap); }
       */

      // parameters.put("LabelDataSource", new JRMapCollectionDataSource(paramMaps));

      Class.forName("oracle.jdbc.driver.OracleDriver");
      conn = DriverManager.getConnection("jdbc:oracle:thin:@176.122.244.138:1521:REXPOL", "rexpol", "inbus");/*"jdbc:oracle:thin:@218.147.154.81:1521:INBUS", "REXERP",
          "INBUS");*/

      JasperPrint print = JasperFillManager.fillReport(jasperReport, paramMap, conn);

      JasperExportManager.exportReportToPdfFile(print, destPath);

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      try {
        if (conn.isClosed() == false) {
          conn.close();
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
    }

    logger.info("Jasper label reprint End@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    return "/mng/mng_label_rejprint";
  }
  //???????????????????????????220721?????????????????????
  @RequestMapping(value = "/mng_label_labelAll")
  public String mng_label_labelAll(Locale locale, Model model,
      @RequestParam Map<String, String> param) throws SQLException {
    logger.info("Jasper label reprint Strat@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

    String templatePath = "/report/WB_Label_9x7All.jrxml";
    String destPath = "/report/WB_Label_9x7All.pdf";

    String qtrbarcode = param.get("barcode");

    System.out.println(qtrbarcode);

    Connection conn = null;
    try {

      System.out.println("?????????");

      JasperReport jasperReport = JasperCompileManager.compileReport(templatePath);

      System.out.println("?????????2");

      Map<String, Object> paramMap = new HashMap<String, Object>();

      System.out.println("?????????3");

      paramMap.put("qtrbarcode", qtrbarcode);

      System.out.println("@@@@@@@@@@??????@@@@@@@@@@@@@");
      System.out.println(paramMap.toString());

      // Map<String, Object> parameters = new HashMap<String, Object>();

      /*
       * parameters.put("param1", "value");
       * 
       * List<Map<String,?>> paramMaps = new ArrayList<Map<String,?>>(); Map<String,Object> addMap =
       * null;
       * 
       * for(int i=0;i<2;i++) { addMap = new HashMap<String, Object>(); addMap.put("qpno", qpno);
       * addMap.put("qtrbarcode", qtrbarcode); paramMaps.add(addMap); }
       */

      // parameters.put("LabelDataSource", new JRMapCollectionDataSource(paramMaps));

      Class.forName("oracle.jdbc.driver.OracleDriver");
      conn = DriverManager.getConnection("jdbc:oracle:thin:@176.122.244.138:1521:REXPOL", "rexpol", "inbus");/*"jdbc:oracle:thin:@218.147.154.81:1521:INBUS", "REXERP",
          "INBUS");*/

      JasperPrint print = JasperFillManager.fillReport(jasperReport, paramMap, conn);

      JasperExportManager.exportReportToPdfFile(print, destPath);

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      try {
        if (conn.isClosed() == false) {
          conn.close();
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
    }

    logger.info("Jasper label reprint End@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    return "/mng/mng_label_labelAll";
  }
  //???????????????????????????220721??????????????????
  // //----------------------????????????
  // ?????????????????? - A4 ??????
  @RequestMapping(value = "/mng_label_a4print")
  public String mng_label_a4print(Locale locale, Model model,
      @RequestParam Map<String, String> param, String chk) {
    logger.info("Jasper Label a4print Start@@@@@@@@@@@@@@@@@@@@@@@");
    String templatePath = "";
    String destPath = "";
    if(chk.equals("1")) {
      templatePath = "/report/WB_Label_A4_AS.jrxml";
      destPath = "/report/WB_Label_A4_AS.pdf";
    }else {
      templatePath = "/report/WB_Label_A4.jrxml";
      destPath = "/report/WB_Label_A4.pdf";
    }

   

    String qtrbarcode = param.get("trbarcode");
    String qpno = param.get("pno");
    String qmemo = F.nullCheck(param.get("memo"), "  ");

    System.out.println(qtrbarcode);
    System.out.println(qpno);

    Connection conn = null;
    try {

      System.out.println("?????????");

      JasperReport jasperReport = JasperCompileManager.compileReport(templatePath);

      System.out.println("?????????2");

      Map<String, Object> paramMap = new HashMap<String, Object>();

      System.out.println("?????????3");
      
      paramMap.put("qpno", qpno);
      paramMap.put("qtrbarcode", qtrbarcode);
      paramMap.put("qmemo", qmemo);
      System.out.println(param);
      System.out.println("@@@@@@@@@@??????@@@@@@@@@@@@@");
      System.out.println(paramMap.toString());

      // Map<String, Object> parameters = new HashMap<String, Object>();

      /*
       * parameters.put("param1", "value");
       * 
       * List<Map<String,?>> paramMaps = new ArrayList<Map<String,?>>(); Map<String,Object> addMap =
       * null;
       * 
       * for(int i=0;i<2;i++) { addMap = new HashMap<String, Object>(); addMap.put("qpno", qpno);
       * addMap.put("qtrbarcode", qtrbarcode); paramMaps.add(addMap); }
       */

      // parameters.put("LabelDataSource", new JRMapCollectionDataSource(paramMaps));

      Class.forName("oracle.jdbc.driver.OracleDriver");
      conn = DriverManager.getConnection("jdbc:oracle:thin:@176.122.244.138:1521:REXPOL", "rexpol", "inbus");/*"jdbc:oracle:thin:@218.147.154.81:1521:INBUS", "REXERP",
          "INBUS");*/

      JasperPrint print = JasperFillManager.fillReport(jasperReport, paramMap, conn);

      JasperExportManager.exportReportToPdfFile(print, destPath);

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      try {
        if (conn.isClosed() == false) {
          conn.close();
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
    }

    logger.info("Jasper label a4print End@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    return "/mng/mng_label_a4print";
  }

  // ????????????????????? ??????????????? ????????? - A4??????
  @RequestMapping(value = "/mng_label_a4reprint")
  public String mng_label_a4reprint(Locale locale, Model model,
      @RequestParam Map<String, String> param, String chk) {
    logger.info("Jasper Label a4 Start@@@@@@@@@@@@@@@@@@@@@@@");
    String templatePath = "";
    String destPath = "";
    if(chk.equals("1")) {
      templatePath = "/report/WB_Label_A4_AS.jrxml";
      destPath = "/report/WB_Label_A4_AS.pdf";
 }else {
      templatePath = "/report/WB_Label_A4.jrxml";
      destPath = "/report/WB_Label_A4.pdf";
 }


    String qtrbarcode = param.get("trbarcode");
    String qpno = param.get("pno");
    String qmemo = F.nullCheck(param.get("qmemo"), "  ");

    System.out.println(qtrbarcode);
    System.out.println(qpno);

    Connection conn = null;
    try {

      System.out.println("?????????");

      JasperReport jasperReport = JasperCompileManager.compileReport(templatePath);

      System.out.println("?????????2");

      Map<String, Object> paramMap = new HashMap<String, Object>();

      System.out.println("?????????3");

      paramMap.put("qpno", qpno);
      paramMap.put("qtrbarcode", qtrbarcode);
      paramMap.put("qmemo", qmemo);

      System.out.println("@@@@@@@@@@??????@@@@@@@@@@@@@");
      System.out.println(paramMap.toString());

      // Map<String, Object> parameters = new HashMap<String, Object>();

      /*
       * parameters.put("param1", "value");
       * 
       * List<Map<String,?>> paramMaps = new ArrayList<Map<String,?>>(); Map<String,Object> addMap =
       * null;
       * 
       * for(int i=0;i<2;i++) { addMap = new HashMap<String, Object>(); addMap.put("qpno", qpno);
       * addMap.put("qtrbarcode", qtrbarcode); paramMaps.add(addMap); }
       */

      // parameters.put("LabelDataSource", new JRMapCollectionDataSource(paramMaps));

      Class.forName("oracle.jdbc.driver.OracleDriver");
      conn = DriverManager.getConnection("jdbc:oracle:thin:@176.122.244.138:1521:REXPOL", "rexpol", "inbus");/*"jdbc:oracle:thin:@218.147.154.81:1521:INBUS", "REXERP",
          "INBUS");*/

      JasperPrint print = JasperFillManager.fillReport(jasperReport, paramMap, conn);

      JasperExportManager.exportReportToPdfFile(print, destPath);

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      try {
        if (conn.isClosed() == false) {
          conn.close();
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
    }

    logger.info("Jasper label a4reprint End@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    return "/mng/mng_label_a4reprint";
  }

  // ?????????????????? ??????????????? ?????? - A4??????(??? 2???)
  @RequestMapping(value = "/mng_label_a4double")
  public String mng_label_a4dobule(Locale locale, Model model,
      @RequestParam Map<String, String> param, String chk) {
    logger.info("Jasper Label a4 double Start@@@@@@@@@@@@@@@@@@@@@@@");
    String templatePath = "";
    String destPath = "";
    if(chk.equals("1")) {
      templatePath = "/report/WB_Label_A4_Double_AS.jrxml";
      destPath = "/report/WB_Label_A4_Double_AS.pdf";
    }else {
      templatePath = "/report/WB_Label_A4_Double.jrxml";
      destPath = "/report/WB_Label_A4_Double.pdf";
    }

    String qtrbarcode = param.get("trbarcode");
    String qpno = param.get("pno");
    String qmemo = F.nullCheck(param.get("memo"), "  ");

    System.out.println(qtrbarcode);
    System.out.println(qpno);

    Connection conn = null;
    try {

      System.out.println("?????????");

      JasperReport jasperReport = JasperCompileManager.compileReport(templatePath);

      System.out.println("?????????2");

      Map<String, Object> paramMap = new HashMap<String, Object>();

      System.out.println("?????????3");

      paramMap.put("qpno", qpno);
      paramMap.put("qtrbarcode", qtrbarcode);
      paramMap.put("qmemo", qmemo);

      System.out.println("@@@@@@@@@@??????@@@@@@@@@@@@@");
      System.out.println(paramMap.toString());

      // Map<String, Object> parameters = new HashMap<String, Object>();

      /*
       * parameters.put("param1", "value");
       * 
       * List<Map<String,?>> paramMaps = new ArrayList<Map<String,?>>(); Map<String,Object> addMap =
       * null;
       * 
       * for(int i=0;i<2;i++) { addMap = new HashMap<String, Object>(); addMap.put("qpno", qpno);
       * addMap.put("qtrbarcode", qtrbarcode); paramMaps.add(addMap); }
       */

      // parameters.put("LabelDataSource", new JRMapCollectionDataSource(paramMaps));

      Class.forName("oracle.jdbc.driver.OracleDriver");
      conn = DriverManager.getConnection("jdbc:oracle:thin:@176.122.244.138:1521:REXPOL", "rexpol", "inbus");/*"jdbc:oracle:thin:@218.147.154.81:1521:INBUS", "REXERP",
          "INBUS");*/

      JasperPrint print = JasperFillManager.fillReport(jasperReport, paramMap, conn);

      JasperExportManager.exportReportToPdfFile(print, destPath);

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      try {
        if (conn.isClosed() == false) {
          conn.close();
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
    }

    logger.info("Jasper label a4double End@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    return "/mng/mng_label_a4double";
  }

  // ????????? ?????? ????????? - ?????? 2022-04-27 ?????????
  @RequestMapping(value = "/mng_member_whole")
  public String mng_member_whole(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("WHOLE MEMBER START@@@@@@@@@@@@@@@@@@@@");
    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_member_whole");

    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    if (session_cu_code == null) {
      RedirectView redirectView = new RedirectView("mng_login?menu=0");
      redirectView.setExposeModelAttributes(false);
      logger.info("??????????????????  mng_login_user end");
    }

    param.put("session_cu_code", session_cu_code);

    Date date = new Date();
    DateFormat dateFormat =
        DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));
    String startdate = DateUtil.getConvertDate(F.nullCheck(request.getParameter("startdate"), ""));

    int itemCountPerPage =
        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "30"));
    try {
      page = Integer.parseInt(request.getParameter("page"));
    } catch (Exception e) {

    }

    if (!"".equals(startdate)) {
      startdate = startdate.replaceAll("-", "");
    } else {
      startdate = DateUtil.getCurrentDate();
    }

    int itemCount = 0;
    int pageCountPerPaging = 10;

    String formattedDate = dateFormat.format(date);
    WooboTechDao wdao = new WooboTechDao();

    param.put("startdate", startdate);

    List board = null;

    if (!"mng_member_whole".equals(pageView)) {
      itemCount = wdao.mng_member_count(param);
      board = wdao.mng_member_list(param, page, itemCountPerPage);
    }

    int maxPage = ListController.getMaxPage(itemCount, itemCountPerPage);
    List paging = ListController.getPaging(page, maxPage, pageCountPerPaging);

    // System.out.println(board);

    model.addAttribute("serverTime", formattedDate);
    model.addAttribute("board", board);
    model.addAttribute("itemCount", itemCount);
    model.addAttribute("currentPage", page);
    model.addAttribute("maxPage", maxPage);
    model.addAttribute("paging", paging);
    model.addAttribute("startdate", DateUtil.addFormat(startdate));
    model.addAttribute("itemCountPerPage", itemCountPerPage);

    logger.info("WHOLE MEMBER END@@@@@@@@@@@@@@@@@@@@@@");
    return "mng/" + pageView;
  }

  // ??????????????? ????????? - ????????? 2022-04-27 ?????????
  @RequestMapping(value = "/mng_partner_whole")
  public String mng_partner_whole(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("WHOLE PARTNER START@@@@@@@@@@@@@@@@@@@@");
    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_partner_whole");

    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    if (session_cu_code == null) {
      RedirectView redirectView = new RedirectView("mng_login?menu=0");
      // redirectView.set
      redirectView.setExposeModelAttributes(false);
      logger.info("??????????????????  mng_login_user end");
      // return new ModelAndView(redirectView);

    }
    param.put("session_cu_code", session_cu_code);

    Date date = new Date();
    DateFormat dateFormat =
        DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));
    String startdate = DateUtil.getConvertDate(F.nullCheck(request.getParameter("startdate"), ""));

    int itemCountPerPage =
        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "300"));
    try {
      page = Integer.parseInt(request.getParameter("page"));

    } catch (Exception e) {
      // TODO Auto-generated catch block
      // e.printStackTrace();
    }
    if (!"".equals(startdate)) {
      startdate = startdate.replaceAll("-", "");
    } else {
      startdate = DateUtil.getCurrentDate();
    }

    int itemCount = 0;
    // int itemCountPerPage = 30;
    int pageCountPerPaging = 10;

    String formattedDate = dateFormat.format(date);
    WooboTechDao wdao = new WooboTechDao();

    param.put("startdate", startdate);

    // System.out.println(itemCount);
    List board = null;

    if (!"mng_partner_whole".equals(pageView)) {
      itemCount = wdao.mng_partner_count(param);
      board = wdao.mng_partner_list(param, page, itemCountPerPage);
      int maxPage = ListController.getMaxPage(itemCount, itemCountPerPage);
      List paging = ListController.getPaging(page, maxPage, pageCountPerPaging);

      // System.out.println(board);

      model.addAttribute("serverTime", formattedDate);
      model.addAttribute("board", board);
      model.addAttribute("itemCount", itemCount);
      model.addAttribute("currentPage", page);
      model.addAttribute("maxPage", maxPage);
      model.addAttribute("paging", paging);
      model.addAttribute("startdate", DateUtil.addFormat(startdate));
      model.addAttribute("itemCountPerPage", itemCountPerPage);
    }

    

    logger.info("WHOLE PARTNER END@@@@@@@@@@@@@@@@@@@@@@");
    return "mng/" + pageView;
  }

  // ?????? ????????? ??????
  @RequestMapping(value = "/mng_partner_email")
  public String mng_partner_email(@RequestParam String custcode, Model model) throws SQLException {
    // ModelAndView mav = new ModelAndView();

    // String a = (String) request.getAttribute("custcode");
    String a = String.format("%04d", Integer.parseInt(custcode));
    logger.info("????????????:{}", a);

    WooboTechDao wdao = new WooboTechDao();

    // ArrayList<String> list = wdao.emailList(custcode);
    int row = wdao.emailCount(a);
    wdao.emailList(a);
    logger.info("??????????????????:{}", row);
    if (row == 0) {
      model.addAttribute("msg", "0");
      model.addAttribute("list", wdao.emailList(a));
      model.addAttribute("cuCode", a);
    } else {
      model.addAttribute("list", wdao.emailList(a));
      model.addAttribute("cuCode", a);
    }

    // mav.setViewName("mng_partner_email");

    return "mng/mng_partner_email";
  }
  // ???????????? ????????? ??????
  @RequestMapping(value = "/mng_partner_email_save")
  public String mng_partner_email_save(Model model, @RequestParam Map<String, String> param,HttpServletRequest request) throws SQLException {
    // ModelAndView mav = new ModelAndView();
    logger.info("??????????????????mng_partner_email_save start");
    HttpSession session = request.getSession();
    String cucode = param.get("cucode");
    
    System.out.println("cucode??????"+cucode);
    WooboTechDao wdao = new WooboTechDao();
    int result =wdao.mng_email_u(param);
    // ArrayList<String> list = wdao.emailList(custcode);
    //int row = wdao.emailCount(cucode);
    
    //logger.info("??????????????????:{}", row);
    if (result == 0) {
      model.addAttribute("saveMsg", "No registered email.");
      model.addAttribute("result", result);
      //model.addAttribute("list", wdao.emailList(a));
    } else {
      model.addAttribute("result", result);
    }

    // mav.setViewName("mng_partner_email");
    logger.info("??????????????????mng_partner_email_save end");
    return "ajaxResult";
  }
  
//???????????? ????????? ??????
 @RequestMapping(value = "/mng_partner_email_delete")
 public String mng_partner_email_delete(Model model, @RequestParam Map<String, String> param,HttpServletRequest request) throws SQLException {
   // ModelAndView mav = new ModelAndView();
   logger.info("??????????????????mng_partner_email_delete start");
   HttpSession session = request.getSession();
   String cucode = param.get("cucode");
   String emailA = param.get("emailA");
   String userA = param.get("userA");
   System.out.println("emailA??????"+emailA);
   WooboTechDao wdao = new WooboTechDao();
   int result =wdao.mng_email_d(param);
  
   /*
    * if (result == 0) { model.addAttribute("saveMsg", "No registered email.");
    * model.addAttribute("result", result); //model.addAttribute("list", wdao.emailList(a)); } else
    * { model.addAttribute("result", result); }
    */

   // mav.setViewName("mng_partner_email");
   logger.info("??????????????????mng_partner_email_delete end");
   return "ajaxResult";
 }

  //??????????????? - ????????????????????????
  @RequestMapping(value = "/mng_add_member")
  public String mng_add_member(Locale locale, HttpServletRequest request, Model model,
      @RequestParam Map<String, String> param) {

    return "mng/mng_add_member";
  }
  //----------------------????????????
  // ??????????????? ?????? ???????????? 2022-04-27 ?????????
  @RequestMapping(value = "/mng_add_member", method = RequestMethod.POST)
  public ResponseEntity<String> mng_add_member(Locale locale, HttpServletRequest request,
      Model model, @RequestParam Map<String, String> param, MemberDTO mdto) {
    // System.out.println("mng_add_member@@@@@@@@@@@@@@@@@@");
    // System.out.println(mdto.getId());
    logger.info("mng_add_member POST@@@@@@@@@@@@@@@@@@@@@@@");

    WooboTechDao wdao = new WooboTechDao();

    int cnt = wdao.addMember(mdto);

    HttpHeaders headers = new HttpHeaders();
    headers.add("Content-Type", "text/html; charset=UTF-8");

    String str = Script.href("???????????? ??????!", "mng_add_member");

    return new ResponseEntity<String>(str, headers, HttpStatus.OK);
  }

  // ??????????????? ?????? ???????????? 2022-04-27 ?????????
  @RequestMapping(value = "mng_member_del")
  public void mng_member_del(Locale locale, HttpServletRequest request, Model model,
      @RequestParam Map<String, String> param) throws SQLException {

    WooboTechDao wdao = new WooboTechDao();

    wdao.mng_member_del(param);

  }

  // ??????????????? ????????????
  @RequestMapping(value = "mng_member_delAll")
  public void mng_member_delAll(Locale locale, HttpServletRequest request, Model model,
      @RequestParam Map<String, String> param,
      @RequestParam(value = "delList[]") List<String> chArr) throws SQLException {

    WooboTechDao wdao = new WooboTechDao();

    int result = 0;
    String delId = "";

    for (String i : chArr) {
      delId = i;
      wdao.mng_member_delAll(i);
    }

  }

  // ?????????
  @RequestMapping(value = "/mng_export_master")
  public String mng_export_master(HttpServletRequest request, Locale locale, Model model,
      @RequestParam Map<String, String> param) {
    logger.info("??????????????????mng_export_master start");

    HttpSession session = request.getSession();

    String session_cu_code = (String) session.getAttribute("cu_code");

    if (session_cu_code == null) {
      RedirectView redirectView = new RedirectView("mng_login?menu=0");
      // redirectView.set
      redirectView.setExposeModelAttributes(false);
      logger.info("??????????????????  mng_login_user end");
      // return new ModelAndView(redirectView);

    }
    param.put("session_cu_code", session_cu_code);

    Date date = new Date();
    DateFormat dateFormat =
        DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
    String pageView = F.nullCheck(request.getParameter("pageView"), "mng_export_master");
    int page = Integer.parseInt(F.nullCheck(request.getParameter("page"), "1"));
    String startdate = DateUtil.getConvertDate(F.nullCheck(request.getParameter("startdate"), ""));
    int itemCountPerPage =
        Integer.parseInt(F.nullCheck(request.getParameter("itemCountPerPage"), "300"));
    try {
      page = Integer.parseInt(request.getParameter("page"));

    } catch (Exception e) {
      // TODO Auto-generated catch block
      // e.printStackTrace();
    }
    if (!"".equals(startdate)) {
      startdate = startdate.replaceAll("-", "");
    } else {
      startdate = DateUtil.getCurrentDate();
    }

    int itemCount;
    // int itemCountPerPage = 30;
    int pageCountPerPaging = 10;

    String formattedDate = dateFormat.format(date);
    WooboTechDao dao = new WooboTechDao();
    param.put("startdate", startdate);

    itemCount = dao.mng_re_trns_count(param);
    List board = dao.mng_re_trns(param, page, itemCountPerPage);

    int maxPage = ListController.getMaxPage(itemCount, itemCountPerPage);
    List paging = ListController.getPaging(page, maxPage, pageCountPerPaging);

    model.addAttribute("serverTime", formattedDate);
    model.addAttribute("board", board);
    model.addAttribute("board", board);
    model.addAttribute("itemCount", itemCount);
    model.addAttribute("currentPage", page);
    model.addAttribute("maxPage", maxPage);
    model.addAttribute("paging", paging);
    model.addAttribute("startdate", DateUtil.addFormat(startdate));
    model.addAttribute("itemCountPerPage", itemCountPerPage);
    model.addAttribute("prdate", board);
    logger.info("?????????????????? mng_export_master end");
    return "mng/" + pageView;
  }
  @RequestMapping("/readExcel")
  public String readExcel(@RequestParam("file") MultipartFile file, Model model) throws IOException{
      System.out.println("????????????"+file);
      List<Map<String, String>> edataList = ExcelUtil.excelRead(file);
      
      model.addAttribute("edataList",edataList);
      
      logger.info(edataList.toString());
      
      return "/excelresult";
  }

}
