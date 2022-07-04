package com.ldj.service;

import com.ldj.domain.Board;
import com.ldj.dto.BoardDTO;

import java.util.List;

public interface BoardService {

    boolean insert(BoardDTO boardDTO);

    List<Board> selectList();
    BoardDTO selectOne(Integer bno);

    boolean delete(Integer bno);


}
