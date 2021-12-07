package com.kyj.testBoard.Service;

import com.kyj.testBoard.DTO.MemberDTO;

public interface MemberServiceInterface {

	String login(String m_id, String m_password);

	int insert(MemberDTO member);

}
