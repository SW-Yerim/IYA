package com.iya.board.dao;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.iya.board.dto.UserDTO;

@Repository
public class UserDAO {
	
	private JdbcTemplate template;

	public UserDAO(JdbcTemplate template) {
		this.template = template;
	}

	// 유저 정보 확인
	public UserDTO userInfo(UserDTO userDTO) {
		String sql=null;
		String id = userDTO.getUserId();
		String pw = userDTO.getUserPw();
		String phone = userDTO.getUserPhone();
		
		if (id != null && pw == null && phone == null) { 		 	// 아이디 중복 확인
			sql = "SELECT * FROM iyauser WHERE userid='" + id + "'";
		} else if (id != null && pw != null && phone == null) {  	// 로그인
			sql = "SELECT * FROM iyauser WHERE userid='" + id + "' AND userpw='" + pw + "'";
		} else if (id == null && pw == null && phone != null) {		// 아이디 찾기
			sql = "SELECT * FROM iyauser WHERE userphone='" + phone + "'";
		} else if (id != null && pw == null && phone != null) {		// 비밀번호 찾기
			sql = "SELECT * FROM iyauser WHERE userid='" + id + "' AND userphone='" + phone + "'";
		}
		
		UserDTO userInfo = null;
		
		try {
			userInfo= template.queryForObject(sql, new BeanPropertyRowMapper<UserDTO>(UserDTO.class));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userInfo;
	}

	// 회원가입
	public void add(UserDTO userDTO) {
		String sql = "INSERT INTO iyauser VALUES ('"+userDTO.getUserId()+"','"+userDTO.getUserPw()+"','"+userDTO.getUserPhone()+"')";
		System.out.println(sql);
		
		try {
			template.update(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	// 유저 정보 수정
	public void modify(UserDTO userDTO) {
		String sql=null;
		String id = userDTO.getUserId();
		String pw = userDTO.getUserPw();
		String phone = userDTO.getUserPhone();
		if (id != null && pw != null && phone == null) {  // 비밀번호 변경
			sql = "UPDATE iyauser SET userpw='" + pw + "' WHERE userid='" + id + "'";
		} else if (id != null && pw != null && phone != null) {	// 회원정보 수정
			sql = "UPDATE iyauser SET userpw='" + pw + "', userPhone='" + phone + "' WHERE userid='" + id + "'";
		}
		try {
			template.update(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
