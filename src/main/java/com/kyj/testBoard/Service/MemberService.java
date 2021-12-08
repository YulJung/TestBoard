package com.kyj.testBoard.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kyj.testBoard.DTO.MemberDTO;
import com.kyj.testBoard.Repository.MemberRepositroy;

@Service
public class MemberService implements MemberServiceInterface {
	@Autowired
	private MemberRepositroy mr;
	@Autowired
	private HttpSession session;
	@Autowired
	private BoardServiceInterface bs;
	
	@Override
	public String login(MemberDTO member,Model model,HttpServletRequest request) {
		// TODO Auto-generated method stub
		MemberDTO result = mr.login(member);
		System.out.println(member);
		if(result!=null) {
			session = request.getSession();
			session.setAttribute("loginId", member.getM_id()); // id값
			session.setAttribute("loginNumber", member.getM_number()); //number값
			List list = bs.getAll();
			model.addAttribute("bList", list);
		return "board/BoardList";
		}else {
			return "member/redirect";
		}
	}

	@Override
	public int insert(MemberDTO member) {
		// TODO Auto-generated method stub
		return mr.insert(member);
	}

	@Override
	public String idDuplicate(String m_id) {
		// TODO Auto-generated method stub
		String result = mr.idDuplicate(m_id);
		if(result == null) {
			return "ok"; // 조회결과가 없기 때문에 해당 아이디는 사용 가능
		} else {
			return "no";// 조회결과가 있기 때문에 해당 아이디는 사용 불가능
			}
	}

	@Override
	public List getall() {
		// TODO Auto-generated method stub
		return mr.getall();
	}

	@Override
	public void delete(String m_id) {
		// TODO Auto-generated method stub
		mr.delete(m_id);
	}

	@Override
	public MemberDTO select(String m_id) {
		// TODO Auto-generated method stub
		return mr.select(m_id);
	}
	

}
