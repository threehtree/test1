package com.ldj.domain;

import lombok.*;

import java.time.LocalDateTime;

// TODO BoardDTO랑 똑같이 생겼는데
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Builder
public class Board {

    private Integer bno;
    private String title;
    private String content;


}
