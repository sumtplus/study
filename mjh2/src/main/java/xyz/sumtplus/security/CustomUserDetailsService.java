package xyz.sumtplus.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.MemberVO;
import xyz.sumtplus.mapper.MemberMapper;
import xyz.sumtplus.security.domain.CustomUser;

@Log4j
@Data
public class CustomUserDetailsService implements UserDetailsService{
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn(username);
		
		MemberVO vo = memberMapper.read(username);
		
		log.warn("member mapper's vo :: " + vo);
		return vo == null ? null : new CustomUser(vo);
	}

	
}
