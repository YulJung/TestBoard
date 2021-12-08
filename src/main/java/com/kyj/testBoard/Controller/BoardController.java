package com.kyj.testBoard.Controller;

import java.time.LocalDateTime;
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
import com.kyj.testBoard.Service.BoardServiceInterface;


@Controller
@RequestMapping(value = "/testBoard/*")
public class BoardController {
	@Autowired
	private BoardServiceInterface bs;

	// 글 목록 페이지 조회
	@RequestMapping(value = "findall")
	public String boardList(Model model) {
		List list = bs.getAll();
		model.addAttribute("bList", list);
		return "/board/BoardList";
	}

	// 글쓰기 페이지
	@RequestMapping(value = "save")
	public String insert(@RequestParam("m_id")String m_id,Model model) {
		System.out.println(m_id);
		model.addAttribute("m", m_id);
		return "/board/save";
	}

	// 글쓰기
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String doInsert(@ModelAttribute BoardDTO board,Model model) {
		LocalDateTime now = LocalDateTime.now();
		board.setB_file(now+"_"+board.getB_file());
		bs.save(board);
		
			
			return "redirect:findall";
		

	}

	// 글 상세 조회
	@RequestMapping(value = "boardDetail")
	public String detail(@RequestParam("b_number") long b_number, Model model) {
		System.out.println("상세조회" + b_number);
		BoardDTO board = bs.selectOne(b_number);
		board.setB_hits(board.getB_hits() + 1);
		bs.updateHits(board);

		model.addAttribute("board", board);

		return "/board/BoardDetail";
	}
	@RequestMapping(value = "mypage")
	public String mypage(HttpSession session) {
		if(session.getAttribute("loginId").equals("admin")) {
			return "redirect:../";
		}
		return "/board/mypage";
	}

	// 글 수정 페이지호출
	@RequestMapping(value = "updateBoard")
	public String update(@RequestParam("b_number") int b_number, Model model) {
System.out.println("update con");
		BoardDTO board = bs.selectOne(b_number);
		model.addAttribute("board", board);

		return "/board/BoardUpdate";
	}

	// 글 수정 실행
	@RequestMapping(value = "doUpdateBoard", method = RequestMethod.POST)
	public String doUpdate(@ModelAttribute BoardDTO board) {
		System.out.println("update do");
		int result = bs.update(board);
		System.out.println(board+" "+result);
		if (result == 1) {
			System.out.println("do do");
			return "redirect:findall";
		} else {
			return "/board/fail";
		}

	}

	// 글 삭제
	@RequestMapping(value = "deleteBoard")
	public String doDelete( @ModelAttribute BoardDTO board) {
		System.out.println("delete con");
		int result = bs.delete(board.getB_number());
		if (result == 1) {
			return "redirect:findall";
		} else {
			return "fail";
		}
	}

}
