package com.boot.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardReplyVO {
	private int comm_key;
	private int reply_key;
	private String reply_id;
	private String reply_content;
	private String reply_date;
}
