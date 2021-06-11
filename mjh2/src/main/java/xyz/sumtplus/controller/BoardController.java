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

@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {
	@Autowired
	private BoardService service;
	
	@GetMapping("list")
	public void list(Criteria cri, Model model) {
		log.info("list....");
		model.addAttribute("list",service.getList2(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}
	
	@GetMapping("courseList")
	public void courseList(Criteria cri, Model model) {
		log.info("courseList......");
		cri.setCategory(2);
		cri.setAmount(8);
		model.addAttribute("list",service.getList3(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}
	
	//@PreAuthorize("isAuthenticated()")
	@GetMapping({"get","modify","get2"})
	public void get(@RequestParam Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("get or modify....");
		model.addAttribute("board",service.get(bno));
		model.addAttribute("cri",cri);
	}
	
//	@GetMapping("get2")
//	public void get2() {
//		log.info("get2....");
//	}
	/*
	@GetMapping("register")
	public void register() {
		log.info("register....");
		
	}
	*/
	@PreAuthorize("isAuthenticated()")
	@GetMapping("register")
	public void register(@RequestParam(defaultValue="0") Long bno, Model model) {
		if(bno == 0) {
			log.info("register.......");
			log.info("boardVO : " + service.get(bno));
		}
		else {
			log.info("answer....");
			log.info("regroup : " + service.get(bno).getRegroup());
			model.addAttribute("board", service.get(bno));
		}
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("register")
	public String register(BoardVO boardVO, RedirectAttributes rttr) {
		log.info("register....");
		log.info(boardVO);
		//boardVO.getAttachList().forEach(log::info);
		service.registerChild(boardVO);
		rttr.addFlashAttribute("result", boardVO.getBno()); // 1회성사용
		
		return "redirect:/board/list";
	}
	
	/*
	@PostMapping("registerChild")
	public String registerChild(BoardVO boardVO, RedirectAttributes rttr) {
		log.info("register....");
		log.info(boardVO);
		//boardVO.getAttachList().forEach(log::info);
		service.register(boardVO);
		rttr.addFlashAttribute("result", boardVO.getBno()); // 1회성사용
		
		return "redirect:/board/list";
	}
	*/
	@PreAuthorize("principal.username == #boardVO.writer")
	@PostMapping("modify")
	public String modify(BoardVO boardVO, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify....");
		log.info(boardVO);
		boardVO.getAttachList().forEach(log::info);
		if(service.modify(boardVO)) {
			rttr.addFlashAttribute("result", "success");
		};
//		rttr.addAttribute("pageNum",cri.getPageNum()); //리다이렉트 어트리뷰트는 포워드를 통해서값을 담는 것이 아님
//		rttr.addAttribute("amount",cri.getAmount());
		return "redirect:/board/list" + cri.getListLink();
	}
	@PreAuthorize("principal.username == #writer")
	@PostMapping("remove")
	public String remove(String writer, @RequestParam Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) { //기본데이터 타입은 @requestparam을 써주는 것이 좋음
		log.info("remove....");
		
		List<BoardAttachVO> list = service.getAttachList(bno);
		
		if(service.remove(bno)) {
			deleteFiles(list);
			rttr.addFlashAttribute("result", "success");
		};
//		rttr.addAttribute("pageNum",cri.getPageNum()); 
//		rttr.addAttribute("amount",cri.getAmount());
		return "redirect:/board/list" + cri.getListLink();
	}
	
	@ResponseBody
	@GetMapping("getAttachList")
	public List<BoardAttachVO> getAttachList(Long bno) {
		log.info("getAttachList... " + bno);
		return service.getAttachList(bno);
		
	}
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		log.info("deleteFiles............");
		log.info(attachList);
		
		attachList.forEach(attach-> {
			new File(UploadController.UPLOAD_PATH, attach.getDownPath()).delete();
			if(attach.isImage()) {
				new File(UploadController.UPLOAD_PATH, attach.getThumbPath()).delete();
			}
		});
	}
}
