package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;

public class BoardDAO {
	
	SqlSession sqlSession;
	
	
	private BoardDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//전체 게시글 조회
	public List<BoardVO> selectList(Map<String, Object> map){
		List<BoardVO> list = sqlSession.selectList("b.board_list", map);
		return list;
	}
	
	//새 글 추가
	public int insert(BoardVO vo) {
		int list = sqlSession.insert("b.board_insert", vo);
		return list;
	}
	
	//상세보기를 위한 게시글 조회
	public BoardVO selectOne(int idx) {
		BoardVO vo = sqlSession.selectOne("b.board_one", idx);
		return vo;
	}
	
	public int update_readhit(int idx) {
		int res = sqlSession.update("b.board_update_readhit", idx);
		return res;
	}
	
	//댓글작성을 위한 자리 확보
	public int update_step(BoardVO baseVO) {
		int res = sqlSession.update("b.board_update_step", baseVO);
		return res;
	}
	
	//댓글 추가
	public int reply(BoardVO vo) {
		int res = sqlSession.insert("b.board_reply", vo);
		return res;
	}
	
	//게시글 삭제(된 것처럼 수정)
	public int del_update(int idx) {
		int res = sqlSession.update("b.board_del_upd", idx);
		return res;
	}
	
	//전체 게시글 수
	public int getRowTotal(Map<String, Object> map) {
		int count = sqlSession.selectOne("b.board_count", map);
		return count;
	}
}
