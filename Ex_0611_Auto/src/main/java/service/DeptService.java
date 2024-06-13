package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.DeptDAO;
import vo.DeptVO;

@Service
public class DeptService {

	//@Repository("dept_dao")이름을 같게 만든다
	DeptDAO dept_dao;
	
	@Autowired
	public DeptService(DeptDAO dept_dao) {
		this.dept_dao = dept_dao;
		System.out.println("---DeptService()의 생성자---");
	}
	
	public List<DeptVO> deptList(){
		List<DeptVO> list = dept_dao.selectList();
		return list;
	}
}
