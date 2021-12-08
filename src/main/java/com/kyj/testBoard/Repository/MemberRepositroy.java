package com.kyj.testBoard.Repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kyj.testBoard.DTO.MemberDTO;

@Repository
public class MemberRepositroy {
	@Autowired
	private SqlSession sql;
	
	public MemberDTO login(MemberDTO member) {
		// TODO Auto-generated method stub
		MemberDTO mem =  sql.selectOne("member.login", member);
		return mem;
	}

	public int insert(MemberDTO member) {
		// TODO Auto-generated method stub
		return sql.insert("member.insert", member);
	}

	public String idDuplicate(String m_id) {
		// TODO Auto-generated method stub
		return sql.selectOne("member.idDuplicate", m_id);
	}

	public List getall() {
		// TODO Auto-generated method stub
		return sql.selectList("member.getall");
	}

	public void delete(String m_id) {
		// TODO Auto-generated method stub
		sql.delete("member.delete", m_id);
	}

	public MemberDTO select(String m_id) {
		// TODO Auto-generated method stub
		return sql.selectOne("member.selectOne", m_id);
	}

	

}
