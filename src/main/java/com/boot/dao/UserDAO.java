package com.boot.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.boot.dto.UserVO;

@Mapper
public interface UserDAO{
	public void insertUser(UserVO vo);
	public UserVO checkUser(String user_id);
	public String selectUserGood(String user_id);
	public void addUserGood(@Param("user_good") String user_good,@Param("user_id") String user_id);
}











