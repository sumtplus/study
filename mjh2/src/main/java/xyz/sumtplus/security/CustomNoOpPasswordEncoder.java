package xyz.sumtplus.security;

import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.log4j.Log4j;
/**
 * 별도의 PasswordEncoder를 사용하지 않기 위한 클래스
 */
@Log4j
public class CustomNoOpPasswordEncoder implements PasswordEncoder{

	@Override
	public String encode(CharSequence rawPassword) {
		log.warn("before password ... :: " + rawPassword);
		return rawPassword.toString();
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		log.warn("mathces ... :: " + rawPassword + "::" + encodedPassword);
		return rawPassword.toString().equals(encodedPassword);
	}

}
