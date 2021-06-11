package xyz.sumtplus.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import xyz.sumtplus.domain.BoardVO;
import xyz.sumtplus.domain.Criteria;

public interface BoardMapper {
	
//	@Select("SELECT * FROM TBL_BOARD WHERE BNO > 0")
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public List<BoardVO> getListWithPaging2(Criteria cri);
	
	public List<BoardVO> getListGalley(Criteria cri);
	
	public void insert(BoardVO boardVO);
	public void insertSelectKey(BoardVO boardVO);
	public void insertSelectKeyChild(BoardVO boardVO);
	
	public BoardVO read(Long bno);

	public Map<String, Object> read2(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO boardVO);
	
	public int getTotalCount(Criteria cri);
	
	@Update("UPDATE TBL_BOARD SET REPLYCNT = REPLYCNT + #{amount} WHERE BNO = #{bno}")
	void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
}
