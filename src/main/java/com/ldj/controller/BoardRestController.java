package com.ldj.controller;

import com.ldj.dto.BoardDTO;
import com.ldj.dto.ListDTO;
import com.ldj.dto.ListResponseDTO;
import com.ldj.dto.Response;
import com.ldj.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardRestController {
    private final BoardService boardService;

    @PostMapping("register")
    public HttpEntity<Response> register(@RequestBody BoardDTO boardDTO){
        boolean result = boardService.insert(boardDTO);
        HttpEntity<Response> responseHttpEntity = new HttpEntity<>(new Response(result));
        return responseHttpEntity;
    }

    @GetMapping("/getBoardList")
    public HttpEntity<ListResponseDTO<BoardDTO>> listGet(Model model, ListDTO listDTO) {

        ListResponseDTO<BoardDTO> boards = boardService.selectList(listDTO);
        HttpEntity<ListResponseDTO<BoardDTO>> responseHttpEntity = new HttpEntity<>(boards);
        log.info("!@");
        log.info(responseHttpEntity);
        log.info("!@");
        log.info(listDTO);
        return responseHttpEntity;
    }

    @PutMapping("/putBoard/{bno}")
    public HttpEntity<Response> update(@PathVariable("bno") Integer bno, @RequestBody BoardDTO boardDTO){
        boardDTO.setBno(bno);
        boolean result = boardService.update(boardDTO);
        HttpEntity<Response> responseHttpEntity = new HttpEntity<>(new Response(result));
        log.info(responseHttpEntity);
        return responseHttpEntity;
    }


    @DeleteMapping("/delete/{bno}")
    public HttpEntity<Response> delete(@PathVariable("bno") Integer bno){
        boolean result = boardService.delete(bno);
        HttpEntity<Response> responseHttpEntity = new HttpEntity<>(new Response(result));
        return responseHttpEntity;
    }



}
