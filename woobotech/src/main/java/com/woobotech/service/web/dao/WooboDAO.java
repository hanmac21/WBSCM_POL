package com.woobotech.service.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.woobotech.service.web.dto.TscmBarcodePayload;


@Repository
public class WooboDAO {

  @Autowired
  private SqlSession sqlSession;

  private final String NAMESPACE = "woobo.";

  
  public String getTScmBarcodeMax(String indate) throws Exception {
    return sqlSession.selectOne(NAMESPACE + "getTScmBarcodeMax", indate);
  }
  
  public int insertTScmBarcodeMax(String indate, String kind, String barcode) throws Exception {
    return sqlSession.insert(NAMESPACE + "insertTScmBarcodeMax", indate);
  }
     
  public int updateTScmBarcodeMax(String indate) throws Exception {
    return sqlSession.update(NAMESPACE + "updateTScmBarcodeMax", indate);
  }
  
  public int insertTScmBarcode(TscmBarcodePayload tscmBarcodePayload) throws Exception {
    return sqlSession.insert(NAMESPACE + "insertTScmBarcode", tscmBarcodePayload);
  }
  
  
}
