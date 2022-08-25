package com.woobotech.service;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.woobotech.service.web.dao.MngLoginDAO;
import com.woobotech.service.web.dto.MemberDTO;
import com.woobotech.service.web.dto.MngDTO;

@Service
public class MngLoginService {
  
  private static final Logger logger = LoggerFactory.getLogger(MngLoginService.class);

  @Autowired
  private MngLoginDAO mngLoginDAO;
  
  public int checkCuSano(String loginId) {
    int rtn = 0;
    try {
      rtn = mngLoginDAO.checkCuSano(loginId);
    } catch (Exception e) {
      logger.error("checkCuSano error:{}",e);
    }
    return rtn;
  }
  
  public int checkTscmCuSano(String loginId) {
    int rtn = 0;
    try {
      rtn = mngLoginDAO.checkTscmCuSano(loginId);
    } catch (Exception e) {
      logger.error("checkTscmCuSano error:{}",e);
    }
    return rtn;
  }
  
  public MngDTO selectMngDTO(String loginId) {
    MngDTO mngDTO = null;
    try {
      mngDTO = mngLoginDAO.selectMngDTO(loginId);
    } catch (Exception e) {
      logger.error("selectMngDTO error:{}",e);
    }
    return mngDTO;
  }
  
  public boolean checkLoginMng(String id, String password) {
    boolean retValue = false;
    if ("master".equals(id) && ("woo#*".equals(password) || "woobo2330".equals(password))) { // 마스터로그인
      return true;
    }
    return retValue;
  }
  
  public boolean checkPWD(String custcode, String custpw) {
    boolean retValue = false;
    int rtn = 0;
    Map<String, String> reqMap = new HashMap<String, String>();
    reqMap.put("custcode", custcode);
    reqMap.put("custpw", custpw);
    try {
      rtn = mngLoginDAO.checkPWD(reqMap);
      if(rtn > 0) {
        retValue = true;;
      }
    } catch (Exception e) {
      logger.error("checkPWD error:{}",e);
    }    
    return retValue;
  }
  
  public String getCuCode(String loginId) {
    String retValue = "";    
    try {
      retValue = mngLoginDAO.getCuCode(loginId);
    } catch (Exception e) {
      logger.error("getCuCode error:{}",e);
    }
    return retValue;
  }
  
  public int insertScmCust(String custcode) {
    int rtn = 0;    
    try {
      rtn = mngLoginDAO.insertScmCust(custcode);
    } catch (Exception e) {
      logger.error("insertScmCust error:{}",e);
    }
    return rtn;
  }
  
  public MemberDTO getMemberById(String id) {
    MemberDTO memberDTO = null;
    try {
      memberDTO = mngLoginDAO.getMemberById(id);
    } catch (Exception e) {
      logger.error("getMemberById error:{}",e);
    }
    return memberDTO;
  }
  
  public int getCountById(String id) {
    int rtn = 0;
    try {
      rtn = mngLoginDAO.getCountById(id);
    } catch (Exception e) {
      logger.error("getCountById error:{}",e);
    }
    return rtn;
  }
}
