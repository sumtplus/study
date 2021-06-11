package xyz.sumtplus.service;

import static org.junit.Assert.assertNotNull;

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
public class MemberServiceTests {
	@Autowired
	private MemberService service;
	@Test
	public void testExist() {
		assertNotNull(service);
		log.info(service);
	}
	@Test
	public void testGet2() {
		log.info(service.get2("mjh05"));
	}
	@Test
	public void testJoin() {
		MemberVO memberVO = new MemberVO();
		AuthVO authVO = new AuthVO();
		memberVO.setUserid("mjh03");
		memberVO.setUserpw("1234");
		memberVO.setUserName("자바맨");
		memberVO.setTel("010-3333-3333");
		memberVO.setEmail("mjh03@naver.com");
		memberVO.setBirthDate("901113");
		authVO.setUserid(memberVO.getUserid());
		authVO.setAuth("ROLE_ADMIN");
		
		service.join(memberVO, authVO);
		log.info("MemberVO : " + memberVO);
	}
	
	@Test
	public void testModify() {
		MemberVO memberVO = new MemberVO();
		memberVO.setUserid("mjh02");
		//memberVO.setUserpw("0000");
		memberVO.setUserName("자바인간");
		memberVO.setTel("010-2223-2223");
		memberVO.setEmail("mjh02@daum.com");
		
		log.info(service.modify(memberVO));
	}
	
	@Test
	public void testWithdraw() {
		log.info(service.withdraw("mjh02"));
	}
}







