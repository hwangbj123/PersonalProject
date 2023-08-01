package com.boot.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO {
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_email;
	private String user_addr;
	private String user_tel;
	private String user_thumb;
	private String user_good;
	private String user_bad;
	private int user_score;
}
