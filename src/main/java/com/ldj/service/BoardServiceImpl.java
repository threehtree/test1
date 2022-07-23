package com.ldj.service;

import com.ldj.domain.Board;
import com.ldj.dto.BoardDTO;
import com.ldj.dto.ChangePageDTO;
import com.ldj.dto.GenericDTO_Total_DTO;
import com.ldj.dto.Response;
import com.ldj.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.stream.Collectors;

// TODO 컨트롤러에서 지저분하게 작성한 코드는 여기서 구현하기
@Repository
@RequiredArgsConstructor
@Log4j2
public class BoardServiceImpl implements BoardService {

    private final BoardMapper boardMapper;
    private final ModelMapper modelMapper;

    public HttpEntity<Response> insert(BoardDTO boardDTO) {
        Board board = modelMapper.map(boardDTO, Board.class);

        Boolean result = boardMapper.insert(board) == 1;
        HttpEntity<Response> responseHttpEntity = new HttpEntity<>(new Response(result));
        return responseHttpEntity;

    }


    public HttpEntity<GenericDTO_Total_DTO<BoardDTO>> selectList(ChangePageDTO changePageDTO){
        List<Board> boards = boardMapper.selectList(changePageDTO);
        List<BoardDTO> dtoList = boards.stream().map(board -> modelMapper.map(board, BoardDTO.class))
                .collect(Collectors.toList());

        GenericDTO_Total_DTO<BoardDTO> totalBoard=GenericDTO_Total_DTO.<BoardDTO>builder()
                .dtoList(dtoList)
                .total(boardMapper.getTotal(changePageDTO))
                .build();
        HttpEntity<GenericDTO_Total_DTO<BoardDTO>> responseHttpEntity = new HttpEntity<>(totalBoard);

        return responseHttpEntity;
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
    public HttpEntity<Response> update(BoardDTO boardDTO) {
        Board board = modelMapper.map(boardDTO, Board.class);
        Boolean result = boardMapper.update(board) == 1;
        HttpEntity<Response> responseHttpEntity = new HttpEntity<>(new Response(result));
        return  responseHttpEntity;
    }
}
