package com.iya.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iya.board.service.BoardServiceImpl;
import com.iya.board.service.ServiceInterface;

@Controller
public class MoveController {
	@Autowired
	private BoardServiceImpl boardServiceImple;
	
	@RequestMapping(value = {"/","index"})
	public String index(HttpServletRequest request, Model model) {
		boardServiceImple.indexPrint(model);
		return "index";
	}
	@RequestMapping(value = "best_member")
	public String best_member() {
		return "best_member";
	}
	@RequestMapping(value = "statement")
	public String statement() {
		return "statement";
	}
	@RequestMapping(value = "terms")
	public String terms() {
		return "terms";
	}
}
