package com.ldj.controller;

import com.ldj.domain.Board;
import com.ldj.dto.BoardDTO;
import com.ldj.dto.Response;
import com.ldj.service.BoardService;
import com.ldj.service.BoardServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
        boolean result = boardService.insert(boardDTO);
        HttpEntity<Response> responseHttpEntity = new HttpEntity<>(new Response(result));
        return responseHttpEntity;
    }

    @GetMapping("/list")
    public void list() {

    }
    @GetMapping("/getBoardList")
    public HttpEntity<List<Board>> listGet(Model model) {
        List<Board> boards = boardService.selectList();
        HttpEntity<List<Board>> responseHttpEntity = new HttpEntity<>(boards);
        log.info("!@");
        log.info(responseHttpEntity);
        log.info("!@");
        return responseHttpEntity;
    }
    @DeleteMapping("/delete/{bno}")
    public HttpEntity<Response> delete(@PathVariable("bno") Integer bno){
        boolean result = boardService.delete(bno);
        HttpEntity<Response> responseHttpEntity = new HttpEntity<>(new Response(result));
        return responseHttpEntity;
    }
    @GetMapping("/read/{bno}")
    public String read(@PathVariable("bno") Integer bno,Model model){
        BoardDTO boardDTO = boardService.selectOne(bno);
        model.addAttribute("dtoOne",boardDTO);
        return "/board/read";
    }
}
