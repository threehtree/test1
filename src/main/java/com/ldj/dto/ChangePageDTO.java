package com.ldj.dto;

import lombok.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

// TODO 사용하지 않으면서 잔뜩 만들어 놓은 코드 정리 필요
// TODO 무슨 정보의 DTO인지 알 수 없음 -> DTO 자체가 객체 하나인데 앞에 List를 붙이면 뭐하는 객체인지 아예 의미가 불명확함.
@ToString
@Getter
@Builder
@AllArgsConstructor
public class ChangePageDTO {

    private int page;

    private int size;

    private String link;

    //t tc tcw
    private String type;

    private String keyword;

    public ChangePageDTO(){
        this.page = 1;
        this.size = 10;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String[] getTypes(){
        if(type == null || type.trim().length() == 0){
            return new String[]{};
        }
        return type.split("");
    }

    public String getKeyword(){

        return keyword ==null  || keyword.trim().length() == 0 ? null: keyword.trim();
    }

    public void setPage(int page) {
        this.page = page <= 0? 1: page;
    }

    public void setSize(int size) {
        this.size = size < 10? 10: size;
    }

    public int getSkip(){
        return (this.page - 1) * size;
    }

    public String getLink(){

        UriComponentsBuilder builder = UriComponentsBuilder.newInstance();
        builder.queryParam("page", getPage())
                .queryParam("size", getSize());

        if(type != null){
            builder.queryParam("type", type);
        }

        if(keyword != null){
            try {
                String enStr = URLEncoder.encode(keyword, "UTF-8");
                builder.queryParam("keyword", enStr);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }

        }


        return builder.build().toString();
    }
}
