package xyz.sumtplus.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Criteria {
	private Integer pageNum = 1;
	private Integer amount = 10;
	private Integer category = 1;
	
	private String type;
	private String keyword;
	
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
	
	public String[] getTypeArr() {
		return type == null ? new String[]{} : type.split("");
		// "ABCD".split("") -> {"A","B","C","D"}
	}
	
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
