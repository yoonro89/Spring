package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.DeptDAO;
import vo.DeptVO;

@Controller
public class DeptController {
	
	public static final String VIEW_PATH = "/WEB-INF/views/dept/";
	
	DeptDAO dept_dao;
	public DeptController(DeptDAO dept_dao) {
		this.dept_dao = dept_dao;
	}	
	
	@RequestMapping(value={"/", "/list.do"})
	public String list(Model model) {
		
		//dao로부터 부서목록 가져오기
		List<DeptVO> list = dept_dao.selectDept();
		model.addAttribute("list", list);
		return VIEW_PATH + "dept_list.jsp";
	}
	
	//새 글 추가를 위한 form으로 화면 전환
	@RequestMapping("insert_form.do")
	public String insertForm() {
		return VIEW_PATH + "insert_form.jsp";
	}
	
	//새 부서 등록
	@RequestMapping("insert.do")
	public String insertDept(DeptVO vo) {
		//insert.do?deptno=60&dname=원예부&loc=606
		dept_dao.insert(vo);
		
		//jsp였다면 => response.sendRedirect("list.do")
		return "redirect:list.do";
	}
	
	//부서 삭제
	@RequestMapping("del_dept.do")
	public String deleteDept(int deptno) {
		dept_dao.delete(deptno);
		
		return "redirect:list.do";
	}
	
	//부서 수정을 위한 form으로 화면 전환
	@RequestMapping("modify_form.do")
	public String modifyForm(Model model, int deptno) {
		DeptVO vo = dept_dao.selectOne(deptno);
		model.addAttribute("vo", vo);
		return VIEW_PATH + "modify_form.jsp";
	}
	
	//부서 수정
	@RequestMapping("modify.do")
	@ResponseBody //어노테이션ResponseBody가 있어야, Ajax로 요청받은 메서드의 return값을 콜백메서드로 전달할 수 있다. 
	public String modifyDept(DeptVO vo, int c_deptno) {
		Map<String, Object> map = new HashMap<String, Object>();
		//수정에 필요한 정보인 vo와 c_deptno를 map에 저장
		map.put("vo", vo);
		map.put("c_deptno", c_deptno);
		int res = dept_dao.modify(map);
		
		String result = "no";
		if( res > 0 ) {
			result = "yes";
		}
		
		//콜백메서드로 최종 결과값 전달
		return result;
	}
	
}
