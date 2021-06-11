package xyz.sumtplus.mapper;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.Criteria;
import xyz.sumtplus.domain.ReplyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") 
@Log4j
public class ReplyMapperTests {
	@Autowired
	private ReplyMapper replyMapper;
	
	@Test
	public void testExist() {
		log.info(replyMapper);
	}
	
	@Test
	public void testInsert() {
		IntStream.range(1, 21).forEach(i-> {
			ReplyVO vo = new ReplyVO();
			vo.setBno(82144L);
			vo.setReply("junit에서 작성한 댓글" + i);
			vo.setReplyer(i + "번째 댓글러");
			
			replyMapper.insert(vo);
		});
	}
	
	@Test
	public void testGetList() {
		replyMapper.getListWithPaging(new Criteria(2, 10), 82083L).forEach(log::info);
	}
	
	@Test
	public void testGetList2() {
		replyMapper.getListWithPaging(new Criteria(), 82083L).forEach(log::info);
	}
	
	@Test
	public void testGetListShowMore() {
		replyMapper.getListWithShowMore(95L, 82083L).forEach(log::info);
	}
	
	@Test
	public void testUpdate() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(82144L);
		vo.setReply("junit에서 수정한 댓글");
		vo.setRno(88L);
		
		log.info(replyMapper.update(vo));
	}
	
	@Test
	public void testDelete() {
		log.info(replyMapper.delete(96L));
	}
	
	@Test
	public void testRead() {
		log.info(replyMapper.read(96L));
	}
	
}


















