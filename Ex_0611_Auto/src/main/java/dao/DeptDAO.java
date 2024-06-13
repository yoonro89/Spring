package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.DeptVO;

//@Component
//	ㄴ@Controller
//	ㄴ@Service
//	ㄴ@Repository
@Repository("dept_dao")
public class DeptDAO {
	
	SqlSession sqlSession;

	//자동연결
	@Autowired
	public DeptDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("---DeptDAO생성자---");
	}
	
	public List<DeptVO> selectList(){
		List<DeptVO> list = sqlSession.selectList("d.dept_list");
		return list;
	}
}
