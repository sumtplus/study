package xyz.sumtplus.service;

import xyz.sumtplus.domain.AuthVO;
import xyz.sumtplus.domain.MemberVO;

public interface MemberService {
	MemberVO get(String userid);
	
	MemberVO get2(String userid);
	
	int join(MemberVO memberVO, AuthVO authVO);
	
	boolean modify(MemberVO memberVO);
	
	boolean withdraw(String userid);
}
