package com.kyj.testBoard.Service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kyj.testBoard.DTO.BoardDTO;
import com.kyj.testBoard.DTO.PageDTO;
import com.kyj.testBoard.Repository.BoardRepository;

@Service
public class BoardService implements BoardServiceInterface {
	@Autowired
	private BoardRepository br;

	private static final int PAGE_LIMIT = 5; // 한페이지에 보여질 글 개수
	private static final int BLOCK_LIMIT = 3; // 한화면에 보여질 페이지 개수
	// 데이터베이스에서 limit 문에 쓸 값을 변수로 선언

	@Override
	public void save(BoardDTO board) throws IllegalStateException, IOException {

		MultipartFile b_file = board.getB_files();

		String b_filename = b_file.getOriginalFilename();

		b_filename = System.currentTimeMillis() + "-" + b_filename;
		String savePath = "D:\\eclipse\\Spring\\Worksapce\\TestBoard\\src\\main\\webapp\\resources\\upload\\"
				+ b_filename;

		if (!b_file.isEmpty()) {
			b_file.transferTo(new File(savePath));

		}

		board.setB_file(b_filename);

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

	@Override
	public PageDTO paging(int page) {
		int boardCount = br.boardCount();
		int maxPage = (int) (Math.ceil((double) boardCount / PAGE_LIMIT));
		int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if (endPage > maxPage)
			endPage = maxPage;
		PageDTO paging = new PageDTO();
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);

		return paging;
	}

	@Override
	public List<BoardDTO> pagingList(int page) {
		int pagingStart = (page - 1) * PAGE_LIMIT;
		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", pagingStart);
		pagingParam.put("limit", PAGE_LIMIT);
//		List<BoardDTO> pagingList = br.pagingList(pagingStart);
		List<BoardDTO> pagingList = br.pagingList1(pagingParam);

		return pagingList;
	}

	@Override
	public List<BoardDTO> search(String searchtype, String keyword) {
		// TODO Auto-generated method stub
		Map<String, String> searchParam = new HashMap<String, String>();
		searchParam.put("type", searchtype);
		searchParam.put("word", keyword);
		List<BoardDTO> bList = br.search(searchParam);
		return bList;
	}

}
