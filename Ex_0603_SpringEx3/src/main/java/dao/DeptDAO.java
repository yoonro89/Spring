package dao;

import java.util.ArrayList;
import java.util.List;

import vo.DeptVO;

public class DeptDAO {
	
	public List<DeptVO> selectDeptList(){
		
		//DB에서 부서목록을 가져왔다고 가정
		List<DeptVO> list = new ArrayList<DeptVO>();
		list.add( new DeptVO(10, "영업부", 101) );
		list.add( new DeptVO(20, "사업부", 202) );
		list.add( new DeptVO(30, "관리부", 303) );
		list.add( new DeptVO(40, "경리부", 404) );
		list.add( new DeptVO(50, "총무부", 505) );
		
		return list;
	}
	
}
