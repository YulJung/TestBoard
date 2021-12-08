package com.kyj.testBoard.Controller;

import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kyj.testBoard.DTO.MemberDTO;
import com.kyj.testBoard.Service.MemberServiceInterface;

@Controller
@RequestMapping(value = "/testBoard/*")
public class MemberController {

	@Autowired
	private MemberServiceInterface ms;
	
	@RequestMapping(value="memberInsert")
	public String memberInsert() {
		return "/member/memberInsert";
	}
	@RequestMapping(value="doInsert",method = RequestMethod.POST)
	public String doInsert(@ModelAttribute MemberDTO member, Model model) {
		LocalDateTime now = LocalDateTime.now();
		
		member.setM_profile(now+"_"+member.getM_profile());
		int i = ms.insert(member);
		if(i==1) { 
			 model.addAttribute("msg","회원가입을 진심으로 환영합니다.");
	            model.addAttribute("url","/");
		}else {
			  model.addAttribute("msg","회원등록 실패");
		}
		
		return "/member/redirect";
	}
	 @RequestMapping(value="idDuplicate", method=RequestMethod.POST)
	 public @ResponseBody String idDuplicate(@RequestParam("m_id") String m_id) {
		 System.out.println("MemberController.idDuplicate() : " + m_id);
		 
		 String result = ms.idDuplicate(m_id);
		 return result; //"ok" or "no"
	 }
	 @RequestMapping(value = "delete")
	 public String deleteMember(@RequestParam("m_id")String m_id,Model model) {
		 if(m_id.equals("admin")) {
			 model.addAttribute("msg","관리자 계정은 삭제할수없습니다.");
	            model.addAttribute("url","/testBoard/admin");
	            return "member/redirect";
		 }
		 ms.delete(m_id);
		 
		 return "redirect:admin";
	 }
	 @RequestMapping(value = "updateMember")
	 public String updateMember(HttpSession session,Model model) {
		 String m_id = (String) session.getAttribute("loginId");
		 System.out.println(m_id);
		 MemberDTO myInfo = ms.select(m_id);
		 model.addAttribute("member", myInfo);
		 return "member/memberDetail";
	 }
}
