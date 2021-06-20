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
	public String remove(String writer, @RequestParam Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) { //기본데이터 타입은 @requestparam을 써주는 것이 좋음
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
