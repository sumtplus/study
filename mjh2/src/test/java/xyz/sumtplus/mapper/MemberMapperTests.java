package xyz.sumtplus.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.AuthVO;
import xyz.sumtplus.domain.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") 
@Log4j
public class MemberMapperTests{
	@Autowired
	private MemberMapper mapper;
	
	@Test
	public void testRead() {
		MemberVO vo = mapper.read("admin90");
		log.info(vo);
		vo.getAuthList().forEach(authVO -> log.info(authVO));
	};
	
	@Test
	public void testGetPw() {
	};
	
	@Test
	public void testInsert() {
		MemberVO vo = new MemberVO();
		vo.setUserid("mjh02");
		vo.setUserpw("1234");
		vo.setUserName("자바맨");
		vo.setEmail("mjh02@naver.com");
		vo.setTel("010-2222-2222");
		vo.setBirthDate("901112");
		log.info(vo);
		mapper.insert(vo);
	}
	
	@Test
	public void testInsertAuth() {
		AuthVO authVO = new AuthVO();
		authVO.setUserid("mjh02");
		authVO.setAuth("ROLE_ADMIN");
		log.info(authVO);
		mapper.insertAuth(authVO);
	}
	
	@Test
	public void testUpdate() {
		MemberVO vo = new MemberVO();
		vo.setUserid("mjh03");
		//vo.setUserpw("0000");
		vo.setUserName("자바인간");
		vo.setEmail("mjh03@daum.com");
		vo.setTel("010-3334-3334");
		log.info(vo);
		mapper.update(vo);
	}
	
	@Test
	public void testDelete() {
		log.info(mapper.delete("mjh03"));
	}
	
}











