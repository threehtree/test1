package com.ldj.mapper;

import com.ldj.domain.Board;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GenericMapper<E,K> {
    void insert(E obj);

    List<Board> selectList(@Param("skip") int skip, @Param("size") int size);
    Board selectOne(K num);

    void delete(K num);
    void update(E obj);

}
