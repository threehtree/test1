package com.ldj.controller;

import com.ldj.domain.Board;
import com.ldj.dto.*;
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

    @GetMapping("/list")
    public void list() {

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



}
