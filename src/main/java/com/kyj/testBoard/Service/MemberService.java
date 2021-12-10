package com.kyj.testBoard.Service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kyj.testBoard.DTO.BoardDTO;
import com.kyj.testBoard.DTO.MemberDTO;
import com.kyj.testBoard.DTO.PageDTO;
import com.kyj.testBoard.Repository.MemberRepositroy;

@Service
public class MemberService implements MemberServiceInterface {
	@Autowired
	private MemberRepositroy mr;
	@Autowired
	private HttpSession session;
	@Autowired
	private BoardServiceInterface bs;

	@Override
	public String login(MemberDTO member, Model model, HttpServletRequest request,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		// TODO Auto-generated method stub
		MemberDTO result = mr.login(member);
		if (result != null) {
			session = request.getSession();
			session.setAttribute("loginId", member.getM_id()); // id값
			session.setAttribute("loginNumber", member.getM_number()); // number값
			PageDTO paging = bs.paging(page);
			List<BoardDTO> boardList = bs.pagingList(page);
			model.addAttribute("bList", boardList);
			model.addAttribute("paging", paging);
			return "board/BoardList";
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호가 올바르지 않습니다.");
			model.addAttribute("url", "/testBoard/login");
			return "member/redirect";
		}
	}

	@Override
	public int insert(MemberDTO member) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		MultipartFile m_file = member.getM_file(); // 실제파일
		String m_filename = m_file.getOriginalFilename();
		m_filename = System.currentTimeMillis() + "-" + m_filename;
		String savePath = "D:\\eclipse\\Spring\\Worksapce\\TestBoard\\src\\main\\webapp\\resources\\upload\\"
				+ m_filename;
		if (!m_file.isEmpty()) {
			m_file.transferTo(new File(savePath));

		} else {

		}

		return mr.insert(member);
	}

	@Override
	public int update(MemberDTO member) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		MultipartFile m_file = member.getM_file(); // 실제파일

		if (!m_file.isEmpty()) {
			String m_filename = m_file.getOriginalFilename();
			m_filename = System.currentTimeMillis() + "-" + m_filename;

			String savePath = "D:\\eclipse\\Spring\\Worksapce\\TestBoard\\src\\main\\resources\\upload\\" + m_filename;
			m_file.transferTo(new File(savePath));

		}
		return mr.update(member);
	}

	@Override
	public String idDuplicate(String m_id) {
		// TODO Auto-generated method stub
		String result = mr.idDuplicate(m_id);

		if (result == null) {
			return "ok"; // 조회결과가 없기 때문에 해당 아이디는 사용 가능
		} else {
			return "no";// 조회결과가 있기 때문에 해당 아이디는 사용 불가능
		}
	}

	@Override
	public List getall() {
		// TODO Auto-generated method stub
		return mr.getall();
	}

	@Override
	public void delete(String m_id) {
		// TODO Auto-generated method stub
		mr.delete(m_id);
	}

	@Override
	public MemberDTO select(String m_id) {
		// TODO Auto-generated method stub
		return mr.select(m_id);
	}

}
