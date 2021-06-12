package xyz.sumtplus.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
/**
 * TBL_ATTACH의 레코드에 대응되는 자바 클래스
 * 
 */
@Getter
@Setter
@ToString(callSuper=true)
public class BoardAttachVO extends AttachFileDTO{
	private Long bno; //글번호
}
