package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.BoardDAO;
import com.boot.dto.BoardCommVO;
import com.boot.dto.BoardReplyVO;
import com.boot.dto.BoardSellVO;

import lombok.extern.slf4j.Slf4j;

@Service("boardService")
@Slf4j
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public void insertBoard(HashMap<String, String> param) {
		log.info("@# insertBoard");
		boardDAO.insertBoard(param);
	}
	@Override
	public ArrayList<BoardSellVO> selectBoard(){
		return boardDAO.selectBoard();
	}
	@Override
	public BoardSellVO selectBoardContent(int board_key) {
		return boardDAO.selectBoardContent(board_key);
	}
	
	
	@Override
	public void insertBoardComm(HashMap<String, String> param) {
		log.info("@# insertBoardComm");
		boardDAO.insertBoardComm(param);
	}
	@Override
	public ArrayList<BoardCommVO> selectBoardComm(){
		return boardDAO.selectBoardComm();
	}
	@Override
	public BoardCommVO selectBoardCommContent(int comm_key) {
		return boardDAO.selectBoardCommContent(comm_key);
	}
	
	@Override
	public void insertBoardReply(HashMap<String, String> param) {
		log.info("@# insertBoardReply");
		boardDAO.insertBoardReply(param);
	}
	@Override
	public ArrayList<BoardReplyVO> selectBoardReply(int comm_key){
		return boardDAO.selectBoardReply(comm_key);
	}
}











