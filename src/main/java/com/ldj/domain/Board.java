package com.ldj.domain;

import lombok.*;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Builder
public class Board {

    private Integer bno;
    private String title;
    private String content;
    private String writer;
    private LocalDateTime updateDate;
    private LocalDateTime regDate;

}
