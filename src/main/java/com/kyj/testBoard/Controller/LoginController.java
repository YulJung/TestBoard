package com.kyj.testBoard.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kyj.testBoard.DTO.MemberDTO;
import com.kyj.testBoard.Service.MemberServiceInterface;

@Controller
@RequestMapping(value = "/testBoard/*")
public class LoginController {

	@Autowired
	private MemberServiceInterface ms;

	@RequestMapping(value = "login")
	public String loginView(HttpSession session) {

		try {
			session.getAttribute("loginId");
		} catch (NullPointerException e) {
			// TODO: handle exception
			return "redirect:findall";
		}

		return "/member/login";
	}

	@RequestMapping(value = "doLogin")
	public String doLogin(@ModelAttribute MemberDTO member, Model model, HttpServletRequest request) {

		return ms.login(member, model, request, 1);
	}

	@RequestMapping(value = "logout")
	public String doLogout(HttpSession session, Model model) {
		session.invalidate();

		model.addAttribute("msg", "정상적으로 로그아웃 되셨습니다.");
		model.addAttribute("url", "/");

		return "/member/redirect";
	}

	@RequestMapping(value = "admin")
	public String adminPage(Model model) {
		List list = ms.getall();
		model.addAttribute("member", list);
		return "/member/memberList";
	}
}
