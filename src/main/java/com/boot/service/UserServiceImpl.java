package com.boot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.UserDAO;
import com.boot.dto.UserVO;

import lombok.extern.slf4j.Slf4j;

@Service("userService")
@Slf4j
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

	@Override
	public void insertUser(UserVO vo) {
		log.info("@# insertUser ");
		userDAO.insertUser(vo);
	}

	@Override
	public UserVO checkUser(String user_id) {
		log.info("@# checkUser ");
		return userDAO.checkUser(user_id);
	}

}











