package xyz.sumtplus.domain;

import lombok.Data;
/**
 * 페이징 처리를 위한 클래스 
 */
@Data
public class PageDTO {
	private int startPage; //시작페이지
	private int endPage; //끝페이지
	private int realEnd; //진짜 끝페이지
	private boolean prev; //이전
	private boolean next; //다음
	
	private int total; //전체 데이터 수
	private Criteria cri;
	
	// 생성자
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		// 페이지번호로 끝페이지와 시작페이지 계산
		// ex) pageNum = 13이면 endPage = 20, startPage = 11 
		endPage = (cri.getPageNum() + 9) / 10 * 10;
		startPage = endPage - 9;
		// 전체데이터수로 realEnd 계산
		realEnd = (total + 9) / 10;
		// 끝페이지가 realEnd보다 크면 realEnd 반환
		endPage = realEnd < endPage ? realEnd : endPage;
		// 이전은 시작번호가 1보다 큰 경우에 존재
		prev = startPage > 1;
		// 다음은 realEnd가 끝번호보다 큰 경우에만 존재
		next = endPage < realEnd;
	}
}
