package com.iya.board.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.iya.board.dao.BoardDAO;
import com.iya.board.dao.CommentDAO;
import com.iya.board.dto.BoardDTO;
import com.iya.board.dto.UserDTO;

@Service
public class BoardServiceImpl implements ServiceInterface{
	
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private CommentDAO commentDAO;

	@Override
	public void add(Model model) {
		Map<String, Object> map =  model.asMap();
		String userId=(String)map.get("userId");
		String cate1=(String)map.get("cate1");
		String cate2 =(String)map.get("cate2");
		String boardTitle =(String)map.get("boardTitle");
		String boardContent =(String)map.get("boardContent");
		
		boardDAO.add(userId,cate1,cate2,boardTitle,boardContent);
	}

	@Override
	public void modify(Model model) {
		Map<String, Object> map =  model.asMap();
		String boardNum=(String)map.get("boardNum");
		String cate1=(String)map.get("cate1");
		String cate2 =(String)map.get("cate2");
		String boardTitle =(String)map.get("boardTitle");
		String boardContent =(String)map.get("boardContent");
		
		boardDAO.modify(boardNum,cate1,cate2,boardTitle,boardContent);
	}

	@Override
	public void delete(Model model) {
		Map<String, Object> map =  model.asMap();
		String boardNum=(String)map.get("boardNum");
		boardDAO.delete(boardNum);
		commentDAO.delete(boardNum);
	}

	@Override
	public void print(Model model) {
		Map<String, Object> map =  model.asMap();
		String cate1=(String)map.get("cate1");
		String cate2 =(String)map.get("cate2");
		String search1 =(String)map.get("search1");
		String search2 =(String)map.get("search2");
		String paging =(String)map.get("paging");
		
		ArrayList<BoardDTO> list = boardDAO.print(cate1, cate2,search1,search2,paging);
		model.addAttribute("boardList",list);
		model.addAttribute("commentCount",commentDAO.commentNum(list));
		model.addAttribute("boardCount",boardDAO.boardNum(cate1, cate2, search1, search2));
		
	}

	@Override
	public void detailPrint(Model model) {
		Map<String, Object> map =  model.asMap();
		String boardNum=(String)map.get("boardNum");
		
		boardDAO.viewNumUp(boardNum);
		model.addAttribute("boardDTO",boardDAO.detailPrint(boardNum));
	}

	@Override
	public void find(Model model) {
		// TODO Auto-generated method stub
		
	}

	public void indexPrint(Model model) {
		
		ArrayList<BoardDTO> list = null;
				
		list=boardDAO.indexUpPrint();
		model.addAttribute("indexUp",	list);
		model.addAttribute("indexUpCommentCount",commentDAO.commentNum(list));

		list = boardDAO.indexViewPrint();
		model.addAttribute("indexView",	list);
		model.addAttribute("indexViewCommentCount",commentDAO.commentNum(list));
		
		list = boardDAO.indexCate11Print();
		model.addAttribute("indexCate11",	list);
		model.addAttribute("indexCate11CommentCount",commentDAO.commentNum(list));
		
		list = boardDAO.indexCate12Print();
		model.addAttribute("indexCate12",	list);
		model.addAttribute("indexCate12CommentCount",commentDAO.commentNum(list));
		
		list = boardDAO.indexCate13Print();
		model.addAttribute("indexCate13",	list);
		model.addAttribute("indexCate13CommentCount",commentDAO.commentNum(list));
		
	}

}
