package xyz.sumtplus.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.Criteria;
import xyz.sumtplus.domain.ReplyPageDTO;
import xyz.sumtplus.domain.ReplyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") 
@Log4j
public class ReplyServiceTests {
	@Autowired
	private ReplyService service;
	
	@Test
	public void testService() {
		log.info(service);
	}
	
	@Test
	public void testRegister() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(82083L);
		vo.setReply("서비스 작성글");
		vo.setReplyer("작성자");
		
		log.info(service.register(vo));
	}
	
	@Test
	public void testGet() {
		Long rno = 100L;
		log.info("get :: " + service.get(rno));
	}
	
	@Test
	public void testModify() {
		ReplyVO vo = new ReplyVO();
		vo.setRno(101L);
		vo.setReply("서비스 작성글");
		
		log.info(service.modify(vo));
	}
	
	@Test
	public void testRemove() {
		Long rno = 82L;
		log.info(service.remove(rno));
	}
	
	@Test
	public void testGetList() {
		log.info(service.getList(new Criteria(), 82083L));
	}
	
	@Test
	public void testGetListPage() {
		ReplyPageDTO dto = service.getListPage(new Criteria(11, 10), 82083L);
		log.info(dto);
		log.info(dto.getCri());
		log.info(dto.getStartPage());
		log.info(dto.getEndPage());
		log.info(dto.getTotal());
		log.info(dto.isPrev());
		log.info(dto.isNext());
		
		dto.getList().forEach(log::info);
	}
}
