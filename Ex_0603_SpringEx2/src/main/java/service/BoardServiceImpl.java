package service;

import java.util.List;

import dao.BoardDAO;

public class BoardServiceImpl implements BoardService{
	
	BoardDAO dao;
	
	public void setDao(BoardDAO dao) {
		this.dao = dao;
	}

	public BoardServiceImpl() {
		
	}
	
	public BoardServiceImpl(BoardDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public List selectList() {
		//과일 목록을 가져온 리스트를 반환
		return dao.selectList();
	}
}
