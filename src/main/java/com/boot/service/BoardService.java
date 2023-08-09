package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.BoardCommVO;
import com.boot.dto.BoardRecipesVO;
import com.boot.dto.BoardReplyVO;

public interface BoardService {
	public void insertBoard(HashMap<String, String> param);
	public ArrayList<BoardRecipesVO> selectBoard();
	public BoardRecipesVO selectBoardContent(int board_key);
	public void updateBoard(HashMap<String, String> param);
	public void deleteBoard(int rcp_key);
	public void boardGoodUp(int rcp_key);
	public void boardGoodDown(int rcp_key);
	
	public void insertBoardComm(HashMap<String, String> param);
	public ArrayList<BoardCommVO> selectBoardComm();
	public BoardCommVO selectBoardCommContent(int comm_key);
	public void updateBoardComm(HashMap<String, String> param);
	public void deleteBoardComm(int comm_key);
	
	public void insertBoardReply(HashMap<String, String> param);
	public ArrayList<BoardReplyVO> selectBoardReply(int comm_key);
}
