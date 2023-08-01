package com.boot.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardSellVO {
	private int board_key;
	private String user_id;
	private String board_title;
	private String board_content;
	private int board_price;
	private String board_img;
	private String board_date;
	private String board_res;
}
