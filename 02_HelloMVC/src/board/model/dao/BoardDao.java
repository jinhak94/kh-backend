package board.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import board.model.vo.Board;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		//WEB-INF/classes가 루트임.... Build Path에서 찾는 것임.
		String fileName = "/sql/board/board-query.properties";
		//절대경로
		String path = BoardDao.class.getResource(fileName).getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Board> selectBoard(Connection conn, Map<String, Object> param) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectBoard");

		List<Board> list = new ArrayList<Board>();
		Board board = null;
		// select * 
		// from
			//( select M.*, row_number() 
			//	over(order by board_date desc) rnum 
			//	from board ) where rnum between ? and ?
		int cpage = (int)param.get("cpage");
		int numPerPage = (int)param.get("numPerPage");
		
		try {
			//1.PreparedStatement객체생성(미완성쿼리 값대입)
			pstmt = conn.prepareStatement(query);
			//1 : 1~5  2 : 6~10   3 : 11~15   
			pstmt.setInt(1, (cpage-1)*numPerPage+1); //시작 rnum
			pstmt.setInt(2, cpage*numPerPage); //마지막 rnum
			//2.Statement실행 및 결과처리:ResultSet -> Member
			rset = pstmt.executeQuery();
			while(rset.next()) {
				board = new Board();
				board.setBoardNo(rset.getInt("board_no"));
				board.setBoardTitle(rset.getString("board_title"));
				board.setBoardWriter(rset.getString("board_writer"));
				board.setBoardContent(rset.getString("board_content"));
				board.setBoardOriginalFileName(rset.getString("board_original_filename"));
				board.setBoardRenamedFileName(rset.getString("board_renamed_filename"));
				board.setBoardDate(rset.getDate("board_date"));
				board.setBoardReadCount(rset.getInt("board_read_count"));
				list.add(board);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//3.자원반납(ResultSet, PreparedStatement)
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int selectTotalBoards(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectTotalBoards");
		int totalContents= 0;
		//System.out.println("query@dao = " + query);
		
		try {
			//1.PreparedStatement객체생성(미완성쿼리 값대입)
			pstmt = conn.prepareStatement(query);
			//2.Statement실행 및 결과처리:ResultSet -> Member
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalContents = rset.getInt(1); //컬럼순서로 가져옴.
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//3.자원반납(ResultSet, PreparedStatement)
			close(rset);
			close(pstmt);
		}
		return totalContents;
	}
}
