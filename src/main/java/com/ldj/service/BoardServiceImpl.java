package com.ldj.service;

import com.ldj.domain.Board;
import com.ldj.dto.BoardDTO;
import com.ldj.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

//@Service
@Repository
@RequiredArgsConstructor
@Log4j2
public class BoardServiceImpl implements BoardService {
    private final BoardMapper boardMapper;
    private final ModelMapper modelMapper;

    public boolean insert(BoardDTO boardDTO) {
        Board board = modelMapper.map(boardDTO, Board.class);
        return boardMapper.insert(board) == 1;
    }
    public List<Board>selectList(){
        return boardMapper.selectList();
        //list DTO
    }
    public BoardDTO selectOne(Integer bno){
        Board board = boardMapper.selectOne(bno);
        BoardDTO boardDTO = modelMapper.map(board, BoardDTO.class);
        return boardDTO;
    }

    public boolean delete(Integer bno){
        return boardMapper.delete(bno) == 1;
    }
}
