package com.iya.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iya.board.service.BoardServiceImpl;
import com.iya.board.service.CommentServiceImpl;

@Controller
public class CommentController {

	@Autowired
	private CommentServiceImpl commentServiceImpl;
	
	@RequestMapping(value = "reply")
	public String reply(HttpServletRequest request, Model model) {
		String boardNum =request.getParameter("boardNum");
		String userId =request.getParameter("userId");
		String groupNum =request.getParameter("groupNum");
		String cContent =request.getParameter("cContent");
		
		model.addAttribute("boardNum",boardNum);
		model.addAttribute("userId",userId);
		model.addAttribute("groupNum",groupNum);
		model.addAttribute("cContent",cContent);
		
		commentServiceImpl.add(model);
		
		return "redirect:detail";
	}
	@RequestMapping(value = "commentDelete")
	public String commentDelete(HttpServletRequest request, Model model) {
		String boardNum =request.getParameter("boardNum");
		String groupNum =request.getParameter("groupNum");
		String sortNum =request.getParameter("sortNum");
		
		model.addAttribute("boardNum",boardNum);
		model.addAttribute("groupNum",groupNum);
		model.addAttribute("sortNum",sortNum);
		
		commentServiceImpl.delete(model);
		
		return "redirect:detail";
	}
	@RequestMapping(value = "updown")
	public String updown(HttpServletRequest request, Model model) {
		String boardNum =request.getParameter("boardNum");
		String updown =request.getParameter("updown");
		String userId =request.getParameter("userId");
		
		model.addAttribute("boardNum",boardNum);
		model.addAttribute("updown",updown);
		model.addAttribute("userId",userId);
		
		commentServiceImpl.updown(model);
		
		return "redirect:detail";
	}

}
