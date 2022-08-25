package com.woobotech.service.web.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MailSendController {

  @Autowired
  private JavaMailSender sender;

  // 이메일 전송 테스트 우보에서 정보 확실히 받아야 함
  @RequestMapping("/mail/send")
  public String sendMail(@RequestParam(value = "email1", required = false) String email1,
      @RequestParam String subject, @RequestParam String content,
      @RequestParam(value = "email2", required = false) String email2,
      @RequestParam(value = "email3", required = false) String email3,
      @RequestParam(value = "email4", required = false) String email4,
      @RequestParam(value = "email5", required = false) String email5, Model model) {

    System.out.println(email1);
    System.out.println(email2);
    System.out.println(email3);
    System.out.println(email4);
    System.out.println(email5);
    System.out.println("subject[" + subject + "]");
    System.out.println("content[" + content + "]");

    SimpleMailMessage message = new SimpleMailMessage();

    if (email1 != null) {
      message.setTo(email1);
      message.setSubject(subject);

      message.setText(content);
      message.setFrom("admin@woobotech.com");

      sender.send(message);
    }
    if (email2 != null) {
      message.setTo(email2);
      message.setSubject(subject);

      message.setText(content);
      message.setFrom("admin@woobotech.com");

      sender.send(message);
    }
    if (email3 != null) {
      message.setTo(email3);
      message.setSubject(subject);

      message.setText(content);
      message.setFrom("admin@woobotech.com");

      sender.send(message);
    }
    if (email4 != null) {
      message.setTo(email4);
      message.setSubject(subject);

      message.setText(content);
      message.setFrom("admin@woobotech.com");

      sender.send(message);
    }
    if (email5 != null) {
      message.setTo(email5);
      message.setSubject(subject);

      message.setText(content);
      message.setFrom("admin@woobotech.com");

      sender.send(message);
    }

    // mav.setViewName("mng_partner_email_success");

    return "mng/mng_partner_email_success";
  }

}
