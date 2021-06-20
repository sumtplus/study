package xyz.sumtplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.Criteria;
import xyz.sumtplus.domain.ReplyPageDTO;
import xyz.sumtplus.domain.ReplyVO;
import xyz.sumtplus.mapper.BoardMapper;
import xyz.sumtplus.mapper.ReplyMapper;
/**
 * 댓글서비스 구현클래스
 */
@Service
@AllArgsConstructor
@Log4j
@Transactional
public class ReplyServiceImpl implements ReplyService{
	private BoardMapper boardMapper;
	private ReplyMapper replyMapper;
	/**
	 * 댓글 등록
	 */
	@Override
	public int register(ReplyVO vo) {
		log.info("register :: " + vo);
		boardMapper.updateReplyCnt(vo.getBno(), 1);
		return replyMapper.insert(vo);
	}
	/**
	 * 댓글 상세조회
	 */
	@Override
	public ReplyVO get(Long rno) {
		log.info("get :: " + rno);
		return replyMapper.read(rno);
	}
	/**
	 * 댓글 수정
	 */
	@Override
	public int modify(ReplyVO vo) {
		log.info("modify :: " + vo);
		return replyMapper.update(vo);
	}
	/**
	 * 댓글 삭제
	 */
	@Override
	public int remove(Long rno) {
		log.info("remove :: " + rno);
		boardMapper.updateReplyCnt(get(rno).getBno(), -1);
		return replyMapper.delete(rno);
	}
	/**
	 * 댓글 목록
	 */
	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		log.info("remove :: " + bno + " :: " + cri);
		return replyMapper.getListWithPaging(cri, bno);
	}
	/**
	 * 댓글페이지클래스 반환
	 */
	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		return new ReplyPageDTO(
				cri,
				replyMapper.getTotalCount(cri, bno),
				replyMapper.getListWithPaging(cri, bno));
	}
	/**
	 * 댓글 더보기
	 */
	@Override
	public List<ReplyVO> getListMore(Long rno, Long bno) {
		return replyMapper.getListWithShowMore(rno, bno);
	}
	
}








