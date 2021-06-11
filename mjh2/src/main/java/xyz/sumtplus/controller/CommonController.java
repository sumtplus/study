package xyz.sumtplus.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.AuthVO;
import xyz.sumtplus.domain.Criteria;
import xyz.sumtplus.domain.MemberVO;
import xyz.sumtplus.security.domain.CustomUser;
import xyz.sumtplus.service.BoardService;
import xyz.sumtplus.service.MemberService;

@Controller
@Log4j
public class CommonController {
	@Autowired
	private MemberService service;
	@Autowired
	private BoardService boardService;
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	@GetMapping("index")
	public void index(Model model) {
		log.info("index......");
		Criteria cri = new Criteria(2, 8, 2);
		model.addAttribute("list", boardService.getList3(cri));
	}
	
	@GetMapping("accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("aceessDenied ... " + auth);
		model.addAttribute("msg", "Access Denied (접근 거부)");
	}
	
	@GetMapping("join")
	public void join() {
		log.info("join........");
		
	}
	
	@PostMapping("join")
	public String join(MemberVO memberVO) {
		log.info("join..." + memberVO);
		AuthVO authVO = new AuthVO();
		authVO.setUserid(memberVO.getUserid());
		authVO.setAuth("ROLE_USER");
		log.info(authVO);
		service.join(memberVO, authVO);
		return "redirect:/customLogin";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("memberInfo")
	public void memberInfo() {
		log.info("memberInfo......");
	}
	
	@PreAuthorize("principal.username == #memberVO.userid")
	@PostMapping("memberInfo")
	public String memberInfo(MemberVO memberVO, HttpSession session) {
		log.info("memberInfo..." + memberVO);
		service.modify(memberVO);
		session.invalidate();
		return "redirect:/board/list";
	}
	
	@GetMapping("passwordChk")
	public void passwordChk() {
		log.info("passwordChk");
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("passwordChk")
	public String passwordChk(Authentication auth, String userpw) {
		log.info("passwordChk..." + userpw);
		CustomUser user = (CustomUser) auth.getPrincipal();
		log.info("CustomUser : " + user);
		
		if(!encoder.matches(userpw, user.getVo().getUserpw())) {
			return "redirect:/board/list";
		}
		return "redirect:/memberInfo";
	}
	
	@PostMapping("withdraw")
	public String withdraw(String userid, HttpSession session) {
		session.invalidate();
		log.info("withdraw..." + userid);
		service.withdraw(userid);
		return "redirect:/board/list";
	}
//	@PostMapping("passwordChk")
//	public String passwordChk(MemberVO memberVO) {
//		log.info("passwordChk..." + memberVO);
//		encoder.matches(rawPassword, encodedPassword);
//		MemberVO result = service.get2(memberVO.getUserid());
//		String password = encoder.encode(memberVO.getUserpw());
//		log.info("result : " + result);
//		log.info("password : " + password);
//		if(result.getUserpw() != password) {
//			return "redirect:/board/list";
//		}
//		return "redirect:/memberInfo";
//	}
	
	@GetMapping("customLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info("error :: " + error);
		log.info("logout :: " + logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if(logout != null) {
			model.addAttribute("logout", "logout!!!");
		}
	}
	
	@GetMapping("/customLogout")
	public void logoutGet() {
		log.info("custom logout");
	}
	
	@PostMapping("/customLogout")
	public void logoutPost(HttpServletRequest req) {
		log.warn("post custom logout");
	}
}
