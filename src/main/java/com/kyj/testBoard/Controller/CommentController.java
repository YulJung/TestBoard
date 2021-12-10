package com.kyj.testBoard.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kyj.testBoard.DTO.CommentDTO;
import com.kyj.testBoard.Service.CommentService;

@Controller
@RequestMapping(value = "/testBoard/*")
public class CommentController {

	@Autowired
	private CommentService cs;

	@RequestMapping(value = "commentSave", method = RequestMethod.POST)
	public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO comment) {

		cs.save(comment);

		List<CommentDTO> commentList = cs.findAll(comment.getB_number());

		return commentList;
	}

	@RequestMapping(value = "commentload", method = RequestMethod.POST)
	public @ResponseBody List<CommentDTO> load(@ModelAttribute CommentDTO comment) {

		List<CommentDTO> commentList = cs.findAll(comment.getB_number());

		return commentList;
	}
}
