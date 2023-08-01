package com.boot.service;

import com.boot.dto.UserVO;

public interface UserService {
	void insertUser(UserVO vo);
	public UserVO checkUser(String user_id);
}
