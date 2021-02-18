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

import board.model.exception.BoardException;
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
			//에러페이지 확인을 위한 코드
//			pstmt.setInt(4, cpage*numPerPage); //마지막 rnum
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
			
		} catch (Exception e) {
//			e.printStackTrace();
			//런타임예외로 전환해서 다시 던지기
			throw new RuntimeException("게시물 조회 오류 ", e);
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

	public int insertBoard(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("insertBoard");
		int result = 0;
		
		try {
			//1.PreparedStatement객체생성(미완성쿼리 값대입)
			pstmt = conn.prepareStatement(sql);
			//insert into board 
			//values(seq_board_no.nextval,?,?,?,?,?,default,default)
			pstmt.setString(1, board.getBoardTitle());
			pstmt.setString(2, board.getBoardWriter());
			pstmt.setString(3, board.getBoardContent());
			pstmt.setString(4, board.getBoardOriginalFileName());
			pstmt.setString(5, board.getBoardRenamedFileName());
			
			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//3.자원반납(ResultSet, PreparedStatement)
			close(rset);
			close(pstmt);
		}
//		System.out.println("member@dao = " + member);
//		System.out.println("result = " + result);
		return result;
	}

	public Board selectOne(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOne");
		Board board = new Board();
		
		//System.out.println("query@dao = " + query);
		
		try {
			//1.PreparedStatement객체생성(미완성쿼리 값대입)
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			//2.Statement실행 및 결과처리:ResultSet -> Member
			rset = pstmt.executeQuery();
			if(rset.next()) {
				board.setBoardNo(rset.getInt("board_no"));
				board.setBoardTitle(rset.getString("board_title"));
				board.setBoardWriter(rset.getString("board_writer"));
				board.setBoardContent(rset.getString("board_content"));
				board.setBoardOriginalFileName(rset.getString("board_original_filename"));
				board.setBoardRenamedFileName(rset.getString("board_renamed_filename"));
				board.setBoardDate(rset.getDate("board_date"));
				board.setBoardReadCount(rset.getInt("board_read_count"));
			}
		} catch (Exception e) {
			//런타임예외, 구체적인 의미를 가진 예외객체로 전환해서 다시 던지기
			throw new BoardException("게시물 조회 오류", e);
		} finally {
			//3.자원반납(ResultSet, PreparedStatement)
			close(rset);
			close(pstmt);
		}
		return board;
	}

	/**
	 * 게시글 등록 직후, 게시글 번호를 가져온다.
	 */
	public int selectLastBoardNo(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLastBoardNo");
		int boardNo = 0;
		try {
			pstmt=conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next())	
				boardNo = rset.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return boardNo;
	}

	public int updateBoardReadCount(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("updateBoardReadCount");
		int result = 0;
		//update board set board_read_count = board_read_count + 1 where board_no = ?
		try {
			//1.PreparedStatement객체생성(미완성쿼리 값대입)
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//3.자원반납(ResultSet, PreparedStatement)
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int deleteBoard(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("deleteBoard");
		//delete from board where board_no = ?
		int result = 0;

		try {
			//1.PreparedStatement객체생성(미완성쿼리 값대입)
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//3.자원반납(ResultSet, PreparedStatement)
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int updateBoard(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("updateBoard");
		//update board set board_title = ?, board_content = ? where board_no = ?
		int result = 0;
		System.out.println("boardDao@ = " + board.getBoardTitle());
		System.out.println("boardDao@ = " + board.getBoardContent());
		System.out.println("boardDao@ = " + board.getBoardNo());
		try {
			//1.PreparedStatement객체생성(미완성쿼리 값대입)
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getBoardTitle());
			pstmt.setString(2, board.getBoardContent());
			pstmt.setInt(3,  board.getBoardNo());
			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//3.자원반납(ResultSet, PreparedStatement)
			close(rset);
			close(pstmt);
		}
		return result;
	}
}
