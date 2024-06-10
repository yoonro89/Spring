package com.kh.mvc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import util.Commons;

@Controller
public class TestController {
	
	@RequestMapping("/test2.do")
	public ModelAndView test2(HttpServletRequest request) {
		
		String[] sido = {"서울", "경기", "제주"};
		String ip = request.getRemoteAddr();
		
		//데이터(sido, ip)와 뷰(test2.jsp)정보를 하나로 묶어서 저장
		ModelAndView mv = new ModelAndView();
		mv.addObject("sido", sido);
		mv.addObject("ip", ip);
		mv.setViewName(Commons.Dept.VIEW_PATH + "test2.jsp");
		
		return mv;
		
	}
	
	@RequestMapping("/test.do")
	public String test(Model model, HttpServletRequest request) {
		
		String[] fruit = {"사과", "오렌지", "바나나"};
		
		String ip = request.getRemoteAddr();
		request.setAttribute("msg", fruit);
		request.setAttribute("ip", ip);
		//model.addAttribute("msg", fruit);//바인딩
		
		return Commons.Dept.VIEW_PATH + "test.jsp";//포워딩
	}
}
