package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.SawonVO;

public class SawonDAO {
	
	SqlSession sqlSession;
	public SawonDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//목록 불러오기
	public List<SawonVO> selectSawon(){
		List<SawonVO> list = sqlSession.selectList("s.sawon_list");
		return list;
	}
	
	//추가
	public int insert( SawonVO vo) {
		int res = sqlSession.insert("s.sawon_insert", vo);
		return res;
	}
	
	//삭제
	public int delete( int sabun ) {
		int res = sqlSession.delete("s.sawon_delete", sabun);
		return res;
	}
	
	//수정폼이동
	public SawonVO selectOne(int sabun){
		SawonVO vo = sqlSession.selectOne("s.select_one", sabun);
		return vo;
	}
	
	//정보수정
	public int modify( Map<String, Object> map) {
		int res = sqlSession.update("s.sawon_update", map);
		return res;
	}
}
