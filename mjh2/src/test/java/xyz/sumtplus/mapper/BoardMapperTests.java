package xyz.sumtplus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.BoardVO;
import xyz.sumtplus.domain.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"}) 
@Log4j
public class BoardMapperTests{
	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void testGetTotalCount() {
		Criteria criteria = new Criteria(1,10,2);
		//criteria.setType("W");
		//criteria.setKeyword("newbie");
		log.info(mapper.getTotalCount(criteria));
	};
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(log::info);
	};
	
	@Test
	public void testGetListWithPaging() {
		mapper.getListWithPaging(new Criteria(5, 20)).forEach(log::info);
	};
	
	@Test
	public void testGetListWithPaging2() {
		Criteria cri = new Criteria(1, 20, 1);
		mapper.getListWithPaging2(cri).forEach(log::info);
	};
	
	@Test
	public void testGetListGalley() {
		Criteria cri = new Criteria(1, 20);
		mapper.getListGalley(cri).forEach(log::info);
	};
	
	@Test
	public void testInsert(){
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("단위 테스트 작성 제목");
		boardVO.setContent("단위 테스트 작성 내용");
		boardVO.setWriter("newbie");
		
		mapper.insert(boardVO);
		log.info(boardVO);
	}
	
	@Test
	public void testUpdate(){
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("수정된 단위 테스트 작성 제목");
		boardVO.setContent("수정된 단위 테스트 작성 내용");
		boardVO.setWriter("newbie");
		boardVO.setBno(82126L);
		
		log.info(mapper.update(boardVO));
	}
	
	@Test
	public void testInsertSelectKey(){
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("단위 테스트 작성 제목");
		boardVO.setContent("단위 테스트 작성 내용");
		boardVO.setWriter("newbie");
		
		
		mapper.insertSelectKey(boardVO);
		log.info(boardVO);
	}
	
	@Test
	public void testInsertSelectKeyChild(){
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("자바작성");
		boardVO.setContent("자바작성내용");
		//boardVO.setParentno(0L);
		//boardVO.setRegroup(0L);
		//boardVO.setDepth(0L);
		boardVO.setWriter("작성자");
		
		mapper.insertSelectKeyChild(boardVO);
		log.info(boardVO);
	}
	
	@Test
	public void testRead() {
		log.info(mapper.read(82217L));
	}
	
	@Test
	public void testRead2() {
		log.info(mapper.read2(82217L));
	}
	
	@Test
	public void testDelete() {
		log.info(mapper.delete(82126L));
	}
	
	@Test
	public void testSearch() {
		Criteria criteria = new Criteria();
		criteria.setType("W");
		criteria.setKeyword("newbie");
		
		mapper.getListWithPaging(criteria);
	}
}











