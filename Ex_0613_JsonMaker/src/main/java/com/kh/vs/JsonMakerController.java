package com.kh.vs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import vo.PersonVO;

@Controller
public class JsonMakerController {

	@RequestMapping("/vo_to_json.do")
	@ResponseBody
	public PersonVO vo_to_json() {
		PersonVO p = new PersonVO();
		p.setName("홍길동");
		p.setAge(20);
		p.setAddr("서울시 관악구");
		return p;
	}
	
}
