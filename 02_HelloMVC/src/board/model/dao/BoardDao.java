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
import board.model.vo.BoardComment;
import board.model.vo.BoardExt;

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
	
	public int selectBoardComment(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectBoardComment");

		int result = 0;
		//select count(*) from board_comment where board_ref = ?
		
		try {
			//1.PreparedStatement객체생성(미완성쿼리 값대입)
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no); //시작 rnum

			//2.Statement실행 및 결과처리:ResultSet -> Member
			rset = pstmt.executeQuery();
			if(rset.next()){
				result = rset.getInt(1);	
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

		return result;
	}

	public List<Board> selectBoardList(Connection conn, Map<String, Object> param) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectBoardList");

		List<Board> list = new ArrayList<Board>();
		BoardExt be = null;
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
				be = new BoardExt();
				be.setBoardNo(rset.getInt("board_no"));
				be.setBoardTitle(rset.getString("board_title"));
				be.setBoardWriter(rset.getString("board_writer"));
				be.setBoardContent(rset.getString("board_content"));
				be.setBoardOriginalFileName(rset.getString("board_original_filename"));
				be.setBoardRenamedFileName(rset.getString("board_renamed_filename"));
				be.setBoardDate(rset.getDate("board_date"));
				be.setBoardReadCount(rset.getInt("board_read_count"));
				int count = selectBoardComment(conn, rset.getInt("board_no"));
				be.setBoardCommentCount(count);
				//게시글별 댓글의 수를 가져와서 VO 객체에 담기 : commentCnt 필드 추가
				
				list.add(be);
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

	public int insertBoardComment(Connection conn, BoardComment bc) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("insertBoardComment");
		//insert into board_comment values(seq_board_comment_no.nextval, ?, ?, ?, ?, ?, default)
		
		try {
			//1.PreparedStatement객체생성(미완성쿼리 값대입)
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bc.getBoardCommentLevel());
			pstmt.setString(2, bc.getBoardCommentWriter());
			pstmt.setString(3, bc.getBoardCommentContent());
			pstmt.setInt(4, bc.getBoardRef());
			//아래와 같이 하면 안된다. db에서는 number 컬럼에 null도 올 수 있음
			//하지만 자바에서는 int에 null 올 수 없고, Integer에 와야 한다.
//			pstmt.setInt(5,  bc.getBoardCommentRef() != 0 ? bc.getBoardCommentRef() : null); //댓글인 경우 0번 댓글을 참조
			pstmt.setObject(5, bc.getBoardCommentRef() != 0 ? bc.getBoardCommentRef() : null);
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

	public List<BoardComment> selectBoardCommentList(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectBoardCommentList");
		//select * from board_comment where board_ref = ?
		
		List<BoardComment> list = new ArrayList<BoardComment>();
		BoardComment bc = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
		/*
			   private int boardCommentNo;
			   private int boardCommentLevel;
			   private String boardCommentWriter;
			   private String boardCommentContent;
			   private int boardRef;
			   private int boardCommentRef;
			   private Date boardCommentDate;
			*/
			/*
			 *     board_comment_no number,                    -- pk 고유번호
    				board_comment_level number default 1,   -- 댓글 1, 대댓글 2
    				board_comment_writer varchar2(15),          -- member.member_id fk
    				board_comment_content varchar2(2000),   
    				board_ref number,                                   -- board.board_no fk
    				board_comment_ref number,                     -- board_comment.board_comment_no  댓글 null, 대댓글때만 사용
    				board_comment_date date default sysdate,
			 */
			rset = pstmt.executeQuery();
			while(rset.next()) {
				bc = new BoardComment();
				bc.setBoardCommentNo(rset.getInt("board_comment_no"));
				bc.setBoardCommentLevel(rset.getInt("board_comment_level"));
				bc.setBoardCommentWriter(rset.getString("board_comment_writer"));
				bc.setBoardCommentContent(rset.getString("board_comment_content"));
				bc.setBoardRef(rset.getInt("board_ref"));
				bc.setBoardCommentRef(rset.getInt("board_comment_ref"));
				bc.setBoardCommentDate(rset.getDate("board_comment_date"));
				
				list.add(bc);
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

	public int boardCommentDelete(Connection conn, int boardCommentNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("boardCommentDelete");
		//delete from board_comment where board_comment_no = ?
		
		try {
			//1.PreparedStatement객체생성(미완성쿼리 값대입)
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardCommentNo);
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
