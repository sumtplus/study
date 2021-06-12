package xyz.sumtplus.domain;

import lombok.Data;
/**
 * TBL_MEMBER_AUTH에 대응되는 자바클래스
 */
@Data
public class AuthVO {
	private String userid; //아이디
	private String auth; //권한명
}
