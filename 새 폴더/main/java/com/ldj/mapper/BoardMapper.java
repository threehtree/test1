package com.ldj.mapper;

import com.ldj.domain.Board;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BoardMapper {
    Integer insert(Board board);

    List<Board> selectList(@Param("skip") int skip, @Param("size") int size);
    Board selectOne(Integer bno);

    Integer delete(Integer bno);
    void update(Board board);



}
