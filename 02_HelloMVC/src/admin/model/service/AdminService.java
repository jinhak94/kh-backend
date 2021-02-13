package admin.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import admin.model.dao.AdminDao;
import member.model.vo.Member;

public class AdminService {
	AdminDao adminDao = new AdminDao();
	
	public List<Member> selectList() {
		//1.Connection객체 생성
		Connection conn = getConnection();
		//2.dao요청
		List<Member> list = adminDao.selectList(conn);
		//3.트랜잭션관리(DML만)
		//4.자원반납
		close(conn);
		return list;
	}

	public int updateMemberRole(String memberId, String memberRole) {
		Connection conn = getConnection();
		int chk = adminDao.updateMemberRole(conn, memberId, memberRole);
		if(chk>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return chk;
	}

	public List<Member> selectMemberBy(String searchType, String searchKeyword) {
		Connection conn = getConnection();
		List<Member> list = adminDao.selectMemberBy(conn, searchType, searchKeyword);				
		return list;
	}

}
