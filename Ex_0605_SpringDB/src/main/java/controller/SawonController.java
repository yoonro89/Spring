package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.SawonDAO;
import vo.SawonVO;

@Controller
public class SawonController {
	
	public static final String VIEW_PATH = "/WEB-INF/views/sawon/";
	
	SawonDAO sawon_dao;
	public SawonController(SawonDAO sawon_dao) {
		this.sawon_dao = sawon_dao;
	}	
	
	//첫 화면 '/'랑 'list.do' 2개로 설정
	@RequestMapping(value={"/", "/list.do"})
	public String list(Model model) {
		
		List<SawonVO> list = sawon_dao.selectSawon();
		model.addAttribute("list", list);
		return VIEW_PATH + "sawon_list.jsp";
	}
	
	//추가를 위한 form으로 이동
	@RequestMapping("insert_form.do")
	public String insertForm() {
		return VIEW_PATH + "insert_form.jsp";
	}
	
	//등록
	@RequestMapping("insert.do")
	public String inserSawon(SawonVO vo) {
		sawon_dao.insert(vo);
		return "redirect:list.do";
	}
	
	//삭제
	@RequestMapping("del_sawon.do")
	public String deleteDept(int sabun) {
		sawon_dao.delete(sabun);
		
		return "redirect:list.do";
	}
	
	//수정을 위한 form으로 이동
	@RequestMapping("modify_form.do")
	public String modifyForm(Model model, int sabun) {
		SawonVO vo = sawon_dao.selectOne(sabun);
		model.addAttribute("vo", vo);
		return VIEW_PATH + "modify_form.jsp";
	}
	
	//수정
	@RequestMapping("modify.do")
	@ResponseBody	//★☆콜백메서드로 받으려면... 아무튼 매우 중요☆★ 
	public String modifySawon(SawonVO vo, int m_sabun) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vo", vo);
		map.put("m_sabun", m_sabun);
		int res = sawon_dao.modify(map);
		
		String result = "no";
		if( res > 0 ) {
			result = "yes";
		}
				
		return result;
	}
	
}
