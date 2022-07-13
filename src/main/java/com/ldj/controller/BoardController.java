package com.ldj.controller;

import com.ldj.dto.*;
import com.ldj.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


// TODO 화면을 보여주는 컨트롤러와 결과 데이터를 리턴할 REST API 구분이 없는 컨트롤러는 똥이다.
@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
    private final BoardService boardService;


    @GetMapping("/register")
    public void registerGet(){

    }

    @PostMapping("register")
    public HttpEntity<Response> register(@RequestBody BoardDTO boardDTO){
        // TODO 서비스 코드에서 결과 데이터를 만들어서 리턴하기 (컨트롤러는 요청을 받고 응답을 전달하는 역할만)
        boolean result = boardService.insert(boardDTO);
        HttpEntity<Response> responseHttpEntity = new HttpEntity<>(new Response(result));
        return responseHttpEntity;
    }

    @GetMapping("/list")
    public void list() {

    }
    @GetMapping("/getBoardList")
    public HttpEntity<ListResponseDTO<BoardDTO>> listGet(Model model, ListDTO listDTO) {

        // TODO 서비스 코드에서 결과 데이터를 만들어서 리턴하기 (컨트롤러는 요청을 받고 응답을 전달하는 역할만)
        ListResponseDTO<BoardDTO> boards = boardService.selectList(listDTO);
        HttpEntity<ListResponseDTO<BoardDTO>> responseHttpEntity = new HttpEntity<>(boards);
        log.info("!@");
        log.info(responseHttpEntity);
        log.info("!@");
        log.info(listDTO);
        return responseHttpEntity;
    }



    @DeleteMapping("/delete/{bno}")
    public HttpEntity<Response> delete(@PathVariable("bno") Integer bno){
        boolean result = boardService.delete(bno);
        HttpEntity<Response> responseHttpEntity = new HttpEntity<>(new Response(result));
        return responseHttpEntity;
    }
    @GetMapping("/read/{bno}")
    public String read(@PathVariable("bno") Integer bno,Model model,BoardDTO boardDTO){
        BoardDTO boardDTO1 = boardService.selectOne(bno);
        model.addAttribute("dtoOne",boardDTO1);
        return "/board/read";
    }
    @GetMapping("/modify/{bno}")
    public String modifyGet(@PathVariable("bno")Integer bno, Model model){
        BoardDTO boardDTO = boardService.selectOne(bno);
        model.addAttribute("dtoOne",boardDTO);
        return "/board/modify";
    }
    @PutMapping("/putBoard/{bno}")

    public HttpEntity<Response> update(@PathVariable("bno") Integer bno, @RequestBody BoardDTO boardDTO){
        boardDTO.setBno(bno);
        boolean result = boardService.update(boardDTO);
        HttpEntity<Response> responseHttpEntity = new HttpEntity<>(new Response(result));
        log.info(responseHttpEntity);
        return responseHttpEntity;
    }

    @GetMapping("/pageNation")
    public String pageNation(PageMaker pageMaker){


        return null;
    }


}
