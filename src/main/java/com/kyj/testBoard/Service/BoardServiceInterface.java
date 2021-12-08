package com.kyj.testBoard.Service;

import java.util.List;

import com.kyj.testBoard.DTO.BoardDTO;

public interface BoardServiceInterface {

	void save(BoardDTO board);

	List getAll();

	BoardDTO selectOne(long b_number);

	void updateHits(BoardDTO board);

	int update(BoardDTO board);

	int delete(long b_number);

}
