package com.ldj.dto;

import org.springframework.http.HttpEntity;

public class ResponseEntity extends HttpEntity<Response> {
   private final Object status;

   public ResponseEntity(Object status) {
      this.status = status;
   }
}