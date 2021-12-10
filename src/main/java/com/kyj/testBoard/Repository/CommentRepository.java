package com.kyj.testBoard.Repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kyj.testBoard.DTO.CommentDTO;
@Repository
public class CommentRepository {

	@Autowired
	private SqlSession sql;
	public List<CommentDTO> findAll(long b_number) {
		// TODO Auto-generated method stub
		return sql.selectList("comment.findAll", b_number);
	}

	public void save(CommentDTO comment) {
		// TODO Auto-generated method stub
		sql.insert("comment.save", comment);
	}

}
