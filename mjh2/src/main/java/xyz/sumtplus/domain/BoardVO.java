package xyz.sumtplus.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
public class BoardVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	private boolean close;
	private Long hitcount;
	private Integer category;
	private Long regroup;
	private Long depth;
	private Long parentno;
	
	private int replyCnt;
	private List<BoardAttachVO> attachList = new ArrayList<BoardAttachVO>();
	
}
