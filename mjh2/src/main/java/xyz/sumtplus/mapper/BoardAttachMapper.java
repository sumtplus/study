package xyz.sumtplus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import xyz.sumtplus.domain.BoardAttachVO;

public interface BoardAttachMapper {
	void insert(BoardAttachVO vo);
	
	void delete(String uuid);
	
	List<BoardAttachVO> findBy(Long bno);
	
	@Delete("DELETE TBL_ATTACH WHERE BNO = #{bno}")
	void deleteAll(Long bno);
	
	@Delete("DELETE TBL_ATTACH")
	void deleteAllComplete();
	
	@Select("SELECT * FROM TBL_ATTACH WHERE UPLOADPATH = TO_CHAR(SYSDATE - 1, 'YYYY/MM/DD')")
	List<BoardAttachVO> getOldFiles();
}
