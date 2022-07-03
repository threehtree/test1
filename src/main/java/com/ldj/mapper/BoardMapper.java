package com.ldj.mapper;

import com.ldj.domain.Board;

import java.util.List;

public interface BoardMapper {
    int insert(Board board);
    List<Board> selectList();
    Board selectOne(Integer bno);

    int delete(Integer bno);

}
