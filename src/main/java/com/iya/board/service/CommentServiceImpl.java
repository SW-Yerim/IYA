package com.iya.board.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.iya.board.dao.CommentDAO;

@Service
public class CommentServiceImpl implements ServiceInterface{

	@Autowired
	private CommentDAO commentDAO;
	
	@Override
	public void add(Model model) {
		Map<String, Object> map =  model.asMap();
		String userId=(String)map.get("userId");
		String boardNum=(String)map.get("boardNum");
		String groupNum=(String)map.get("groupNum");
		String cContent=(String)map.get("cContent");
		
		commentDAO.add(userId,boardNum,groupNum,cContent);
	}

	@Override
	public void modify(Model model) {
	}

	@Override
	public void delete(Model model) {
		Map<String, Object> map =  model.asMap();
		String boardNum=(String)map.get("boardNum");
		String groupNum=(String)map.get("groupNum");
		String sortNum=(String)map.get("sortNum");
		
		commentDAO.delete(boardNum,groupNum,sortNum);
	}

	@Override
	public void print(Model model) {
		Map<String, Object> map =  model.asMap();
		String boardNum=(String)map.get("boardNum");
		
		model.addAttribute("commentList",commentDAO.print(boardNum));
	}

	@Override
	public void detailPrint(Model model) {
		
	}

	@Override
	public void find(Model model) {
		
	}
	
	public void updown(Model model) {
		Map<String, Object> map =  model.asMap();
		String boardNum=(String)map.get("boardNum");
		String userId=(String)map.get("userId");
		String updown=(String)map.get("updown");
		
		commentDAO.updown(boardNum,userId,updown);
	}

	public void updownChk(Model model) {
		Map<String, Object> map =  model.asMap();
		String boardNum=(String)map.get("boardNum");
		String userId=(String)map.get("userId");
		
		model.addAttribute("upChk",commentDAO.up(boardNum, userId));
		model.addAttribute("downChk",commentDAO.down(boardNum, userId));
	}

	public void upDownCount(Model model) {
		Map<String, Object> map =  model.asMap();
		String boardNum=(String)map.get("boardNum");
		
		model.addAttribute("upCount",commentDAO.upCount(boardNum));
		model.addAttribute("downCount",commentDAO.downCount(boardNum));
		
	}
	
	

}
