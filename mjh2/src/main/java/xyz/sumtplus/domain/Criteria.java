package xyz.sumtplus.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
/**
 * 검색의 기준
 * 페이징처리와 게시판카테고리 분류, 검색을 처리하기 위한 클래스
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Criteria {
	private Integer pageNum = 1; //페이지번호
	private Integer amount = 10; //한 페이지당 데이터수
	private Integer category = 1; //게시판번호
	
	private String type; //검색조건
	private String keyword; //키워드
	
	public Criteria(Integer pageNum, Integer amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public Criteria(Integer pageNum, Integer amount, Integer category) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
		this.category = category;
	}
	
	// 검색조건을 배열로 변환하는 메서드
	public String[] getTypeArr() {
		return type == null ? new String[]{} : type.split("");
		// ex) "ABCD".split("") -> {"A","B","C","D"}
	}
	
	/**
	 *	uri를 생성하기 위한 메서드 
	 */
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", pageNum)
				.queryParam("amount", amount)
				.queryParam("type", type)
				.queryParam("keyword", keyword);
		return builder.toUriString();
	}
	
	public String getListLink2() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("amount", amount)
				.queryParam("type", type)
				.queryParam("keyword", keyword);
		return builder.toUriString();
	}
	
	public String getListLink3() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", pageNum)
				.queryParam("type", type)
				.queryParam("keyword", keyword);
		return builder.toUriString();
	}
}
