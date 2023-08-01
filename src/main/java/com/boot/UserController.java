package com.boot;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.boot.dto.BoardCommVO;
import com.boot.dto.BoardReplyVO;
import com.boot.dto.BoardSellVO;
import com.boot.dto.UserVO;
import com.boot.service.BoardService;
import com.boot.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserController {
	
	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@RequestMapping(value = "/login")
	public String login() {
		log.info("@# login");
		return "login";
	}
	@RequestMapping(value = "/login_check")
	@ResponseBody
	public int login_check(@RequestParam HashMap<String, String> param) {
		log.info("@# login_check param :"+param);
		String user_id = param.get("user_id");
		String user_pwd = param.get("user_pwd");
		UserVO vo = userService.checkUser(user_id);
		log.info("@# login_check vo : "+vo);
		String pw = vo.getUser_pwd();
		int res = 0;
		if(pw.equals(user_pwd)) {
			res = 1;
		}
		return res;
	}
	@RequestMapping(value = "/signup")
	public String signup() {
		log.info("@# signup");
		return "signup";
	}
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		log.info("@# logout");
		session.invalidate();
		
		return "redirect:main";
	}
	@RequestMapping(value = "/login_ok")
	public String login_yn(@RequestParam("user_id") String user_id, HttpServletRequest request) {
		log.info("@# login_ok user_id : "+user_id);
		HttpSession session = request.getSession();
		session.setAttribute("user_id", user_id);
		
		return "redirect:main";
	}
	
	@RequestMapping(value = "/register")
	@ResponseBody
	public void register(UserVO vo) throws Exception {
		log.info("@# signup");
		userService.insertUser(vo);
	}
	
// main --------------------------------------------------	
	@RequestMapping(value = "/main")
	public String main(HttpSession session) {
		log.info("@# main");
		if(session.getAttribute("user_id")!=null) {
			log.info("@# main session : "+session.getAttribute("user_id"));
		}else {
			log.info("@# main session is null");
		}
		
		return "main";
	}
	@RequestMapping(value = "/inst")
	public String inst() {
		log.info("@# inst");
		return "inst";
	}
// board sell ----------------------------------------------
	@RequestMapping(value = "/board_sell")
	public String board_sell(Model model) {
		log.info("@# board_sell");
		
		ArrayList<BoardSellVO> list = boardService.selectBoard();
		
		model.addAttribute("list", list);
		log.info("@# board_sell list : "+list);
		return "board_sell";
	}
	@RequestMapping(value = "/board_sell_write")
	public String board_sell_write() {
		log.info("@# board_sell_write");
		return "board_sell_write";
	}
	@RequestMapping(value = "/write_res")
	public String write_res(@RequestParam HashMap<String, String> param,
									 @RequestParam("board_img") MultipartFile[] uploadFiles,
									 Model model) {
		prod_uploadFile("board_img", param, uploadFiles);
		log.info("@# write_res : param : "+param);
		boardService.insertBoard(param);
		
		return "redirect:board_sell";
	}
	@RequestMapping(value = "/board_sell_content")
	public String board_sell_Content(@RequestParam("board_key") int board_key,
													Model model) {
		log.info("@# board_sell_Content : board_key : "+board_key);
		BoardSellVO vo = boardService.selectBoardContent(board_key);
		model.addAttribute("content", vo);
		
		return "board_sell_content";
	}

	// 파일 업로드 메소드
	public void prod_uploadFile(String put_img_name, @RequestParam HashMap<String, String> param,
			@RequestParam("uploadFile") MultipartFile[] uploadFiles) {
		log.info("@@@### prodcontroller prod_uploadFile()");

		String uploadPath = "D:\\dev\\upload";

		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		List<String> save_ImgPath = new ArrayList<>(); // 파일 경로 목록을 저장할 리스트

		for (MultipartFile uploadFile : uploadFiles) {
			if (!uploadFile.isEmpty()) {
				log.info("-----------------------------------------------");
				log.info("파일 이름 : " + uploadFile.getOriginalFilename());
				log.info("파일 타입 : " + uploadFile.getContentType());
				log.info("파일 크기 : " + uploadFile.getSize());

				// UUID 생성
				String uuid = UUID.randomUUID().toString().replace("-", "");
				// 기존 파일명 변수화
				String originalFileName = uploadFile.getOriginalFilename();
				// uuid 를 붙여 새로운 파일 이름 생성
				String saveFileName = uuid +"_"+ originalFileName;
				// 저장할 파일의 경로와 파일명을 설정
				File saveFile = new File(uploadPath, saveFileName);

				try {
					uploadFile.transferTo(saveFile);
					save_ImgPath.add(saveFileName); // 파일 경로를 리스트에 추가
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		if (save_ImgPath != null) {
			// 파일 경로를 param에 추가
			param.put(put_img_name, save_ImgPath.toString().replace("[", "").replace("]", ""));
		}
	}
	// board comm --------------------------------------------
	@RequestMapping(value = "/board_comm")
	public String board_comm(Model model) {
		log.info("@# board_comm");
		
		ArrayList<BoardCommVO> list = boardService.selectBoardComm();
		
		model.addAttribute("list", list);
		log.info("@# board_comm list : "+list);
		return "board_comm";
	}
	@RequestMapping(value = "/board_comm_write")
	public String board_comm_write() {
		log.info("@# board_comm_write");
		return "board_comm_write";
	}
	@RequestMapping(value = "/board_comm_upload")
	public String board_comm_upload(@RequestParam HashMap<String, String> param,
									 @RequestParam("comm_img") MultipartFile[] uploadFiles,
									 Model model) {
		prod_uploadFile("comm_img", param, uploadFiles);
		log.info("@# board_comm_upload : param : "+param);
		boardService.insertBoardComm(param);
		
		return "redirect:board_comm";
	}
	@RequestMapping(value = "/board_comm_content")
	public String board_comm_content(@RequestParam("comm_key") int comm_key,
													Model model) {
		log.info("@# board_comm_content : comm_key : "+comm_key);
		BoardCommVO vo = boardService.selectBoardCommContent(comm_key);
		model.addAttribute("content", vo);
		
		ArrayList<BoardReplyVO> reply = boardService.selectBoardReply(comm_key);
		model.addAttribute("reply", reply);
		
		return "board_comm_content";
	}
	
	@RequestMapping(value="/board_reply_write")
	@ResponseBody
	public void board_reply_write(@RequestParam HashMap<String, String> param) {
		log.info("@# board_reply_write param : "+param);
		boardService.insertBoardReply(param);
	}
}











