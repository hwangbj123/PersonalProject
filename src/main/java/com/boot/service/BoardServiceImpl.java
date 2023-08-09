package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.BoardDAO;
import com.boot.dto.BoardCommVO;
import com.boot.dto.BoardRecipesVO;
import com.boot.dto.BoardReplyVO;

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
	public ArrayList<BoardRecipesVO> selectBoard(){
		return boardDAO.selectBoard();
	}
	@Override
	public BoardRecipesVO selectBoardContent(int board_key) {
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
	public void updateBoardComm(HashMap<String, String> param) {
		log.info("@# updateBoardComm");
		boardDAO.updateBoardComm(param);
	}
	@Override
	public void deleteBoardComm(int comm_key) {
		log.info("@# deleteBoardComm");
		boardDAO.deleteBoardComm(comm_key);
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
	@Override
	public void updateBoard(HashMap<String, String> param) {
		boardDAO.updateBoard(param);
	}
	@Override
	public void deleteBoard(int rcp_key) {
		boardDAO.deleteBoard(rcp_key);
	}
	@Override
	public void boardGoodUp(int rcp_key) {
		boardDAO.boardGoodUp(rcp_key);
	}
	@Override
	public void boardGoodDown(int rcp_key) {
		boardDAO.boardGoodDown(rcp_key);
	}
	@Override
	public ArrayList<BoardRecipesVO> searchBoard(String search_input) {
		return boardDAO.searchBoard(search_input);
	}
}











