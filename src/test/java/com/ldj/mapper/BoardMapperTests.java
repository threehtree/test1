package com.ldj.mapper;


import com.ldj.domain.Board;
import com.ldj.dto.ChangePageDTO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
public class BoardMapperTests {

    @Autowired(required = false)//현재 인스턴스만 있어서 Bean조회 방지
    private BoardMapper boardMapper;

    @Test
    public void testInsert(){

        Board board = Board.builder()
                .title("제목입니다")
                .content("내용입니다")

                .build();
        for (int i = 0; i < 50; i++) {
            boardMapper.insert(board);
        }

        log.info("Bno: "+board);
    }
//    @Test
//    public void testSelectList(){
//        List<Board> boardList = boardMapper.selectList(1,10);
//
//    }

    @Test
    public void testSelectList(){

        ChangePageDTO changePageDTO = ChangePageDTO.builder()
                .page(1)
                .size(10)
                .keyword("asd")
                .type("t")
                .build();

        boardMapper.selectList(changePageDTO);
    }
    @Test
    public void testTotal(){
        ChangePageDTO changePageDTO = ChangePageDTO.builder()
                .page(1)
                .size(10)
                .keyword("asd")
                .type("t")
                .build();
        boardMapper.getTotal(changePageDTO);
    }
}
