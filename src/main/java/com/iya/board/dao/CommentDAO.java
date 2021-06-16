package com.iya.board.dao;

import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.iya.board.dto.CommentDTO;
import com.iya.board.dto.UpDownDTO;
import com.iya.board.dto.BoardDTO;
@Repository
public class CommentDAO {
	private JdbcTemplate template;

	public CommentDAO(JdbcTemplate template) {
		this.template = template;
	}

	public void add(String userId, String boardNum, String groupNum, String cContent) {
		String sql1="";
		String sql2="";
		
		// 댓글 작성
		if(groupNum.equals("-1")) {
			sql1="UPDATE boardComment SET groupNum=groupNum+1 WHERE boardNum="+boardNum;
			sql2="INSERT INTO boardComment VALUES("+boardNum+",0,0,'"+userId+"','"+cContent+"',0,0,sysdate)";
		}else {		// 대댓글 작성
			sql1="UPDATE boardComment SET sortNum=sortNum+1 WHERE boardNum="+boardNum+" AND groupNum="+groupNum+" AND sortNum > 0";
			sql2="INSERT INTO boardComment VALUES("+boardNum+","+groupNum+",1,'"+userId+"','"+cContent+"',0,0,sysdate)";
		}
		
		try {
			template.update(sql1);
			template.update(sql2);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<CommentDTO> print(String boardNum) {
		String sql="SELECT * FROM boardComment WHERE boardnum="+boardNum+" ORDER BY groupNum DESC , DECODE(sortNum,0,1),sortNum DESC";
		ArrayList<CommentDTO> list = null;
		try {
			list = (ArrayList<CommentDTO>)template.query(sql, new BeanPropertyRowMapper<CommentDTO>(CommentDTO.class));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	


	// 댓글수
	public int[] commentNum(ArrayList<BoardDTO> list) {
		int[] commentCount=new int[list.size()] ;
		int i=0;
		for (BoardDTO boardDTO : list) {
			String sql="SELECT COUNT(*) FROM boardComment WHERE boardNum ="+ boardDTO.getBoardnum();
			try {
				commentCount[i]= template.queryForObject(sql, Integer.class);
				i++;
			} catch (Exception e) {
				e.printStackTrace();

			}
			
		}
		
		return commentCount;
	}

	public void delete(String boardNum) {
		String sql = "DELETE FROM boardComment WHERE boardNum="+boardNum;
		
		try {
			template.update(sql);
		} catch (Exception e) {e.printStackTrace();}
		
		
	}

	public void delete(String boardNum, String groupNum, String sortNum) {
		String sql="";
		if(sortNum.equals("0")) {
			sql = "UPDATE boardComment SET CCONTENT= '삭제된 댓글입니다.' WHERE boardNum="+boardNum+" AND groupNum="+groupNum+" AND sortNum="+sortNum;
		}else {
			sql = "DELETE FROM boardComment WHERE boardNum="+boardNum+" AND groupNum="+groupNum+" AND sortNum="+sortNum;
		}
		try {
			template.update(sql);
		} catch (Exception e) {e.printStackTrace();}
	}

	public void updown(String boardNum, String userId, String updown) {
		String sql = "INSERT INTO updown VALUES ("+boardNum+",'"+userId+"',"+updown+")";
		
		try {
			template.update(sql);
		} catch (Exception e) {e.printStackTrace();}
		
	}
	public int up(String boardNum, String userId) {
		String sql = "SELECT COUNT(*) FROM updown WHERE boardNum="+boardNum+" AND userId='"+userId+"' AND updown=1";
		try {
			return template.queryForObject(sql, Integer.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int down(String boardNum, String userId) {
		String sql = "SELECT COUNT(*) FROM updown WHERE boardNum="+boardNum+" AND userId='"+userId+"' AND updown=2";
		try {
			return template.queryForObject(sql, Integer.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int upCount(String boardNum) {
		String sql = "SELECT COUNT(*) FROM updown WHERE boardNum="+boardNum+" AND updown=1";
		try {
			return template.queryForObject(sql, Integer.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int downCount(String boardNum) {
		String sql = "SELECT COUNT(*) FROM updown WHERE boardNum="+boardNum+" AND updown=2";
		try {
			return template.queryForObject(sql, Integer.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
