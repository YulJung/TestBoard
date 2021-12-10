package com.kyj.testBoard.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kyj.testBoard.DTO.BoardDTO;
import com.kyj.testBoard.DTO.CommentDTO;
import com.kyj.testBoard.DTO.PageDTO;
import com.kyj.testBoard.Service.BoardServiceInterface;
import com.kyj.testBoard.Service.CommentService;

@Controller
@RequestMapping(value = "/testBoard/*")
public class BoardController {
	@Autowired
	private BoardServiceInterface bs;
	@Autowired
	private CommentService cs;

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(@RequestParam("b_number") long b_number, Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		BoardDTO board = bs.selectOne(b_number);
		model.addAttribute("board", board);
		model.addAttribute("page", page);

		List<CommentDTO> commentList = cs.findAll(b_number);
		model.addAttribute("commentList", commentList);
		// 상세조회를 할 때 댓글 목록도 같이 가져가게 해주는 코드.
		return "board/BoardDetail";
	}

	// 글 목록 페이지 조회
	@RequestMapping(value = "findall")
	public String boardList(Model model) {
		List list = bs.getAll();
		model.addAttribute("bList", list);
		return "/board/BoardList";
	}

	// 글쓰기 페이지
	@RequestMapping(value = "save")
	public String insert(@RequestParam("m_id") String m_id, Model model) {

		model.addAttribute("m", m_id);
		return "/board/save";
	}

	// 글쓰기
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String doInsert(@ModelAttribute BoardDTO board, Model model) throws IllegalStateException, IOException {

		bs.save(board);

		return "redirect:findall";

	}

	// 글 상세 조회
	@RequestMapping(value = "boardDetail")
	public String detail(@RequestParam("b_number") long b_number, Model model) {

		BoardDTO board = bs.selectOne(b_number);
		board.setB_hits(board.getB_hits() + 1);
		bs.updateHits(board);

		model.addAttribute("board", board);

		return "/board/BoardDetail";
	}

	@RequestMapping(value = "mypage")
	public String mypage(HttpSession session) {
		if (session.getAttribute("loginId").equals("admin")) {
			return "redirect:../";
		}
		return "/board/mypage";
	}

	// 글 수정 페이지호출
	@RequestMapping(value = "updateBoard")
	public String update(@RequestParam("b_number") int b_number, Model model) {

		BoardDTO board = bs.selectOne(b_number);
		model.addAttribute("board", board);

		return "/board/BoardUpdate";
	}

	// 글 수정 실행
	@RequestMapping(value = "doUpdateBoard", method = RequestMethod.POST)
	public String doUpdate(@ModelAttribute BoardDTO board) {
		int result = bs.update(board);
		if (result == 1) {
			return "redirect:findall";
		} else {
			return "/board/fail";
		}
	}

	// 글 삭제
	@RequestMapping(value = "deleteBoard")
	public String doDelete(@ModelAttribute BoardDTO board) {
		int result = bs.delete(board.getB_number());
		if (result == 1) {
			return "redirect:findall";
		} else {
			return "fail";
		}
	}
	@RequestMapping(value = "paging", method = RequestMethod.GET)
	public String paging(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) {
		PageDTO paging = bs.paging(page);
		List<BoardDTO> boardList = bs.pagingList(page);
		model.addAttribute("bList", boardList);
		model.addAttribute("paging", paging);
		return "/board/BoardList";
	}

	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search(@RequestParam("searchtype") String searchtype, @RequestParam("keyword") String keyword,
			Model model) {
		List<BoardDTO> bList = bs.search(searchtype, keyword);
		model.addAttribute("bList", bList);
		return "/board/BoardList";
	}

}
