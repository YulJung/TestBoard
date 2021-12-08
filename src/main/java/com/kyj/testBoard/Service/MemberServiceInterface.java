package com.kyj.testBoard.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kyj.testBoard.DTO.MemberDTO;

public interface MemberServiceInterface {

	

	int insert(MemberDTO member);

	String login(MemberDTO member,Model model, HttpServletRequest request);

	String idDuplicate(String m_id);

	List getall();

	void delete(String m_id);

	MemberDTO select(String m_id);

}
