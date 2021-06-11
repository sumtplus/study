package xyz.sumtplus.service;

import java.util.List;

import xyz.sumtplus.domain.BoardAttachVO;
import xyz.sumtplus.domain.BoardVO;
import xyz.sumtplus.domain.Criteria;

public interface BoardService {
	// 인터페이스 앞에 퍼블릭이 붙으면 메서드들은 모두 퍼블릭이 됨
	void register(BoardVO boardVO); // 글 등록
	// 답글 등록
	void registerChild(BoardVO boardVO); 
	
	BoardVO get(Long bno); // 상세 조회
	
	boolean modify(BoardVO boardVO); // 글 수정
	
	boolean remove(Long bno); // 글 삭제
	
//	List<BoardVO> getList(); // 목록 조회
	List<BoardVO> getList(Criteria cri); // 페이징 처리가 된 목록 조회
	
	// 페이징 처리 + 답글목록 조회
	List<BoardVO> getList2(Criteria cri);
	
	List<BoardVO> getList3(Criteria cri);
	
	int getTotal(Criteria cri);
	
	List<BoardAttachVO> getAttachList(Long bno);
}
