package com.woobotech.service;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.woobotech.service.web.dao.WbptmesDAO;
import com.woobotech.service.web.dto.BarcodeLabelDTO;

@Service
public class WbptmesService {
  
  private static final Logger logger = LoggerFactory.getLogger(WbptmesService.class);

  @Autowired
  private WbptmesDAO bbptmesDAO;
  
  public List<BarcodeLabelDTO> selectBarcodeList(String cno) {
    List<BarcodeLabelDTO> barcodeList = null;
    try {
      barcodeList = bbptmesDAO.selectBarcodeList(cno);
    } catch (Exception e) {
      logger.error("selectBarcodeList error:{}",e);
    }
    return barcodeList;
  }
  
}
