package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import board.model.dao.BoardDao;
import board.model.vo.Board;

public class BoardService {
	private BoardDao boardDao = new BoardDao();

	public List<Board> selectBoard(Map<String, Object> param) {
		//1.Connection객체 생성
		Connection conn = getConnection();
		//2.dao요청
		List<Board> list = boardDao.selectBoard(conn, param);
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
	
}
