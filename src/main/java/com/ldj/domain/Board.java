package com.ldj.domain;

import lombok.*;

import java.time.LocalDateTime;

// TODO BoardDTO랑 똑같이 생겼는데
// TODO 수업때 아무생각없이 들은 부분인데 db에 접근때는 domin 을 사용하고 아닐땐 DTO를 사용하기 위해 두개를 만들었음
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
