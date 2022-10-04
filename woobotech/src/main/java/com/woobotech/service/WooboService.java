package com.woobotech.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.woobotech.service.jutil.DateUtil;
import com.woobotech.service.web.dao.WooboDAO;
import com.woobotech.service.web.dto.LabelDTO;
import com.woobotech.service.web.dto.TscmBarcodePayload;
import com.woobotech.tools.F;

@Service
public class WooboService {
  
  private static final Logger logger = LoggerFactory.getLogger(WooboService.class);

  @Autowired
  private WooboDAO wooboDAO;
    
  public ArrayList<LabelDTO> get_Label_list(Map<String, String> param,
      List<Map<String, Object>> splitMapList) {

    ArrayList<LabelDTO> arrList = new ArrayList<LabelDTO>();

    int totalqty = Integer.parseInt(param.get("qty"));
    String itemname = param.get("itemname");
    String itemcode1 = param.get("itemcode1");
    String custname = param.get("custname");
    String custcode = param.get("custcode");
    String indate = DateUtil.getConvertDate(F.nullCheck(param.get("indate")));
    indate = indate.substring(2, 8);
    String tradebarcode = param.get("tradebarcode");
    int cnt = 0;

    try {
      for (Map<String, Object> map : splitMapList) {
        String madate = DateUtil.getConvertDate2(map.get("date").toString()); // 1. Production date
        double box_qty = Double.parseDouble(map.get("qty").toString()); // 2. qty fer box
        double production = Double.parseDouble(map.get("qty").toString()); // 3. LOT QTY

        String barcode_seq = wooboDAO.getTScmBarcodeMax(indate);

        LabelDTO info = new LabelDTO();
        cnt++;
        if (barcode_seq != null && !"".equals(barcode_seq)) {
          String temp_barcode_seq = barcode_seq;

          logger.info("[WooboService] get_Label_list insert start indate[" + indate + "]");
          temp_barcode_seq = String.format("%05d", Integer.parseInt(temp_barcode_seq));
          StringBuffer sbBarcode = new StringBuffer();
          sbBarcode.append("M");
          sbBarcode.append(indate);
          sbBarcode.append(temp_barcode_seq);

          try {
            // 최초 발행일 경우 INSERT
            if ("1".equals(temp_barcode_seq)) {
              wooboDAO.insertTScmBarcodeMax(indate, "1", temp_barcode_seq);
            } else {
              wooboDAO.updateTScmBarcodeMax(indate);
            }

            TscmBarcodePayload tscmBarcodePayload = new TscmBarcodePayload();
            tscmBarcodePayload.setBarcode(sbBarcode.toString());
            tscmBarcodePayload.setKind("PUR");
            tscmBarcodePayload.setIndate(indate);
            tscmBarcodePayload.setMadate(madate);
            tscmBarcodePayload.setLotno(Integer.toString(cnt));
            tscmBarcodePayload.setCno(custcode);
            tscmBarcodePayload.setCname(custname);
            tscmBarcodePayload.setPno(itemcode1);
            tscmBarcodePayload.setPname(itemname);
            tscmBarcodePayload.setQty(box_qty);
            tscmBarcodePayload.setTradebarcode(tradebarcode);
            tscmBarcodePayload.setTotalqty(totalqty);
            tscmBarcodePayload.setLotqty(production);

            wooboDAO.insertTScmBarcode(tscmBarcodePayload);

            info.setBarcode(sbBarcode.toString());
            info.setQty(String.valueOf(box_qty));
            info.setMadate(madate);

            arrList.add(info);

          } catch (Exception e) {
            logger.error("▷▶▷▶▷▶ 바코드 저장 실패");
            throw new Exception("▷▶▷▶▷▶ 바코드 저장  실패");
          }
        }
      }
    } catch (Exception e) {
      logger.error("[WooboService] Exception" + e);
      e.printStackTrace();
    }
    return arrList;
  }
}
