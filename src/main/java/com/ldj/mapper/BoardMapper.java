package com.ldj.mapper;

import com.ldj.domain.Board;
import com.ldj.dto.ChangePageDTO;

import java.util.List;

public interface BoardMapper {
    Integer insert(Board board);

    List<Board> selectList(ChangePageDTO changePageDTO);
    Integer getTotal(ChangePageDTO changePageDTO);
    Board selectOne(Integer bno);

    Integer delete(Integer bno);
    Integer update(Board board);



}
