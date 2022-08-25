package com.woobotech.service.web.dao;

import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.woobotech.service.web.dto.MemberDTO;
import com.woobotech.service.web.dto.MngDTO;

@Repository
public class MngLoginDAO {

  @Autowired
  private SqlSession sqlSession;

  private final String NAMESPACE = "mnglogin.";

  public int checkCuSano(String loginId) throws Exception {
    return sqlSession.selectOne(NAMESPACE + "checkCuSano", loginId);
  }
  
  public int checkTscmCuSano(String loginId) throws Exception {
    return sqlSession.selectOne(NAMESPACE + "checkTscmCuSano", loginId);
  }
  
  public MngDTO selectMngDTO(String loginId) throws Exception {
    return sqlSession.selectOne(NAMESPACE + "selectMngDTO", loginId);
  }

  public int checkPWD(Map reqMap) throws Exception {
    return sqlSession.selectOne(NAMESPACE + "checkPWD", reqMap);
  }
  
  public String getCuCode(String loginId) throws Exception {
    return sqlSession.selectOne(NAMESPACE + "getCuCode", loginId);
  }
  
  public int insertScmCust(String custcode) throws Exception {
    return sqlSession.insert(NAMESPACE + "insertScmCust", custcode);
  }
  
  public MemberDTO getMemberById(String id) throws Exception {
    return sqlSession.selectOne(NAMESPACE + "getMemberById", id);
  }
  
  public int getCountById(String id) throws Exception {
    return sqlSession.selectOne(NAMESPACE + "getCountById", id);
  }
}
