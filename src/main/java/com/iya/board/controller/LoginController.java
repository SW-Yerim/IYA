package com.iya.board.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iya.board.dto.UserDTO;
import com.iya.board.service.LoginServiceImpl;

@Controller
public class LoginController {

	@Autowired
	private LoginServiceImpl loginServiceImpl;
	
	
	/* 회원가입 */
	// 회원가입 약관 동의 페이지
	@RequestMapping(value = "join")
	public String join() {
		return "join";
	}
	// 회원가입 정보 입력 페이지
	@RequestMapping(value = "join2")
	public String join2() {
		return "join2";
	}
	// 회원가입 아이디 중복 체크(ajax)
	@RequestMapping(value = "idchk")
	@ResponseBody
	public int idchk(HttpServletRequest request, Model model) {
		
		String userId= request.getParameter("userId");
		System.out.println("id: "+userId);
		model.addAttribute("userId",userId);
		loginServiceImpl.find(model);
		Map<String, Object> map = model.asMap();
		UserDTO userInfo= (UserDTO)map.get("userInfo");
		if(userInfo!=null) {
			return 1;
		}else {
			return 0;
		}
	}
	// 회원가입 완료 페이지
	@RequestMapping(value = "join3")
	public String join3(HttpServletRequest request, Model model) {
		String userId= request.getParameter("id");
		String userPw= request.getParameter("pw");
		String userPhone= request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
		
		UserDTO userDTO = new UserDTO();
		userDTO.setUserId(userId);
		userDTO.setUserPw(userPw);
		userDTO.setUserPhone(userPhone);
		model.addAttribute("userDTO",userDTO);
		
		loginServiceImpl.add(model);
		
		return "join3";
	}
	
	/* 로그인 */
	// 로그인 페이지
	@RequestMapping(value = "login")
	public String login() {
		return "login";
	}
	// 로그인 기능
	@RequestMapping(value = "user_login")
	public String user_login(HttpServletRequest request, Model model) {
		String userId =request.getParameter("id");
		String userPw = request.getParameter("pw");
		
		model.addAttribute("userId",userId);
		model.addAttribute("userPw",userPw);
		
		loginServiceImpl.find(model);
		
		Map<String, Object> map = model.asMap();
		UserDTO userInfo= (UserDTO)map.get("userInfo");
		
		if(userInfo!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("user_info", userInfo);
			return "forward:index";
		}else {
			model.addAttribute("loginText", "아이디와 비밀번호를 다시 확인 해 주세요");
			return "login";
		}
	}
	// 로그아웃
	@RequestMapping(value = "logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user_info");
		return "index";

	}
	
	/* 아이디, 비밀번호 찾기 */
	// 아이디, 비밀번호 찾기 페이지
	@RequestMapping(value = "find")
	public String find() {
		return "find";
	}
	// 아이디 찾기
	@RequestMapping(value = "find_id")
	public String find_id(HttpServletRequest request, Model model) {
		String userPhone=request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
		model.addAttribute("userPhone",userPhone);
		loginServiceImpl.find(model);
		
		return "find_id";
	}
	// 비밀번호 찾기
	@RequestMapping(value = "find_pw")
	public String find_pw(HttpServletRequest request, Model model) {
		String userId= request.getParameter("id");
		String userPhone=request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
		
		model.addAttribute("userId",userId);
		model.addAttribute("userPhone",userPhone);
		loginServiceImpl.find(model);
		
		return "find_pw";
	}
	// 비밀번호 찾기 - 비밀변호 변경
	@RequestMapping(value = "newPw")
	public String newPw(HttpServletRequest request, Model model) {
		String userId =request.getParameter("id");
		String newPw = request.getParameter("pw");
		
		model.addAttribute("userId",userId);
		model.addAttribute("userPw",newPw);
		
		loginServiceImpl.modify(model);
		
		return "login";
	}
	// 회원정보 수정
	@RequestMapping(value = "user_modify")
	private String user_modify(HttpServletRequest request, Model model) {
		String userId =request.getParameter("user_info_id");
		String newPw = request.getParameter("user_info_pw");
		String newPhone = request.getParameter("user_info_phone1")+
						request.getParameter("user_info_phone2")+
						request.getParameter("user_info_phone3");
		model.addAttribute("userId",userId);
		model.addAttribute("userPw",newPw);
		model.addAttribute("userPhone",newPhone);
		
		loginServiceImpl.modify(model);

		return "index";
	}
	
	

	
}
