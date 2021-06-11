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

@Service
@Log4j
@AllArgsConstructor // 생성자가 있으면 자동으로 바인딩(스프링4.3부터)
public class BoardServiceImpl implements BoardService{
	
	private BoardMapper boardMapper;
	private BoardAttachMapper boardAttachMapper;
	
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

	@Override
	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
		return boardMapper.read(bno);
	}

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

	@Override
	@Transactional
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		boardAttachMapper.deleteAll(bno);
		return boardMapper.delete(bno) > 0;
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("getList...");
		return boardMapper.getListWithPaging(cri);
	}
	
	@Override
	public List<BoardVO> getList2(Criteria cri) {
		log.info("getList2...");
		return boardMapper.getListWithPaging2(cri);
	}
	
	@Override
	public List<BoardVO> getList3(Criteria cri) {
		log.info("getList3...");
		return boardMapper.getListGalley(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return boardMapper.getTotalCount(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		log.info("getAttachList..." + bno);
		return boardAttachMapper.findBy(bno);
	}

	
	
	
	
}
