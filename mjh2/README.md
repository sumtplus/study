# MIN SCHOOL
### 1. 소개 <br>
스프링프레임워크를 이용하여 처음으로 개발한 회원제 게시판입니다. 부트스트랩을 이용하여 온라인 강의를 소개하는 사이트를 테마로 했습니다. 코로나 시대에 비대면 교육이 필수가 되면서, 학생들은 온라인으로 강의를 들어야 하는 경우가 늘어나고 있습니다. 특히 취업에 대한 강좌들이 수요가 높은데, 그래서 저는 자격증이나 공무원 그리고 IT 강좌들을 한 사이트에 모아서 쉽게 정보를 제공하고 싶어서 해당 사이트를 제작했습니다. 또한 이 공간이 직접 만나기 힘든 강사와 학생 간의 소통의 장이 되어 온라인 수업의 단점을 보완 할 수 있기를 바랐습니다. 그리고 비슷한 목적을 가진 학생들끼리 웹 상에서 만나 고민과 경험을 나누고 조언을 구할 수 있는 공간을 제공하고자 했습니다.   
### 2. 기능
* 회원 : 스프링 시큐리티를 이용하여 로그인 처리. 회원가입, 회원정보수정, 탈퇴추가
* 강의정보 : 게시판 카테고리를 나누어 취업에 관련된 다양한 강좌들을 사진과 함께 소개
* 커뮤니티 : 기본적인 CRUD가 가능한 게시판이며, ajax를 이용한 댓글 비동기 처리, 오라클 계층형쿼리를 이용한 답글 기능 추가
* 첨부파일 : MultiPart를 이용하여 파일업로드/다운로드 처리, 이미지는 썸네일 표시
### 3. 사용프로그램
* 사용언어 : JAVA, HTML, CSS, JAVASCRIPT, SQL
* 사용도구 : eclipse, spring framework, JDK 1.8
* 데이터베이스 : Oracle Database 11g Enterprise Edition, SQLDeveploper
* 서버 : Apach tomcat 9.0 , nginx
* 기타 : AWS, SVN, GIT
### 4. 테이블설계도
<img src="https://user-images.githubusercontent.com/78586159/122665130-68704600-d1e0-11eb-947e-210015386163.png" width="535px" height="377px"></img><br>
회원제 게시판을 만들기 위해 총 6개의 테이블을 생성했습니다. 테이블은 게시판, 파일첨부, 댓글, 회원, 권한, 자동로그인이 있습니다. 파일첨부와 댓글은 게시판의 글번호를 참조하고 있고, 권한은 회원을 참조하고 있습니다. 게시판 테이블에는 답글형게시판을 위한 추가 컬럼이 들어가 있습니다. 회원과 권한, 자동로그인은 스프링시큐리티에 맞게 테이블을 구성하였습니다.
* TBL_BOARD(게시판) : BNO 글번호(PK), TITLE 제목, CONTENT 내용, WRITER 작성자, REPLYCNT 댓글수, REGROUP 조상글번호, DEPTH 답글깊이, PARENTNO 부모글번호, HITCOUNT 조회수, CATEGORY 게시판번호, CLOSE 비공개
* TBL_REPLY(댓글) : RNO 댓글번호(PK), BNO (FK), REPLY 댓글내용 REPLYER 작성자
* TBL_ATTACH(파일첨부) : UUID 파일명(PK), UPLOADPATH 경로, FILENAME 실제파일명, IMAGE 이미지여부, BNO (FK)
* TBL_MEMBER(회원) : USERID 아이디 (PK), USERPW 비밀번호, USERNAME 이름, ENABLE 활성화 
### 5. VO/DTO 구성
기본적으로 테이블과 대응되는 자바의 클래스들이 있습니다. BoardVO(게시판), BoardAttachVO(첨부파일, AttachFileDTO를 상속), ReplyVO(댓글), MemberVO(회원), AuthVO(권한)   
페이징, 검색처리를 위한 클래스가 있습니다. Criteria(기준), PageDTO, ReplyPageDTO(PageDTO를 상속)
##### BoardVO
```java
package xyz.sumtplus.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import lombok.Data;

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
```
##### BoardAttachVO
```java
package xyz.sumtplus.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	private String fileName; //실제파일명
	private String uploadPath; //경로
	private String uuid; //파일명
	private boolean image; //이미지여부
	// 다운로드 경로를 반환하는 메서드
	public String getDownPath() {
		return uploadPath + "/" + uuid + "_" + fileName;
	}
	// 이미지 경로를 반환하는 메서드
	public String getThumbPath() {
		return uploadPath + "/s_" + uuid + "_" + fileName;
	}
}
```
