package com.ldj.controller;

import com.ldj.domain.Board;
import com.ldj.dto.Response;
import com.ldj.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Controller;
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
    public HttpEntity<Response> register(@RequestBody Board board){
        boolean result = boardService.insert(board);
        HttpEntity<Response> responseHttpEntity = new HttpEntity<>(new Response(result));
        return responseHttpEntity;
    }

    @GetMapping("/list")
    @ResponseBody
    public List<Board> listGet() {
        List<Board> boards = boardService.selectList();
        return boards;
    }

}
