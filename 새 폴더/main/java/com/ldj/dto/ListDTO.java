package com.ldj.dto;

public class ListDTO {

    private int size;
    private int page;

    public ListDTO(){
        this.size = 10;
        this.page = 1;
    }

    public void setPage(int page) {
        this.page = page <= 0? 1 : page;
    }//3항 연산자는 ? false:true

    public void setSize(int size) {
        this.size = size <= 10? 10 :size;
    }
}
