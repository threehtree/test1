package com.ldj.dto;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data

@NoArgsConstructor
public class BoardDTO {

    private Integer bno;
    private String content;
    private String title;

}
