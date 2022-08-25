package com.woobotech.service.web.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.woobotech.service.WbptmesService;
import com.woobotech.service.WbusmesService;
import com.woobotech.service.web.dto.BarcodeLabelDTO;

@Controller
public class MssqlTestController {

  private static final Logger logger = LoggerFactory.getLogger(MssqlTestController.class);

  @Autowired
  WbptmesService wbptmesService;
  
  @Autowired
  WbusmesService wbusmesService;

  // mssql DB접속 테스트
  @RequestMapping(value = "test_wbptmes_list")
  public void test_wbptmes_list(Locale locale, HttpServletRequest request, Model model,
      @RequestParam Map<String, String> param) throws SQLException {

    //000 Wbptmes
    List<BarcodeLabelDTO> barcodeWbptmesLis = wbptmesService.selectBarcodeList("0696"); //우보테크
    
    for (BarcodeLabelDTO barcodeLabelDTO : barcodeWbptmesLis) {
      logger.info("[wbptmesService] getBarcode["+barcodeLabelDTO.getBarcode()+"] getCname["+barcodeLabelDTO.getCname()+"]");
    }
    
    //001 Wbusmes
    List<BarcodeLabelDTO> barcodeWbusmesLis = wbusmesService.selectBarcodeList("3116"); //코오롱글로텍(주)울산
    
    for (BarcodeLabelDTO barcodeLabelDTO : barcodeWbusmesLis) {
      logger.info("[wbusmesService] getBarcode["+barcodeLabelDTO.getBarcode()+"] getCname["+barcodeLabelDTO.getCname()+"]");
    }
    
    
  }
}
