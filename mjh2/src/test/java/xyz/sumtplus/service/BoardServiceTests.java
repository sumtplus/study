package xyz.sumtplus.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.BoardVO;
import xyz.sumtplus.domain.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") 
@Log4j
public class BoardServiceTests {
	@Autowired
	private BoardService service;
	@Test
	public void testExist() {
		assertNotNull(service);
		log.info(service);
	}
	@Test
	public void testRegister(){
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("단위 테스트 작성 제목 in Service");
		boardVO.setContent("단위 테스트 작성 내용 in Service");
		boardVO.setWriter("newbie");
		
		service.register(boardVO);
		log.info("생성된 게시글의 번호 : " + boardVO.getBno());
	}
	
	@Test
	public void testRegisterChild(){
		BoardVO boardVO = new BoardVO();
//		boardVO.setTitle("자바작성");
//		boardVO.setContent("자바 내용");
		boardVO.setTitle("RE : RE : 첨부그글");
		boardVO.setContent("자바 답글");
		boardVO.setWriter("newbie");
		boardVO.setParentno(82175L);
		boardVO.setRegroup(82146L);
		boardVO.setDepth(2L);
		
		
		service.registerChild(boardVO);
		log.info("생성된 게시글의 번호 : " + boardVO.getBno());
	}
	
	@Test
	public void testGetList() {
		service.getList(new Criteria()).forEach(log::info);
	};
	
	@Test
	public void testGetList2() {
		service.getList2(new Criteria()).forEach(log::info);
	};
	
	@Test
	public void testGetList3() {
		service.getList3(new Criteria()).forEach(log::info);
	};
	
	@Test
	public void testModify(){
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("수정된 단위 테스트 작성 제목 in Service");
		boardVO.setContent("수정된 단위 테스트 작성 내용 in Service");
		boardVO.setWriter("newbie");
		boardVO.setBno(82148L);
		
		log.info(service.modify(boardVO));
	}
	@Test
	public void testRead() {
		log.info(service.get(82148L));
	}
	
	@Test
	public void testDelete() {
		log.info(service.remove(82148L));
	}
	
	@Test
	public void testGetTotal() {
		log.info(service.getTotal(new Criteria()));
	}
}
