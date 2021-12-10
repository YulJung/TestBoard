package com.kyj.testBoard.DTO;

import lombok.Data;

@Data
public class PageDTO {

	private int startPage;
	private int page;
	private int endPage;
	
	private int maxPage;
}
