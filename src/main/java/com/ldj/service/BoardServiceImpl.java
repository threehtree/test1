package com.ldj.service;

import com.ldj.domain.Board;
import com.ldj.dto.BoardDTO;
import com.ldj.dto.ListDTO;
import com.ldj.dto.ListResponseDTO;
import com.ldj.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

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
    public ListResponseDTO<BoardDTO> selectList(ListDTO listDTO){
        List<Board> boards = boardMapper.selectList(listDTO);
        List<BoardDTO> dtoList = boards.stream().map(board -> modelMapper.map(board, BoardDTO.class))
                .collect(Collectors.toList());
        return ListResponseDTO.<BoardDTO>builder()
                .dtoList(dtoList)
                .total(boardMapper.getTotal(listDTO))
                .build();
        //list DTO , 페이지...
    }
    public BoardDTO selectOne(Integer bno){
        Board board = boardMapper.selectOne(bno);
        BoardDTO boardDTO = modelMapper.map(board, BoardDTO.class);
        return boardDTO;
    }

    public boolean delete(Integer bno){
        return boardMapper.delete(bno) == 1;
    }

    @Override
    public boolean update(BoardDTO boardDTO) {
        Board board = modelMapper.map(boardDTO, Board.class);
        return   boardMapper.update(board) == 1;
    }
}
