package com.ldj.service;

import com.ldj.domain.Board;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import static org.junit.jupiter.api.Assertions.assertTrue;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")

public class BoardServiceImplTest {
    @Autowired
    private BoardServiceImpl boardServiceImpl;

    @Test
    void insertTest() {
        // given
        Board board = Board.builder().title("title").content("content").build();

//        // when
//        boolean result = boardServiceImpl.insert(board);

        // then
//        assertTrue(result);
    }
//    @Test
//    void selectListTests(){
//        boardServiceImpl.selectList();
//
//    }
}
