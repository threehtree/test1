package com.ldj.controller;

import com.ldj.dto.BoardDTO;
import com.ldj.dto.ChangePageDTO;
import com.ldj.dto.GenericDTO_Total_DTO;
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
        return boardService.insert(boardDTO);
    }
    //todo 1 new HttpEntity<>(new Response(result)); //여기서 false면 어떻게 되는거지??

    @GetMapping("/getBoardList")
    public HttpEntity<GenericDTO_Total_DTO<BoardDTO>> listGet(Model model, ChangePageDTO changePageDTO) {
        HttpEntity<GenericDTO_Total_DTO<BoardDTO>> responseHttpEntity = boardService.selectList(changePageDTO);
        return responseHttpEntity;
    }

    @PutMapping("/putBoard/{bno}")
    public HttpEntity<Response> update(@PathVariable("bno") Integer bno, @RequestBody BoardDTO boardDTO){
        boardDTO.setBno(bno);
        HttpEntity<Response> responseHttpEntity = boardService.update(boardDTO);
        return responseHttpEntity;
    }


    @DeleteMapping("/delete/{bno}")
    public HttpEntity<Response> delete(@PathVariable("bno") Integer bno){
        boolean result = boardService.delete(bno);
        HttpEntity<Response> responseHttpEntity = new HttpEntity<>(new Response(result));
        return responseHttpEntity;
    }



}
