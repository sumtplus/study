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








