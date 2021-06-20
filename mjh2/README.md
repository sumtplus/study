# MIN SCHOOL
### 1. 소개 <br>
스프링프레임워크를 이용하여 처음으로 개발한 회원제 게시판입니다. 부트스트랩을 이용하여 온라인 강의를 소개하는 사이트를 테마로 했습니다. 코로나 시대에 비대면 교육이 필수가 되면서, 학생들은 온라인으로 강의를 들어야 하는 경우가 늘어나고 있습니다. 특히 취업에 대한 강좌들이 수요가 높은데, 그래서 저는 자격증이나 공무원 그리고 IT 강좌들을 한 사이트에 모아서 쉽게 정보를 제공하고 싶어서 해당 사이트를 제작했습니다. 또한 이 공간이 직접 만나기 힘든 강사와 학생 간의 소통의 장이 되어 온라인 수업의 단점을 보완 할 수 있기를 바랐습니다. 그리고 비슷한 목적을 가진 학생들끼리 웹 상에서 만나 고민과 경험을 나누고 조언을 구할 수 있는 공간을 제공하고자 했습니다.   
### 2. 기능
* 회원 : 스프링 시큐리티를 이용하여 로그인 처리. 회원가입, 회원정보수정, 탈퇴추가
* 강의정보 : 게시판 카테고리를 나누어 취업에 관련된 다양한 강좌들을 사진과 함께 소개
* 커뮤니티 : 기본적인 CRUD가 가능한 게시판이며, ajax를 이용한 댓글 비동기 처리, 오라클 계층형쿼리를 이용한 답글 기능 추가
* 첨부파일 : MultiPart를 이용하여 파일업로드/다운로드 처리, 이미지는 썸네일 표시
### 3. 사용프로그램
* 사용언어 : JAVA, HTML, CSS, JAVASCRIPT, SQL
* 사용도구 : eclipse, spring framework, JDK 1.8
* 데이터베이스 : Oracle Database 11g Enterprise Edition, SQLDeveploper
* 서버 : Apach tomcat 9.0 , nginx
* 기타 : AWS, SVN, GIT
### 4. 테이블설계도
<img src="https://user-images.githubusercontent.com/78586159/122665130-68704600-d1e0-11eb-947e-210015386163.png" width="535px" height="377px"></img><br>
회원제 게시판을 만들기 위해 총 6개의 테이블을 생성했습니다. 테이블은 게시판, 파일첨부, 댓글, 회원, 권한, 자동로그인이 있습니다. 파일첨부와 댓글은 게시판의 글번호를 참조하고 있고, 권한은 회원을 참조하고 있습니다. 게시판 테이블에는 답글형게시판을 위한 추가 컬럼이 들어가 있습니다. 회원과 권한, 자동로그인은 스프링시큐리티에 맞게 테이블을 구성하였습니다.
* TBL_BOARD(게시판) : BNO 글번호(PK), TITLE 제목, CONTENT 내용, WRITER 작성자, REPLYCNT 댓글수, REGROUP 조상글번호, DEPTH 답글깊이, PARENTNO 부모글번호, HITCOUNT 조회수, CATEGORY 게시판번호, CLOSE 비공개
* TBL_REPLY(댓글) : RNO 댓글번호(PK), BNO (FK), REPLY 댓글내용 REPLYER 작성자
* TBL_ATTACH(파일첨부) : UUID 파일명(PK), UPLOADPATH 경로, FILENAME 실제파일명, IMAGE 이미지여부, BNO (FK)
* TBL_MEMBER(회원) : USERID 아이디 (PK), USERPW 비밀번호, USERNAME 이름, ENABLE 활성화 
### 5. VO/DTO 구성
기본적으로 테이블과 대응되는 자바의 클래스들이 있습니다. BoardVO(게시판), BoardAttachVO(첨부파일, AttachFileDTO를 상속), ReplyVO(댓글), MemberVO(회원), AuthVO(권한)   
페이징, 검색처리를 위한 클래스가 있습니다. Criteria(기준), PageDTO(페이징처리), ReplyPageDTO(댓글페이징처리, PageDTO를 상속)
#### Criteria
```java  
package xyz.sumtplus.domain;

import org.springframework.web.util.UriComponentsBuilder;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
/**
 * 페이징처리와 게시판카테고리 분류, 검색을 처리하기 위한 클래스
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Criteria {
	private Integer pageNum = 1; //페이지번호
	private Integer amount = 10; //한 페이지당 데이터수
	private Integer category = 1; //게시판번호
	
	private String type; //검색조건
	private String keyword; //키워드
	
	public Criteria(Integer pageNum, Integer amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public Criteria(Integer pageNum, Integer amount, Integer category) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
		this.category = category;
	}
	
	// 검색조건을 배열로 변환하는 메서드
	public String[] getTypeArr() {
		return type == null ? new String[]{} : type.split("");
		// ex) "ABCD".split("") -> {"A","B","C","D"}
	}
	
	/**
	 *	uri를 생성하기 위한 메서드 
	 */
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", pageNum)
				.queryParam("amount", amount)
				.queryParam("type", type)
				.queryParam("keyword", keyword);
		return builder.toUriString();
	}
	
	public String getListLink2() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("amount", amount)
				.queryParam("type", type)
				.queryParam("keyword", keyword);
		return builder.toUriString();
	}
	
	public String getListLink3() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", pageNum)
				.queryParam("type", type)
				.queryParam("keyword", keyword);
		return builder.toUriString();
	}
}
```
#### PageDTO
```java  
package xyz.sumtplus.domain;

import lombok.Data;
/**
 * 페이징 처리를 위한 클래스 
 */
@Data
public class PageDTO {
	private int startPage; //시작페이지
	private int endPage; //끝페이지
	private int realEnd; //진짜 끝페이지
	private boolean prev; //이전
	private boolean next; //다음
	
	private int total; //전체 데이터 수
	private Criteria cri;
	
	// 생성자
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		// 페이지번호로 끝페이지와 시작페이지 계산
		// ex) pageNum = 13이면 endPage = 20, startPage = 11 
		endPage = (cri.getPageNum() + 9) / 10 * 10;
		startPage = endPage - 9;
		// 전체데이터수로 realEnd 계산
		realEnd = (total + 9) / 10;
		// 끝페이지가 realEnd보다 크면 realEnd 반환
		endPage = realEnd < endPage ? realEnd : endPage;
		// 이전은 시작번호가 1보다 큰 경우에 존재
		prev = startPage > 1;
		// 다음은 realEnd가 끝번호보다 큰 경우에만 존재
		next = endPage < realEnd;
	}
}
```
### 6. Controller 구성
BoardController는 게시판을, CommonController는 회원을, ReplyController는 댓글을 Service를 통하여 처리합니다. UploadController는 첨부파일을 처리합니다.
ReplyController는 하나의 uri가 하나의 고유한 리소스를 대표하는 Rest방식을 사용하였습니다.
#### BoardController
스프링 시큐리티의 어노테이션을 이용하여 게시글 등록은 로그인한 사용자만 접근, 게시글 수정/삭제는 작성자만 접근가능합니다. 첨부파일과 관련된 메서드가 있습니다.
```java  
package xyz.sumtplus.controller;

import java.io.File;
import java.security.Provider.Service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.BoardAttachVO;
import xyz.sumtplus.domain.BoardVO;
import xyz.sumtplus.domain.Criteria;
import xyz.sumtplus.domain.PageDTO;
import xyz.sumtplus.service.BoardService;
/**
 *	게시판을 처리하는 컨트롤러 
 */
@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {
	@Autowired
	private BoardService service;
	// crieria를 파라미터로 받아서 게시글 목록과 페이징을 모델에 부여
	// list페이지 요청
	@GetMapping("list")
	public void list(Criteria cri, Model model) {
		log.info("list....");
		model.addAttribute("list",service.getList2(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}
	// criteria를 파라미터로 받아서 강의조회게시글 목록과 페이징을 모델에 부여
	// criteria의 카테고리는 2로 데이터수는 8로 고정하여 courseList페이지 요청
	@GetMapping("courseList")
	public void courseList(Criteria cri, Model model) {
		log.info("courseList......");
		cri.setCategory(2);
		cri.setAmount(8);
		model.addAttribute("list",service.getList3(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}
	
	// bno와 criteria를 파라미터로 받아서 bno에 해당하는 게시글과 criteria를 모델에 부여
	// get또는 modify페이지 요청
	@GetMapping({"get","modify"})
	public void get(@RequestParam Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("get or modify....");
		model.addAttribute("board",service.get(bno));
		model.addAttribute("cri",cri);
	}
	// bno(기본값 0)를 파라미터로 받아서 조건에 맞게 모델에 부여
	// register페이지 요청
	@PreAuthorize("isAuthenticated()")
	@GetMapping("register")
	public void register(@RequestParam(defaultValue="0") Long bno, Model model) {
		// bno가 0일때 게시글등록, bno에 해당하는 boardVO객체를 모델에 부여
		if(bno == 0) {
			log.info("register.......");
			log.info("boardVO : " + service.get(bno));
		}
		// bno가 0이 아닐때 답글등록, bno에 해당하는 boardVO객체와 regroup을 모델에 부여
		else {
			log.info("answer....");
			log.info("regroup : " + service.get(bno).getRegroup());
			model.addAttribute("board", service.get(bno));
		}
	}
	// register에서 post로 데이터를 받았을때 처리
	// boardVO를 파라미터로 받아서 게시글 등록
	@PreAuthorize("isAuthenticated()")
	@PostMapping("register")
	public String register(BoardVO boardVO, RedirectAttributes rttr) {
		log.info("register....");
		log.info(boardVO);
		service.registerChild(boardVO);
		// 1회성사용, 새로 등록한 게시글 번호를 전달
		rttr.addFlashAttribute("result", boardVO.getBno());
		// list로 리다이렉트
		return "redirect:/board/list";
	}
	// modify에서 post로 데이터를 받았을때 처리
	// boardVO와 criteria를 파라미터로 받아서 게시글 수정
	@PreAuthorize("principal.username == #boardVO.writer")
	@PostMapping("modify")
	public String modify(BoardVO boardVO, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify....");
		log.info(boardVO);
		boardVO.getAttachList().forEach(log::info);
		// 수정 성공시 success를 반환
		if(service.modify(boardVO)) {
			rttr.addFlashAttribute("result", "success");
		};
		// 페이징된 list로 리다이렉트
		return "redirect:/board/list" + cri.getListLink();
	}
	// remove에서 post로 데이터를 받았을때 처리
	// bno와 writer와 criteria를 파라미터로 받아서 게시글 삭제
	@PreAuthorize("principal.username == #writer")
	@PostMapping("remove")
	public String remove(String writer, @RequestParam Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) { 
		log.info("remove....");
		// bno로 첨부파일의 목록을 가져옴
		List<BoardAttachVO> list = service.getAttachList(bno);
		// 삭제 성공시 첨부파일을 제거, success을 반환
		if(service.remove(bno)) {
			deleteFiles(list);
			rttr.addFlashAttribute("result", "success");
		};
		// 페이징된 list로 리다이렉트
		return "redirect:/board/list" + cri.getListLink();
	}
	// bno를 파라미터로 받아서 첨부파일의 목록을 반환
	@ResponseBody
	@GetMapping("getAttachList")
	public List<BoardAttachVO> getAttachList(Long bno) {
		log.info("getAttachList... " + bno);
		return service.getAttachList(bno);		
	}
	// 첨부파일을 삭제하는 메서드
	private void deleteFiles(List<BoardAttachVO> attachList) {
		log.info("deleteFiles............");
		log.info(attachList);
		// 이미지일 경우 썸네일도 같이 삭제
		attachList.forEach(attach-> {
			new File(UploadController.UPLOAD_PATH, attach.getDownPath()).delete();
			if(attach.isImage()) {
				new File(UploadController.UPLOAD_PATH, attach.getThumbPath()).delete();
			}
		});
	}
}
```
#### ReplyController
등록은 post, 조회는 get, 삭제는 delete, 수정은 put또는 patch방식을 사용하였습니다. 조회/수정/삭제는 uri에 댓글의 pk를 부여했습니다.
```java  
package xyz.sumtplus.controller;

import java.util.List;
import java.util.Optional;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.Criteria;
import xyz.sumtplus.domain.ReplyPageDTO;
import xyz.sumtplus.domain.ReplyVO;
import xyz.sumtplus.service.ReplyService;
/**
 * 댓글 컨트롤러
 */
@RestController
@RequestMapping("/replies/")
@Log4j
@AllArgsConstructor
public class ReplyController {
	private ReplyService service;
	// 댓글등록
	@PostMapping("new")
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		log.info(vo);
		int insertCount = service.register(vo);
		log.info("insertCount :: " + insertCount);
		return insertCount == 1 ? 
				new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	// 댓글 상세조회
	@GetMapping("{rno}")
	public ResponseEntity<ReplyVO> get(@PathVariable Long rno) {
		log.info(rno);
		return new ResponseEntity<ReplyVO>(service.get(rno), HttpStatus.OK);
	}
	// 댓글 수정
	@RequestMapping(value="{rno}", method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> modify(@PathVariable("rno") Long rno, @RequestBody ReplyVO vo) {
		log.info(vo);
		vo.setRno(rno);
		int updateCount = service.modify(vo);
		log.info("insertCount :: " + updateCount);
		return updateCount == 1 ? 
				new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	// 댓글 삭제
	@DeleteMapping("{rno}/{replyer}")
	public ResponseEntity<String> remove(@PathVariable Long rno, @PathVariable String replyer) {
		log.info(rno);
		int removeCount = service.remove(rno);
		log.info("insertCount :: " + removeCount);
		return removeCount == 1 ? 
				new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 목록조회
	// uri에 게시글번호와 페이지번호를 부여함
	@GetMapping("pages/{page}/{bno}")
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable int page, @PathVariable long bno) {
		log.info("getList");
		Criteria cri = new Criteria(page, 10);
		log.info(cri);
		return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
	}
	
	// 댓글 목록조회(더보기)
	// uri에 게시글번호와 댓글번호를 부여하여 댓글번호를 기준으로 더 보여줌
	@GetMapping({"more/{bno}", "more/{bno}/{rno}"})
	public ResponseEntity<List<ReplyVO>> getListMore(@PathVariable Long bno, @PathVariable Optional<Long> rno) {
		log.info("getListMore");
		return new ResponseEntity<>(service.getListMore(rno.isPresent() ? rno.get() : null, bno), HttpStatus.OK);
	}
}
```
