package com.ldj.service;

import com.ldj.domain.Board;
import com.ldj.dto.BoardDTO;
import com.ldj.dto.ListDTO;
import com.ldj.dto.ListResponseDTO;

import java.util.List;

public interface BoardService {

    boolean insert(BoardDTO boardDTO);

    ListResponseDTO<BoardDTO> selectList(ListDTO listDTO);
    BoardDTO selectOne(Integer bno);

    boolean delete(Integer bno);
    boolean update(BoardDTO boardDTO);


}
