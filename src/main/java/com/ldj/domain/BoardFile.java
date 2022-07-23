package com.ldj.domain;

import lombok.*;
import lombok.extern.log4j.Log4j2;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString

public class BoardFile {
    private String uuid;
    private Integer fbno;
    private String fileName;
    private String savePath;
    private boolean img;




}
