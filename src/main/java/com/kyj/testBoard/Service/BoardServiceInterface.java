package com.kyj.testBoard.Service;

import java.io.IOException;
import java.util.List;

import com.kyj.testBoard.DTO.BoardDTO;
import com.kyj.testBoard.DTO.PageDTO;

public interface BoardServiceInterface {

	void save(BoardDTO board) throws IllegalStateException, IOException;

	List getAll();

	BoardDTO selectOne(long b_number);

	void updateHits(BoardDTO board);

	int update(BoardDTO board);

	int delete(long b_number);

	PageDTO paging(int page);

	List<BoardDTO> pagingList(int page);

	List<BoardDTO> search(String searchtype, String keyword);

}

