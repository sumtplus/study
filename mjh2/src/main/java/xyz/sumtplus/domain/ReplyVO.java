package xyz.sumtplus.domain;

import java.util.Date;

import lombok.Data;

/**
 * TBL_REPLY의 레코드에 대응되는 자바 클래스
 */
@Data
public class ReplyVO {
	private Long rno; //댓글번호
	private Long bno; //글번호
	
	private String reply; //댓글내용
	private String replyer; //작성자
	
	private Date replyDate; //작성일
	private Date updateDate; //수정일
	
}
