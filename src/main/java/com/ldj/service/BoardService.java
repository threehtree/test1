package com.ldj.service;

import com.ldj.dto.BoardDTO;
import com.ldj.dto.ChangePageDTO;
import com.ldj.dto.GenericDTO_Total_DTO;
import com.ldj.dto.Response;
import org.springframework.http.HttpEntity;

public interface BoardService {

    HttpEntity<Response> insert(BoardDTO boardDTO);

    HttpEntity<GenericDTO_Total_DTO<BoardDTO>> selectList(ChangePageDTO changePageDTO);
    BoardDTO selectOne(Integer bno);

    boolean delete(Integer bno);
    HttpEntity<Response> update(BoardDTO boardDTO);


}
