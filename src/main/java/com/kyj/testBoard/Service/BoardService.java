package com.kyj.testBoard.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kyj.testBoard.DTO.BoardDTO;
import com.kyj.testBoard.Repository.BoardRepository;

@Service
public class BoardService implements BoardServiceInterface {
	@Autowired
	private BoardRepository br;
	
	@Override
	public void save(BoardDTO board) {
		br.insert(board);
		
	}

	@Override
	public List getAll() {
		// TODO Auto-generated method stub
		return br.getall();
	}

	@Override
	public BoardDTO selectOne(long b_number) {
		// TODO Auto-generated method stub
		return br.select(b_number);
	}

	@Override
	public void updateHits(BoardDTO board) {
		// TODO Auto-generated method stub
		br.updateHits(board);
	}

	@Override
	public int update(BoardDTO board) {
		// TODO Auto-generated method stub
		return br.update(board);
	}

	@Override
	public int delete(long b_number) {
		// TODO Auto-generated method stub
		return br.delete(b_number);
	}
	
	

}
