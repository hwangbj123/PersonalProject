package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.BoardCommVO;
import com.boot.dto.BoardSellVO;

public interface BoardService {
	public void insertBoard(HashMap<String, String> param);
	public ArrayList<BoardSellVO> selectBoard();
	public BoardSellVO selectBoardContent(int board_key);
	public void insertBoardComm(HashMap<String, String> param);
	public ArrayList<BoardCommVO> selectBoardComm();
	public BoardCommVO selectBoardCommContent(int comm_key);
}
