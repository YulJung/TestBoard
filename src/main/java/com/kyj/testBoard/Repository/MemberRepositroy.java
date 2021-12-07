package com.kyj.testBoard.Repository;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kyj.testBoard.DTO.MemberDTO;

@Repository
public class MemberRepositroy {
	@Autowired
	private SqlSession sql;
	
	public String login(String m_id, String m_password) {
		// TODO Auto-generated method stub
		MemberDTO member = sql.selectOne("member.login",m_id);

		if(member!=null&&member.getM_password().equals(m_password)) {
		
			return "/board/boardList";
		}else {
			return "/member/login_f";
		}
		
	}

	public int insert(MemberDTO member) {
		// TODO Auto-generated method stub
		return sql.insert("member.insert", member);
	}

}
