package com.iya.board.dao;

import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.iya.board.dto.BoardDTO;

@Repository
public class BoardDAO {
	private JdbcTemplate template;

	public BoardDAO(JdbcTemplate template) {
		this.template = template;
	}
	
	
	public String sqlResult(String cate1, String cate2, String search1, String search2) {
		
		String search="";
		
		// 카테고리
		if(cate1==null||cate1.equals("")||cate1.equals("0"))
			cate1="cate1 ";
		if(cate2==null||cate2.equals(""))
			cate2="cate2 ";
		
		// 검색
		if (search1==null||search1.equals("")||search2.equals("")){
			search="";
		}else if(search1.equals("1")) {
			search = " AND BOARDTITLE LIKE '%"+search2+"%' ";
		}else if(search1.equals("2")) {
			search = " AND BOARDCONTENT LIKE '%"+search2+"%' ";
		}else if(search1.equals("3")) {
			search = " AND USERID LIKE '%"+search2+"%' ";
		}else if(search1.equals("4")) {
			search = " AND BOARDTITLE LIKE '%"+search2+"%' OR BOARDCONTENT LIKE '%"+search2+ "%' ";
		}
		
		return "WHERE cate1="+cate1+" AND cate2="+cate2 + search;
		
	}
	
	public ArrayList<BoardDTO> print(String cate1, String cate2, String search1, String search2, String paging) {
		
			int pag=0;
			
			if(paging==null)
				pag=1;
			else
				pag=Integer.parseInt(paging);
			
			String sql = "SELECT * FROM (SELECT ROWNUM rnum,a.* FROM (SELECT * FROM iyaboard a "
					+ sqlResult(cate1, cate2, search1, search2)
					+ " ORDER BY boardnum DESC )a ) WHERE "
					+ "rnum BETWEEN " + (pag*5-4) + " AND " + (pag*5);
			
		ArrayList<BoardDTO> list = null;

		try {
			list = (ArrayList<BoardDTO>)template.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 게시글 전체 수
	public int boardNum(String cate1, String cate2, String search1, String search2) {
		
		String sql= "SELECT COUNT(*) FROM iyaboard "+ sqlResult(cate1, cate2, search1, search2);
		
		return template.queryForObject(sql, Integer.class);
		
	}


	public BoardDTO detailPrint(String boardNum) {
		String sql="SELECT * FROM iyaboard WHERE boardnum="+boardNum;
		
		BoardDTO dto=null;
		try {
			dto = template.queryForObject(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}


	public void viewNumUp(String boardNum) {
		String sql = "UPDATE iyaboard SET viewnum=viewnum+1 WHERE boardnum="+boardNum;
		
		try {
			template.update(sql);
		} catch (Exception e) {e.printStackTrace();}
	}


	public void add(String userId, String cate1, String cate2, String boardTitle, String boardContent) {
		String sql = "INSERT INTO iyaboard VALUES (boardnum.nextval, '"+userId+"', "+cate1+", "+cate2+", '"+boardTitle+"', '"+boardContent+"', sysdate, 0, 0)";
		
		try {
			template.update(sql);
		} catch (Exception e) {e.printStackTrace();}
		
		
	}


	public void modify(String boardNum, String cate1, String cate2, String boardTitle, String boardContent) {
		String sql = "UPDATE iyaboard SET cate1="+cate1+",cate2="+cate2+",boardTitle='"+boardTitle+"',boardContent='"+boardContent+"' WHERE boardNum="+boardNum;
		
		try {
			template.update(sql);
		} catch (Exception e) {e.printStackTrace();}
		
	}


	public void delete(String boardNum) {
		String sql = "DELETE FROM iyaboard WHERE boardNum="+boardNum;
		
		try {
			template.update(sql);
		} catch (Exception e) {e.printStackTrace();}
		
	}


	public ArrayList<BoardDTO> indexUpPrint() {
		String sql="SELECT a.* FROM iyaboard a, (SELECT * FROM (SELECT boardnum FROM updown where updown=1 group by boardnum order by COUNT(*) desc) where rownum < 6) b WHERE a.boardnum = b.boardnum AND a.boardtime >=sysdate-30";
		ArrayList<BoardDTO> list = null;

		try {
			list = (ArrayList<BoardDTO>)template.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}


	public ArrayList<BoardDTO> indexViewPrint() {
		String sql ="SELECT * FROM  (SELECT * FROM iyaboard WHERE boardtime >= sysdate-30 ORDER BY viewnum DESC) where rownum <6";
		ArrayList<BoardDTO> list = null;

		try {
			list = (ArrayList<BoardDTO>)template.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	public ArrayList<BoardDTO> indexCate11Print() {
		String sql="SELECT * FROM  (SELECT * FROM iyaboard WHERE cate1=1 ORDER BY boardnum DESC) where rownum <6";
		ArrayList<BoardDTO> list = null;

		try {
			list = (ArrayList<BoardDTO>)template.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	public ArrayList<BoardDTO> indexCate12Print() {
		String sql="SELECT * FROM  (SELECT * FROM iyaboard WHERE cate1=2 ORDER BY boardnum DESC) where rownum <6";

		ArrayList<BoardDTO> list = null;

		try {
			list = (ArrayList<BoardDTO>)template.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	public ArrayList<BoardDTO> indexCate13Print() {
		String sql="SELECT * FROM  (SELECT * FROM iyaboard WHERE cate1=3 ORDER BY boardnum DESC) where rownum <6";

		ArrayList<BoardDTO> list = null;

		try {
			list = (ArrayList<BoardDTO>)template.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	

}
