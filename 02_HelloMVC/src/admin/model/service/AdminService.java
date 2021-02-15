package admin.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import admin.model.dao.AdminDao;
import member.model.vo.Member;

public class AdminService {
	AdminDao adminDao = new AdminDao();
	
	public List<Member> selectList(int cpage, int numberPage) {
		//1.Connection객체 생성
		Connection conn = getConnection();
		//2.dao요청
		List<Member> list = adminDao.selectList(conn, cpage, numberPage);
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

	//사용하지 않음
	public List<Member> selectMemberBy(String searchType, String searchKeyword) {
		Connection conn = getConnection();
		List<Member> list = adminDao.selectMemberBy(conn, searchType, searchKeyword);	
		close(conn);
		return list;
	}

	public int selectTotalMembers() {
		Connection conn = getConnection();
		int totalContents = adminDao.selectTotalMembers(conn);
		close(conn);
		return totalContents;
	}

	public List<Member> selectMembersBy(Map<String, Object> param) {
		Connection conn = getConnection();
		List<Member> list = adminDao.selectMembersBy(conn, param);	
		close(conn);
		return list;
	}

	public int selectTotalMembersBy(Map<String, Object> param) {
		Connection conn = getConnection();
		int totalContents = adminDao.selectTotalMembersBy(conn, param);
		close(conn);
		return totalContents;
	}

}
