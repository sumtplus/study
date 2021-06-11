package xyz.sumtplus.service;

import java.util.List;

import xyz.sumtplus.domain.Criteria;
import xyz.sumtplus.domain.ReplyPageDTO;
import xyz.sumtplus.domain.ReplyVO;

public interface ReplyService {
	int register(ReplyVO vo);
	
	ReplyVO get(Long rno);
	
	int modify(ReplyVO vo);
	
	int remove(Long rno);
	
	List<ReplyVO> getList(Criteria cri, Long bno);
	
	ReplyPageDTO getListPage(Criteria cri, Long bno);
	
	List<ReplyVO> getListMore(Long rno, Long bno);
}
