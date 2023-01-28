package com.farmeasy.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class FarmBoardDao implements FarmRepository{

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private class EmpMapper implements RowMapper<FarmVO>{

		@Override
		public FarmVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			FarmVO emp = new FarmVO();
			emp.setBoard_id(rs.getInt("board_id"));
			emp.setM_id(rs.getString("m_id"));
			emp.setFe_type(rs.getString("fe_type"));
			emp.setBoard_title(rs.getString("board_title"));
			emp.setBoard_content(rs.getString("board_content"));
			emp.setInsert_date(rs.getString("insert_date"));
			emp.setUpdate_date(rs.getString("update_date"));
			emp.setBoard_hits(rs.getInt("board_hits"));
			emp.setBGroup(rs.getInt("bGroup"));
			emp.setBStep(rs.getInt("bStep"));
			emp.setBIndent(rs.getInt("bIndent"));
			return emp;
		}
	}
	
	
	private class CommentMappler implements RowMapper<FarmCommentVo>{

		@Override
		public FarmCommentVo mapRow(ResultSet rs, int rowNum) throws SQLException {
			FarmCommentVo cmp = new FarmCommentVo();
			cmp.setReply_id(rs.getInt("reply_id"));
			cmp.setBoard_id(rs.getInt("board_id"));
			cmp.setM_id(rs.getString("m_id"));
			cmp.setReply_content(rs.getString("reply_content"));
			cmp.setReply_bundle(rs.getInt("reply_bundle"));
			cmp.setReply_order(rs.getInt("reply_order"));
			cmp.setReply_level(rs.getInt("reply_level"));
			cmp.setInsert_date(rs.getString("insert_date"));
			cmp.setUpdate_date(rs.getString("update_date"));
			return cmp;
		}
	}
	
	@Override
	public void write(FarmVO fVo) {
			String query = "insert into tmp_board(board_id, m_id , board_title, board_content, "
					+ "board_hits, bGroup, bStep, bIndent) "
					+ "values (board_id.nextval,?,?,?,"
					+ "0, board_id.currval, 0, 0)";
			System.out.println("write에서 값 : "+fVo.getM_id() + " " + fVo.getBoard_title() + " " + fVo.getBoard_content()
			+" " + fVo.getBoard_id()); 
			jdbcTemplate.update(query, fVo.getM_id(), fVo.getBoard_title(), fVo.getBoard_content());
	}
	
   @Override
   public void insertTest() {
      String sql = "insert into tmp_board(board_id, m_id , board_title, board_content, "
				+ "board_hits, bGroup, bStep, bIndent) "
				+ "values (board_id.nextval, 'nacho', '테스트','테스트',"
				+ "0, board_id.currval, 0, 0)";      
      jdbcTemplate.update(sql);
   }

//	답변 작성
   @Override
   public void replyWrite(FarmVO fVo) {
	   System.out.println("답변쓰기쿼리에서의 getBGroup : "+fVo.getBGroup());
	   replyShape(fVo.getBGroup(), fVo.getBStep());
	   String query = "insert into tmp_board(board_id, m_id , board_title, board_content, "
				+ "board_hits, bGroup, bStep, bIndent) "
				+ "values (board_id.nextval,?,?,?,"
				+ "0, ?, ?, ?)";
		System.out.println("reply에서 값 : "+fVo.getM_id() + " " + fVo.getBoard_title() + " " + fVo.getBoard_content()
		+" 보드 아이디 " + fVo.getBoard_id() + " 비그룹: "+fVo.getBGroup() +" "+fVo.getBStep()+1 +" "+ fVo.getBIndent()+1);
		
		jdbcTemplate.update(query, fVo.getM_id(), fVo.getBoard_title(), fVo.getBoard_content()
				, fVo.getBGroup(), fVo.getBStep()+1, fVo.getBIndent()+1);
   }
   
   private void replyShape(int strGroup, int strStep) {
		String query = "update tmp_board set bStep = bStep + 1 where bGroup = ? and bStep > ?";
		jdbcTemplate.update(query, strGroup, strStep);
	}

	@Override
	public ArrayList<FarmVO> getBoardList(int p) {
		String query ="SELECT * " + 
				"FROM( SELECT ROW_NUMBER() OVER (ORDER BY bGroup desc, bStep asc)AS rn," + 
				" board_id, m_id, fe_type, board_title, board_content, insert_date, update_date, board_hits, bGroup, bStep, bIndent" + 
				" FROM tmp_board) " + 
				"WHERE rn between ? and ?";
		System.out.println("쿼리문 : " + p);
		int page1 = 1+(p-1)*10;
	    int page2 = p*10;
	    System.out.println("page1 : "+page1);
	    System.out.println("page2 : "+page2);
		return (ArrayList<FarmVO>)jdbcTemplate.query(query, new EmpMapper(),page1,page2);
	}
	
	@Override
	public ArrayList<FarmCommentVo> listComment(int board_id) {
		String query = " select * from fe_reply where board_id=? order by reply_order";
		return (ArrayList<FarmCommentVo>) jdbcTemplate.query(query, new CommentMappler(), board_id);
	}

	@Override
	public FarmVO contentView(int board_id) {
		upHit(board_id);
		String query = "select * from tmp_board where board_id=?";
		return jdbcTemplate.queryForObject(query, new EmpMapper(), board_id);
	}
	
	@Override
	public FarmVO replyView(int board_id) {
		String query = "select * from tmp_board where board_id=?";
		return jdbcTemplate.queryForObject(query, new EmpMapper(), board_id);
	}
	

	@Override
	public void insertComment(FarmCommentVo commentVo) {
		String query = "insert into fe_reply(reply_id, board_id, m_id, reply_bundle, reply_order, reply_level, reply_content) " + 
				"values(fe_reply_seq.nextval,?,?,fe_reply_seq.currval,?,?,?)";
		jdbcTemplate.update(query, commentVo.getBoard_id(),commentVo.getM_id() ,commentVo.getReply_order(), commentVo.getReply_level(), commentVo.getReply_content());
	}
	
	@Override
	public int getTotal() {
		String query = "select count(*) from tmp_board";
		int total = jdbcTemplate.queryForObject(query, Integer.class);
		System.out.println("getTotal 토탈 : "+total);
		return total;
	}
	
	
	private void upHit(int board_id) {
		String query = "update tmp_board set board_hits = board_hits+1 where board_id = ?";
		jdbcTemplate.update(query, board_id);
	}


	@Override
	public void boardDelete(int board_id) {
		String query ="delete from tmp_board where board_id=?";
		jdbcTemplate.update(query,board_id);
	}


	@Override
	public void boardUpdate(FarmVO fvo) {
		String query ="update tmp_board set board_title=?, board_content=?, update_date=to_char(sysdate, 'yyyy.mm.dd') where board_id=?";
		jdbcTemplate.update(query, fvo.getBoard_title(), fvo.getBoard_content(), fvo.getBoard_id());
	}


	@Override
	public FarmVO contentViewUpdate(int board_id) {
		String query = "select * from tmp_board where board_id=?";
		return jdbcTemplate.queryForObject(query, new EmpMapper(), board_id);
	}


	
}
