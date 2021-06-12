package xyz.sumtplus.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Data;

/**
 *  TBL_BOARD의 레코드에 대응되는 자바 클래스
 */
@Data
public class BoardVO {
	private Long bno; //글번호
	private String title; //제목
	private String content; //내용
	private String writer; //작성자
	private Date regdate; //작성일
	private Date updateDate; //수정일
	private boolean close; //비공개여부
	private Long hitcount; //조회수
	private Integer category; //게시판번호
	private Long regroup; //조상글번호
	private Long depth; //댓글깊이
	private Long parentno; //부모글번호

	private int replyCnt; //댓글수
	private List<BoardAttachVO> attachList = new ArrayList<BoardAttachVO>(); //첨부파일목록
	
}
