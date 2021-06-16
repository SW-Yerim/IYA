package com.iya.board.dao;

import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.iya.board.dto.BoardDTO;

@Repository
public class IndexDAO {
	private JdbcTemplate template;

	public IndexDAO(JdbcTemplate template) {
		this.template = template;
	}
	
	public ArrayList<BoardDTO> indexList() {
		
		String sql = "SELECT * FROM iyaboard ORDER BY viewnum";
		
		ArrayList<BoardDTO> list = null;
		
		try {
			list = (ArrayList<BoardDTO>)template.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
