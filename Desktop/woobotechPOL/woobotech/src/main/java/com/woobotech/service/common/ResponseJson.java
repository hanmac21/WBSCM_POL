package com.woobotech.service.common;

import com.woobotech.service.common.Response;

public class ResponseJson extends Response {
  Object resObject = null;

  public Object getResObj() {
    return resObject;
  }

  public void setResObject(Object value) {
    this.resObject = value;
  }
}
