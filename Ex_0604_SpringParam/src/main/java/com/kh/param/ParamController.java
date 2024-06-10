package com.kh.param;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vo.PersonVO;

@Controller
public class ParamController {
	public static final String VIEW_PATH = "/WEB-INF/views/person/";
	
	@RequestMapping(value={"/", "insert_form.do"})
	public String insert_form() {
		
		return VIEW_PATH + "insert_form.jsp";
		
	}
	
	//send1() 처리
	@RequestMapping("insert1.do")
	public String insert1(Model model, String name, int age, String pwd) {
		//insert.do?name=홍길동&age=20&pwd=1111
		//name, age, pwd변수로 같은 이름의 파라미터 값이 자동으로 저장된다
		
		PersonVO vo = new PersonVO();
		vo.setName(name);
		vo.setAge(age);
		vo.setPwd(pwd);
		
		model.addAttribute("vo", vo);
		
		return VIEW_PATH + "insert_result.jsp";
	}
	
	@RequestMapping("insert2.do")
	public String insert2(Model model, PersonVO vo) {
		//insert.do?name=홍길동&age=20&pwd=1111
		//파라미터로 넘어온 값을 vo에 속성이 일치하는 변수에 자동으로 세팅(vo안에 반드시 setter가 존재해야함)
		
		model.addAttribute("vo", vo);
		return VIEW_PATH + "insert_result.jsp";
	}
	
}
