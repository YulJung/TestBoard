package com.kyj.testBoard.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kyj.testBoard.DTO.MemberDTO;
import com.kyj.testBoard.Repository.MemberRepositroy;

@Service
public class MemberService implements MemberServiceInterface {
	@Autowired
	private MemberRepositroy mr;
	
	@Override
	public String login(String m_id, String m_password) {
		// TODO Auto-generated method stub
		return mr.login(m_id,m_password);
	}

	@Override
	public int insert(MemberDTO member) {
		// TODO Auto-generated method stub
		return mr.insert(member);
	}
	

}
