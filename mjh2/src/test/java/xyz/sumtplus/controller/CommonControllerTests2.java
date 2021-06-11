package xyz.sumtplus.controller;

import static org.junit.Assert.assertNotNull;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"}) 
@Log4j
@WebAppConfiguration //서블릿 컨텍스트가 추가 되어서 추가함
public class CommonControllerTests2 {
	@Autowired
	private WebApplicationContext ctx; 
	private MockMvc mvc; //가짜객체
	
	@Before
	public void setup() {
		mvc = MockMvcBuilders.webAppContextSetup(ctx).build(); //필요한 순간에 객체를 생성하겠다
	};
	
	@Test
	public void testList() throws Exception {
		log.info(mvc.perform(MockMvcRequestBuilders.get("/board/list")
				.param("pageNum", "1")
				.param("amount", "20")
				)
				.andReturn()
				.getModelAndView() //컨트롤러의 메서드
				.getModelMap()); //모델안의 정보확인
	}
	
	@Test
	public void testget() throws Exception {
		log.info(mvc.perform(MockMvcRequestBuilders.get("/board/get")
				.param("bno", "1"))
			.andReturn()
			.getModelAndView() 
			.getModelMap());
	}
	
	@Test
	public void testRegister() throws Exception {
		log.info(mvc.perform(MockMvcRequestBuilders.post("/board/register")
//				.param("title", "RE2 첨부그글")
//				.param("content", "DB 답글")
				.param("title", "자바작성글")
				.param("content", "자바내용")
				.param("writer", "user00") //파라미터 전송
//				.param("parentno", "82146")
//				.param("regroup", "82146")
//				.param("depth", "2")
				)
			.andReturn()
			.getModelAndView()
			.getViewName()); 
	}
	/*
	@Test
	public void testRegisterChild() throws Exception {
		log.info(mvc.perform(MockMvcRequestBuilders.post("/board/register")
				.param("title", "컨트롤러 테스트 제목")
				.param("content", "컨트롤러 테스트 내용")
				.param("writer", "user00")
				.param("parentno", "82175")
				.param("regroup", "82146")
				.param("depth", "2")
				)
			.andReturn()
			.getModelAndView()
			.getViewName()); 
	}
	*/
	@Test
	public void testModify() throws Exception {
		log.info(mvc.perform(MockMvcRequestBuilders.post("/board/modify")
				.param("title", "컨트롤러 테스트 제목 수정")
				.param("content", "컨트롤러 테스트 내용 수정")
				.param("writer", "user00")
				.param("bno", "61")
				)
			.andReturn()
			.getModelAndView()
			.getViewName()); 
	}
	
	@Test
	public void testRemove() throws Exception {
		log.info(mvc.perform(MockMvcRequestBuilders.post("/board/remove") 
				.param("bno", "61")
				)
			.andReturn()
			.getModelAndView()
			.getViewName()); 
	}
	
	
	
}








