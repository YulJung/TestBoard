package com.kyj.testBoard.DTO;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDTO {
	private long b_number;
	private String b_writer;
	private String b_title;
	private String b_contents;
	private Timestamp b_date;
	private long b_hits;
	private MultipartFile b_files;
	private String b_file;
}
