package com.boot.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardRecipesVO {
	private int rcp_key;
	private String user_id;
	private String rcp_title;
	private String rcp_content;
	private String rcp_tag;
	private String rcp_ing;
	private String rcp_img;
	private String rcp_date;
	private int rcp_good;
}
