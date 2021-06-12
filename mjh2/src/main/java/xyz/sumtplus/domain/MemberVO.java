package xyz.sumtplus.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
/**
 *  TBL_MEMBER의 레코드에 대응되는 자바클래스
 */
@Data
public class MemberVO {
	private String userid; //아이디
	private String userpw; //비밀번호
	private String userName; //이름
	private String enabled; //활성화
	private String email; //이메일
	private String tel; //전화번호
	private String birthDate; //생년월일
	
	private Date regDate; //등록일
	private Date updateDate; //수정일
	private List<AuthVO> authList; //권한의 리스트
}
