package com.kyj.testBoard.DTO;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentDTO {

	private long r_number;
	private long b_number;
	private String r_writer;
	private Timestamp r_date;
}
