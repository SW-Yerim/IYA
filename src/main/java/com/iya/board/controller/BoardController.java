package com.iya.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.iya.board.dto.UserDTO;
import com.iya.board.service.BoardServiceImpl;
import com.iya.board.service.CommentServiceImpl;
import com.iya.board.service.ServiceInterface;

@Controller
public class BoardController {

	@Autowired
	private BoardServiceImpl boardServiceImple;
	@Autowired
	private CommentServiceImpl commentServiceImpl;
	
	@RequestMapping(value = "board")
	public String board(HttpServletRequest request, Model model) {
		String cate1 =request.getParameter("cate1");
		String cate2 =request.getParameter("cate2");
		String search1 =request.getParameter("search1");
		String search2 =request.getParameter("search2");
		String paging =request.getParameter("paging");
		
		model.addAttribute("cate1",cate1);
		model.addAttribute("cate2",cate2);
		model.addAttribute("search1",search1);
		model.addAttribute("search2",search2);
		model.addAttribute("paging",paging);
		
		boardServiceImple.print(model);
		
		return "board";
	}
	@RequestMapping(value = "detail")
	public String detail(HttpServletRequest request, Model model) {
		String boardNum =request.getParameter("boardNum");
		HttpSession session = request.getSession();
		UserDTO userInfo= (UserDTO) session.getAttribute("user_info");
		
		model.addAttribute("boardNum",boardNum);
		
		boardServiceImple.detailPrint(model);
		
		commentServiceImpl.print(model);
		commentServiceImpl.upDownCount(model);
		
		if(userInfo != null) {
			model.addAttribute("userId",userInfo.getUserId());
			commentServiceImpl.updownChk(model);
		}
		
		return "detail";
	}
	@RequestMapping(value = "write")
	public String write(HttpServletRequest request, Model model) {
		String writeType =request.getParameter("writeType");

		if(writeType.equals("2")) {
			String boardNum =request.getParameter("boardNum");
			model.addAttribute("boardNum",boardNum);
			boardServiceImple.detailPrint(model);

		}
		
		return "write";
	}
	@RequestMapping(value = "search")
	public String search(HttpServletRequest request, Model model) {
		return "search";
	}
	@RequestMapping(value = "add")
	public String add(HttpServletRequest request, Model model) {
		String writeType =request.getParameter("writeType");
		String boardNum =request.getParameter("boardNum");
		String userId =request.getParameter("userId");
		String cate1 =request.getParameter("cate1");
		String cate2 =request.getParameter("cate2");
		String boardTitle =request.getParameter("boardTitle");
		String boardContent =request.getParameter("boardContent");
		
		model.addAttribute("boardNum",boardNum);
		model.addAttribute("userId",userId);
		model.addAttribute("cate1",cate1);
		model.addAttribute("cate2",cate2);
		model.addAttribute("boardTitle",boardTitle);
		model.addAttribute("boardContent",boardContent);
		
		if(writeType.equals("2")) {
			boardServiceImple.modify(model);

		}else {
			boardServiceImple.add(model);
		}
		
		return "redirect:board";
	}
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request, Model model) {
		String boardNum =request.getParameter("boardNum");
		model.addAttribute("boardNum",boardNum);
		boardServiceImple.delete(model);
		return "redirect:board";
	}
}
