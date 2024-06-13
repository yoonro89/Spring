package com.kh.vs;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.Common;
import dao.VisitDAO;
import vo.VisitVO;

@Controller
public class VisitController {
	
	@Autowired
	ServletContext app;
	@Autowired
	HttpServletRequest request;
	
	VisitDAO visit_dao;
	
	public void setVisit_dao(VisitDAO visit_dao) {
		this.visit_dao = visit_dao;
	}
	
	//전체목록 보기
	@RequestMapping(value={"/", "list.do"})
	public String list(Model model) {
		
		List<VisitVO> list = visit_dao.selectVisit();
		model.addAttribute("list", list);
		return Common.Visit.VIEW_PATH + "visit_list.jsp";
	}
	
	//새 글 입력 폼
	@RequestMapping("/insert_form.do")
	public String insert_form() {
		return Common.Visit.VIEW_PATH + "visit_insert_form.jsp";
	}
	
	//새 글 추가
	@RequestMapping("/insert.do")
	public String insert(VisitVO vo) {
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		
		//비밀번호 암호화를 위한 클래스 호출
		String encodePwd = Common.SecurePwd.encodePwd(vo.getPwd());
		vo.setPwd(encodePwd);//암호화된 비밀번호로 vo객체 갱신
		
		//절대경로만 생성
		String webPath = "/resources/upload/";
		//upload까지의 절대경로를 가져온다
		String savePath = app.getRealPath(webPath);
		System.out.println(savePath);
		
		//업로드 된 파일 정보
		MultipartFile photo = vo.getPhoto();
		
		String filename = "no_image";
		if( !photo.isEmpty() ) {
			//업로드 된 실제 파일명
			filename = photo.getOriginalFilename();
			
			//파일을 저장할 경로 생성
			File saveFile = new File(savePath, filename);
			
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			}else {
				//동일파일명이 존재하는 경우 업로드시간을 추가하여 중복을 방지하자
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}
			//절대경로에 있는 같은 이름의 파일이 있을 경우 실제 photo로 교체
			try {
				photo.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		vo.setFilename(filename);
		visit_dao.insert(vo);
		return "redirect:list.do";
	}
	
	//글 삭제 요청
	@RequestMapping("/delete.do")
	@ResponseBody
	public String delete(VisitVO vo) {
		
		boolean isValid = Common.SecurePwd.decodePwd(vo, visit_dao);
		
		if(isValid) {
			//실제 삭제
			int res_del = visit_dao.delete(vo.getIdx());
			if(res_del > 0) {
				//삭제성공
				return "[{'result':'clear'}]";
			}else {
				//삭제실패
				return "[{'result':'fail'}]";
			}
			
		}else {
			//비밀번호가 일치하지 않는다면
			return "[{'result':'no'}]";
		}
	}
	
	//글 수정 폼
	@RequestMapping("update_check.do")
	@ResponseBody
	public String update_check(VisitVO vo) {
		
		boolean isValid = Common.SecurePwd.decodePwd(vo, visit_dao);
		
		if(isValid) {
			//비밀번호가 일치하므로, 수정form으로 이동
			String resIdx = String.format("[{'result':'clear', 'idx':'%d'}]", vo.getIdx());
			return resIdx;
		}else {
			//비밀번호 불일치
			return "[{'result':'no'}]";
		}
		
	}
	
	//글 수정 폼으로 이동
	@RequestMapping("update_form.do")
	public String update_form(int idx, Model model) {
		VisitVO vo = visit_dao.selectOne(idx);
		model.addAttribute("vo", vo);
		return Common.Visit.VIEW_PATH + "visit_update_form.jsp";
	}
	
	//글 수정
	@RequestMapping("/modify.do")
	@ResponseBody
	public String modify(VisitVO vo) {
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		
		//비밀번호 암호화
		String encodePwd = Common.SecurePwd.encodePwd(vo.getPwd());
		vo.setPwd(encodePwd);
		
		int res = visit_dao.update(vo);
		
		if(res > 0) {
			return "[{'result':'clear'}]";
		}else {
			return "[{'result':'fail'}]";
		}
	}
}
