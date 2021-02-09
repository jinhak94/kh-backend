package member.model.service;

import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import static common.JDBCTemplate.*;

/**
 * Connection객체생성
 * Dao에 업무로직 하달
 * 트랜잭션처리
 * 자원반납
 */
public class MemberService {

	private MemberDao memberDao = new MemberDao();

	public Member selectOne(String memberId) {
		//1.Connection객체 생성
		Connection conn = getConnection();
		//2.dao요청
		Member member =  memberDao.selectOne(conn, memberId);
		//3.트랜잭션관리(DML만)
		//4.자원반납
		close(conn);
		return member;
	}

	public int insertMember(Member member) {
		Connection conn = getConnection();
		int chk = memberDao.insertOne(conn, member);
		if(chk>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return chk;
	}

	public int updateMember(Member member) {
		Connection conn = getConnection();
		int chk = memberDao.updateOne(conn, member);
		if(chk>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return chk;
	}

	public int deleteMember(String memberId) {
		Connection conn = getConnection();
		int chk = memberDao.deleteOne(conn, memberId);
		if(chk>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return chk;
	}

	public int updatePassword(String encryptedPassword, String memberId) {
		Connection conn = getConnection();
		int chk = memberDao.updatePassword(conn, encryptedPassword, memberId);
		if(chk>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return chk;
	}
}
