package xyz.sumtplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.BoardAttachVO;
import xyz.sumtplus.domain.BoardVO;
import xyz.sumtplus.domain.Criteria;
import xyz.sumtplus.mapper.BoardAttachMapper;
import xyz.sumtplus.mapper.BoardMapper;


/**
 *	 게시판서비스 구현클래스
 */
@Service
@Log4j
@AllArgsConstructor // 생성자가 있으면 자동으로 바인딩(스프링4.3부터)
public class BoardServiceImpl implements BoardService{
	
	private BoardMapper boardMapper;
	private BoardAttachMapper boardAttachMapper;
	
	/**
	 * 게시글 등록 
	 */
	@Override
	@Transactional
	public void register(BoardVO boardVO) {
		log.info("register..." + boardVO);
		boardMapper.insertSelectKey(boardVO);
		boardVO.getAttachList().forEach(a -> {
			a.setBno(boardVO.getBno());
			boardAttachMapper.insert(a);
		});
	}
	/**
	 *  regroup이 null이면 원글등록 / 그렇지 않으면 답글등록
	 */
	@Override
	@Transactional
	public void registerChild(BoardVO boardVO) {
		log.info("registerChild..." + boardVO);
		if(boardVO.getRegroup() == null) {
			boardMapper.insertSelectKey(boardVO);
		}
		else {
			boardMapper.insertSelectKeyChild(boardVO);
		}
		boardVO.getAttachList().forEach(a -> {
			a.setBno(boardVO.getBno());
			boardAttachMapper.insert(a);
		});
	}
	/**
	 * 게시글 상세조회
	 */
	@Override
	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
		return boardMapper.read(bno);
	}
	/**
	 * 게시글 수정
	 */
	@Override
	@Transactional
	public boolean modify(BoardVO boardVO) {
		// TODO Auto-generated method stub
		log.info("modify .... " + boardVO);
		boardAttachMapper.deleteAll(boardVO.getBno());
		boardVO.getAttachList().forEach(a -> {
			a.setBno(boardVO.getBno());
			boardAttachMapper.insert(a);
		});
		return boardMapper.update(boardVO) > 0;
	}
	/**
	 * 게시글 삭제
	 */
	@Override
	@Transactional
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		boardAttachMapper.deleteAll(bno);
		return boardMapper.delete(bno) > 0;
	}
	/**
	 * 게시글 목록조회
	 */
	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("getList...");
		return boardMapper.getListWithPaging(cri);
	}
	/**
	 * 게시글 목록조회 + 페이징
	 */
	@Override
	public List<BoardVO> getList2(Criteria cri) {
		log.info("getList2...");
		return boardMapper.getListWithPaging2(cri);
	}
	/**
	 * 강의소개 목록조회
	 */
	@Override
	public List<BoardVO> getList3(Criteria cri) {
		log.info("getList3...");
		return boardMapper.getListGalley(cri);
	}
	/**
	 * 총게시글 수  
	 */
	@Override
	public int getTotal(Criteria cri) {
		return boardMapper.getTotalCount(cri);
	}
	/**
	 * 첨부파일조회
	 */
	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		log.info("getAttachList..." + bno);
		return boardAttachMapper.findBy(bno);
	}
	
}
