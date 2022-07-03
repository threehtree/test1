package com.ldj.service;

import com.ldj.domain.Board;
import com.ldj.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardService {
    private final BoardMapper boardMapper;

    public boolean insert(Board board) {
        return boardMapper.insert(board) == 1;
    }

    public List<Board>selectList(){
        return boardMapper.selectList();
    }
    public Board selectOne(Integer bno){ return boardMapper.selectOne(bno);}

    public boolean delete(Integer bno){
        return boardMapper.delete(bno) == 1;
    }
}
