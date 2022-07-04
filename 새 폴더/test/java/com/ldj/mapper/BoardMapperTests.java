package com.ldj.mapper;


import com.ldj.domain.Board;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
public class BoardMapperTests {

    @Autowired(required = false)//현재 인스턴스만 있어서 Bean조회 방지
    private BoardMapper boardMapper;

    @Test
    public void testInsert(){
        Board board = Board.builder()
                .title("제목")
                .content("내용")
                .writer("작성자")
                .build();

        boardMapper.insert(board);
        log.info("Bno: "+board);
    }
    @Test
    public void testSelectList(){
        List<Board> boardList = boardMapper.selectList(1,10);

    }
}
