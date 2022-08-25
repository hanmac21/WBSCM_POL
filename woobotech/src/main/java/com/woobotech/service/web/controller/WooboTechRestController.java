package com.woobotech.service.web.controller;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.woobotech.service.MngLoginService;
import com.woobotech.service.web.dto.MemberDTO;

@RestController
@RequestMapping("/api/*")
public class WooboTechRestController {

  @Autowired
  private MngLoginService mngLoginService;
 
  // 아이디 중복 검사용
  @GetMapping(value = "/members/{id}",
      produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
  public ResponseEntity<Map<String, Object>> getOne(@PathVariable("id") String id) {

    MemberDTO mdto = mngLoginService.getMemberById(id);
    int count = mngLoginService.getCountById(id);

    Map<String, Object> map = new HashMap<String, Object>();
    map.put("member", mdto);
    map.put("count", count);

    System.out.println(mdto);
    System.out.println(count);

    return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
  }

}
