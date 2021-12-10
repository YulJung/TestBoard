package com.kyj.testBoard.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kyj.testBoard.DTO.CommentDTO;
import com.kyj.testBoard.Repository.CommentRepository;

@Service
public class CommentService {
	
	@Autowired
	private CommentRepository cr;

	// 댓글을 저장하는 메서드를 호출 및 전달
	
	public void save(CommentDTO comment) {
		cr.save(comment);
	}

	// 댓글 목록을 가져오는 메서드를 호출 및 전달
	
	public List<CommentDTO> findAll(long b_number) {
		return cr.findAll(b_number);
	}
}
