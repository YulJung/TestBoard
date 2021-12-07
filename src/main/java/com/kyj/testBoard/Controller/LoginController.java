package com.kyj.testBoard.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kyj.testBoard.Service.MemberServiceInterface;

@Controller
@RequestMapping(value="/testBoard/*")
public class LoginController {
	
	@Autowired
	private MemberServiceInterface ms;
	@RequestMapping(value = "login")
	public String loginView( ) {
		
		return "/member/login";
	}
	@RequestMapping(value = "doLogin")
	public String doLogin(@RequestParam("m_id")String m_id,@RequestParam("m_password")String m_password,HttpSession session ) {
		
		return ms.login(m_id,m_password);
	}
	@RequestMapping(value = "logout")
	public String doLogout(HttpSession session) {
		session.invalidate();
		return "index";
	}
}
