package com.kyj.testBoard.Repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kyj.testBoard.DTO.BoardDTO;

@Repository
public class BoardRepository {

	@Autowired
	private SqlSession sql;
	
	public void insert(BoardDTO board) {
		// TODO Auto-generated method stub
	sql.insert("board.insert", board);	
	}

	public List getall() {
		// TODO Auto-generated method stub
		return sql.selectList("board.getall");
	}

	public BoardDTO select(long b_number) {
		// TODO Auto-generated method stub
		return sql.selectOne("board.select", b_number);
	}

	public void updateHits(BoardDTO board) {
		// TODO Auto-generated method stub
	
		sql.update("board.hits", board);
	}

	public int update(BoardDTO board) {
		// TODO Auto-generated method stub
		int result =0;
		try {
			result = sql.update("board.update", board);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	public int delete(long b_number) {
		// TODO Auto-generated method stub
		return sql.delete("board.delete", b_number);
	}

}
