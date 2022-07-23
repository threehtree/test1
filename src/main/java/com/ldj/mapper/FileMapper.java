package com.ldj.mapper;

import com.ldj.domain.BoardFile;

public interface FileMapper {

     void fileInsert(BoardFile boardFile);
     void fileDelete(Integer bno);
     void fileUpdateBoard(BoardFile boardFile);

}
