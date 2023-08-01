package com.boot.dao;

import org.apache.ibatis.annotations.Mapper;

import com.boot.dto.UserVO;

@Mapper
public interface UserDAO{
	public void insertUser(UserVO vo);
	public UserVO checkUser(String user_id);
}











