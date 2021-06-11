package xyz.sumtplus.controller;


import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample")
@Log4j
public class SampleController {
	@GetMapping("all")
	public void doAll() {
		
	}
	
	@GetMapping("member")
	public void doMember() {
		
	}
	
	@GetMapping("admin")
	public void doAdmin() {
		
	}
	
	@PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')")
	@GetMapping("annoMember")
	public void doMember2() {
		log.info("doMember2()...");
	}
	
	@Secured("ROLE_ADMIN")
	@GetMapping("annoAdmin")
	public void doAdmin2() {
		log.info("doAdmin2()...");
	}
	
}

















