package com.woobotech.service.web.dao;

import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.woobotech.service.web.dto.BarcodeLabelDTO;

@Repository
public class WbptmesDAO {

  @Autowired
  @Resource(name="sqlSessionWBPTMES")
  private SqlSession sqlSession;

  private final String NAMESPACE = "wbptmes.";
  
  public List<BarcodeLabelDTO> selectBarcodeList(String cno) throws Exception {
    return sqlSession.selectList(NAMESPACE + "selectBarcodeList", cno);
  }
 
}
