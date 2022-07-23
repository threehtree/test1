package com.ldj.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UploadResultDTO {
    private String uuid;
    private Integer fbno;
    private String fileName;
    private String savePath;
    private boolean img;

    public String getLink() {
        return savePath+"/"+uuid+"_"+fileName;
    }
    public String getThumbnail(){
        return savePath+"/s_"+uuid+"_"+fileName;
    }

}
