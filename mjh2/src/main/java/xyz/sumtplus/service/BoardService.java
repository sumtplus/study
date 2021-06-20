package xyz.sumtplus.service;

import java.util.List;

import xyz.sumtplus.domain.BoardAttachVO;
import xyz.sumtplus.domain.BoardVO;
import xyz.sumtplus.domain.Criteria;

/**
 *	게시판서비스 인터페이스
 */
public interface BoardService {
	void register(BoardVO boardVO); // 글 등록

	void registerChild(BoardVO boardVO); // 답글 등록 
	
	BoardVO get(Long bno); // 상세 조회
	
	boolean modify(BoardVO boardVO); // 글 수정
	
	boolean remove(Long bno); // 글 삭제
	
	List<BoardVO> getList(Criteria cri); // 페이징 처리가 된 목록 조회
	
	List<BoardVO> getList2(Criteria cri); // 페이징 처리 + 답글목록 조회
	
	List<BoardVO> getList3(Criteria cri); // 강의소개 조회
	
	int getTotal(Criteria cri); // 총 페이지 수 
	
	List<BoardAttachVO> getAttachList(Long bno); // 첨부파일 목록
}
