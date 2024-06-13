package controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.DeptService;
import vo.DeptVO;

@Controller
public class TestController {

	DeptService service;
	
	//Component속성을 가지고 있지 않아도 @Autowired만으로 생성 가능한 객체들
	@Autowired
	ServletContext app;
	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	public TestController(DeptService service) {
		this.service = service;
		System.out.println("---TestController의 생성자---");
	}
	
	@RequestMapping(value={"/", "/list.do"})
	public String deptList(Model model) {
		
		//@Autowired
		//HttpServletRequest request;
		
		//위에서 request객체를 자동으로 만들어 뒀기 때문에, 
		//앞으로는 request를 파라미터로 추가해서 사용할 필요가 없다
		//request.getRemoteAddr();
		
		List<DeptVO> list = service.deptList();
		model.addAttribute("list", list);
		return "resultDept";
	}
}
