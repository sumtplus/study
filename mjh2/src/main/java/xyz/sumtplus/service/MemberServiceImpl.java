package xyz.sumtplus.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.AuthVO;
import xyz.sumtplus.domain.MemberVO;
import xyz.sumtplus.mapper.MemberMapper;

@Log4j
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberMapper mapper;
	
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	
	@Override
	public MemberVO get(String userid) {
		return mapper.read(userid);
	}
	
	@Override
	public MemberVO get2(String userid) {
		return mapper.get(userid);
	}

	@Override
	@Transactional
	public int join(MemberVO memberVO, AuthVO authVO) {
		log.info("join....");
		memberVO.setUserpw(encoder.encode(memberVO.getUserpw()));
		log.info("MemberVO : " + memberVO);
		log.info("AuthVO : " + authVO);
		List<AuthVO> authList = new ArrayList<>();
		authList.add(authVO);
		memberVO.setAuthList(authList);
		mapper.insert(memberVO);
		
		return mapper.insertAuth(authVO);
	}

	@Override
	public boolean modify(MemberVO memberVO) {
		log.info("modify...." + memberVO);
		return mapper.update(memberVO) > 0;
	}

	@Override
	public boolean withdraw(String userid) {
		return mapper.delete(userid) > 0;
	}
	
	
	
	
}
