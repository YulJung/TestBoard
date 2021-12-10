package com.kyj.testBoard.Service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kyj.testBoard.DTO.MemberDTO;


public interface MemberServiceInterface {

	

	int insert(MemberDTO member) throws IllegalStateException, IOException;


	String idDuplicate(String m_id);

	List getall();

	void delete(String m_id);

	MemberDTO select(String m_id);

	int update(MemberDTO member) throws IllegalStateException, IOException;

	String login(MemberDTO member, Model model, HttpServletRequest request, int page);

}
