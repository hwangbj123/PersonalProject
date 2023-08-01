package com.boot.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardCommVO {
	private int comm_key;
	private String user_id;
	private String comm_title;
	private String comm_content;
	private String comm_img;
	private String comm_date;
	private int comm_good;
	private int comm_bad;
}
