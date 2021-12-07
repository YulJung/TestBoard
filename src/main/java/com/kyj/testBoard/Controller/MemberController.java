package com.kyj.testBoard.Controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
}
