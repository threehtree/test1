package com.ldj.dto;

import lombok.Data;

@Data
public class PageMaker {
    private int page;
    private int start, end;

    private boolean prev, next;

    private int total;

    public PageMaker(int page, int total) {
        this.page = page <= 0? 1:page;
        this.total = total;

        int tempEnd =(int)(Math.ceil(this.page/10.0)*10);
        //ceil은 0에 가깝게 반올림// 가짜 end

        this.start = tempEnd - 9;
        //이걸 위한 가짜 end

        if(tempEnd *10 >= total){
            this.end = (int)(Math.ceil(total/10.0));
            this.next = false;
        } else {
            this.end = tempEnd;
            this.next = true;
        }

        this.prev = start !=1 ;
        //1이 아닌 값이면 10페이지 이상이다. -는 위에서 막아 놧다




    }



}
