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
	
	public void save(CommentDTO comment) {
		cr.save(comment);
	}

	public List<CommentDTO> findAll(long b_number) {
		return cr.findAll(b_number);
	}
}
