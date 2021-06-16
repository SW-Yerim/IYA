package com.iya.board.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.iya.board.dao.UserDAO;
import com.iya.board.dto.UserDTO;

@Service
public class LoginServiceImpl implements ServiceInterface {

	@Autowired
	private UserDAO userDAO;

	// 회원가입
	@Override
	public void add(Model model) {
		Map<String, Object> map =  model.asMap();
		UserDTO userDTO = (UserDTO)map.get("userDTO");
		
		userDAO.add(userDTO); 
	}

	@Override
	public void modify(Model model) {
		Map<String, Object> map =  model.asMap();
		String userId=(String)map.get("userId");
		String userPw=(String)map.get("userPw");
		String userPhone=(String)map.get("userPhone");
		
		UserDTO userDTO = new UserDTO();
		userDTO.setUserId(userId);
		userDTO.setUserPw(userPw);
		userDTO.setUserPhone(userPhone);
		
		userDAO.modify(userDTO);
	}

	@Override
	public void delete(Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void print(Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void detailPrint(Model model) {
		// TODO Auto-generated method stub
		
	}

	// 유저 정보 확인
	@Override
	public void find(Model model) {
		Map<String, Object> map =  model.asMap();
		String userId=(String)map.get("userId");
		String userPw=(String)map.get("userPw");
		String userPhone=(String)map.get("userPhone");
		
		UserDTO userDTO = new UserDTO();
		userDTO.setUserId(userId);
		userDTO.setUserPw(userPw);
		userDTO.setUserPhone(userPhone);
		
		model.addAttribute("userInfo",userDAO.userInfo(userDTO));
	}

}
