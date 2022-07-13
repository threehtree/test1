package com.ldj.mapper;

import com.ldj.domain.Board;
import com.ldj.dto.ListDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BoardMapper {
    Integer insert(Board board);

    List<Board> selectList(ListDTO listDTO);
    Integer getTotal(ListDTO listDTO);
    Board selectOne(Integer bno);

    Integer delete(Integer bno);
    Integer update(Board board);



}
