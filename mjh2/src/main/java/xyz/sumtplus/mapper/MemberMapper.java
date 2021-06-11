package xyz.sumtplus.mapper;

import xyz.sumtplus.domain.AuthVO;
import xyz.sumtplus.domain.MemberVO;

public interface MemberMapper {
	MemberVO read(String userid);
	
	MemberVO get(String userid);
	
	int insert(MemberVO memberVO);
	
	int insertAuth(AuthVO authVO);
	
	int update(MemberVO memberVO);
	
	int delete(String userid);
	
}
