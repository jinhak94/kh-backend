package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import board.model.vo.BoardComment;

public class BoardService {
	private BoardDao boardDao = new BoardDao();

	public List<Board> selectBoardList(Map<String, Object> param) {
		//1.Connection객체 생성
		Connection conn = getConnection();
		//2.dao요청
		List<Board> list = boardDao.selectBoardList(conn, param);
		//3.트랜잭션관리(DML만)
		//4.자원반납
		close(conn);
		return list;
	}

	public int selectTotalBoards(Map<String, Object> param) {
		Connection conn = getConnection();
		int totalContents = boardDao.selectTotalBoards(conn);
		close(conn);
		return totalContents;
	}

	public int insertBoard(Board board) {
		Connection conn = getConnection();
		int chk = boardDao.insertBoard(conn, board);
		if(chk>0) {
			int boardNo = boardDao.selectLastBoardNo(conn);
			//board의 주소값을 넘긴 것이기 때문에, 
			//service과 servlet에서 사용하는 객체는 같은 객체.
			//service에서 바꿔도, servlet에서 사용 가능.
			board.setBoardNo(boardNo);
			commit(conn);
		}
		else 
			rollback(conn);
		close(conn);
		return chk;
	}

	public Board selectOne(int boardNo) {
		Connection conn = getConnection();
		Board board = boardDao.selectOne(conn, boardNo);
		close(conn);
		return board;
	}

	public int updateBoardReadCount(int boardNo) {
		Connection conn = getConnection();
		int result = boardDao.updateBoardReadCount(conn, boardNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int deleteBoard(int boardNo) {
		Connection conn = getConnection();
		int result = boardDao.deleteBoard(conn, boardNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int updateBoard(Board board) {
		Connection conn = getConnection();
		int result = boardDao.updateBoard(conn, board);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int insertBoardComment(BoardComment bc) {
		Connection conn = getConnection();
		int result = boardDao.insertBoardComment(conn, bc);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<BoardComment> selectBoardCommentList(int boardNo) {
		//1.Connection객체 생성
		Connection conn = getConnection();
		//2.dao요청
		List<BoardComment> list = boardDao.selectBoardCommentList(conn, boardNo);
		//3.트랜잭션관리(DML만)
		//4.자원반납
		close(conn);
		return list;
	}

	public int boardCommentDelete(int boardCommentNo) {
		Connection conn = getConnection();
		int result = boardDao.boardCommentDelete(conn, boardCommentNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}
