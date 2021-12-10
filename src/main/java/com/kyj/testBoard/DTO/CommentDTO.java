package com.kyj.testBoard.DTO;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentDTO {

	private long c_number;
	private long b_number;
	private String c_writer;
	private Timestamp c_date;
	private String c_contents;
}
