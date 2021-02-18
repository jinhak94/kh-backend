package admin.model.dao;

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

import member.model.vo.Member;

public class AdminDao {
	private Properties prop = new Properties();
	
	public AdminDao() {
		//WEB-INF/classes가 루트임.... Build Path에서 찾는 것임.
		String fileName = "/sql/admin/admin-query.properties";
		//절대경로
		String path = AdminDao.class.getResource(fileName).getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Member> selectList(Connection conn, int cpage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectPagedList");
		//select * 
		//from( 
		  		//select M.*, row_number() 
					//over (order by enroll_date desc) 
					//rnum from member M ) M 
		//where rnum between ? and ?
		List<Member> list = new ArrayList<Member>();
		Member member = null;
		
		//System.out.println("query@dao = " + query);
		
		try {
			//1.PreparedStatement객체생성(미완성쿼리 값대입)
			pstmt = conn.prepareStatement(query);
			//1 : 1~10  2 : 11~20   3 : 21~30   12 : 111~120
			pstmt.setInt(1, (cpage-1)*numPerPage+1); //시작 rnum
			pstmt.setInt(2, cpage*numPerPage); //마지막 rnum
			//2.Statement실행 및 결과처리:ResultSet -> Member
			rset = pstmt.executeQuery();
			while(rset.next()) {
				member = new Member();
				member.setMemberId(rset.getString("member_id"));
				member.setPassword(rset.getString("password"));
				member.setMemberName(rset.getString("member_name"));
				member.setMemberRole(rset.getString("member_role"));
				member.setGender(rset.getString("gender"));
				member.setBirthDay(rset.getDate("birthday"));
				member.setEmail(rset.getString("email"));
				member.setPhone(rset.getString("phone"));
				member.setAddress(rset.getString("address"));
				member.setHobby(rset.getString("hobby"));
				member.setEnrollDate(rset.getDate("enroll_date"));
				list.add(member);
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

	public int updateMemberRole(Connection conn, String memberId, String memberRole) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("updateMemberRole");
		// update member set member_role = ? where member_id = ?
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberRole);
			pstmt.setString(2, memberId);
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

	//사용하지 않음
	public List<Member> selectMemberBy(Connection conn, String searchType, String searchKeyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectMemberBy");
		List<Member> list = new ArrayList<Member>();
		Member member = null;
		query = query.replace("#" , searchType);
		//System.out.println("query@dao = " + query);
		
		try {
			//1.PreparedStatement객체생성(미완성쿼리 값대입)
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, searchKeyword);
			//2.Statement실행 및 결과처리:ResultSet -> Member
			rset = pstmt.executeQuery();
			while(rset.next()) {
				member = new Member();
				member.setMemberId(rset.getString("member_id"));
				member.setPassword(rset.getString("password"));
				member.setMemberName(rset.getString("member_name"));
				member.setMemberRole(rset.getString("member_role"));
				member.setGender(rset.getString("gender"));
				member.setBirthDay(rset.getDate("birthday"));
				member.setEmail(rset.getString("email"));
				member.setPhone(rset.getString("phone"));
				member.setAddress(rset.getString("address"));
				member.setHobby(rset.getString("hobby"));
				member.setEnrollDate(rset.getDate("enroll_date"));
				list.add(member);
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

	public int selectTotalMembers(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectTotalMembers");
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

	public List<Member> selectMembersBy(Connection conn, Map<String, Object> param) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String searchType = (String)param.get("searchType");
		String searchKeyword = (String)param.get("searchKeyword");
		String query = prop.getProperty("selectPagedMembersBy");
		int cpage = (int)param.get("cpage");
		int numPerPage = (int)param.get("numPerPage");
		//select * 
		//from
				//( select M.*, row_number() 
					//	over(order by enroll_date desc) rnum 
					//from member M where # like '%'||?||'%' ) 
		//where rnum between ? and ?
		List<Member> list = new ArrayList<Member>();
		Member member = null;
		query = query.replace("#" , searchType);
		//System.out.println("query@dao = " + query);
		
		try {
			//1.PreparedStatement객체생성(미완성쿼리 값대입)
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, searchKeyword);
			pstmt.setInt(2, (cpage-1) * numPerPage + 1);
			pstmt.setInt(3, cpage * numPerPage);
			//2.Statement실행 및 결과처리:ResultSet -> Member
			rset = pstmt.executeQuery();
			while(rset.next()) {
				member = new Member();
				member.setMemberId(rset.getString("member_id"));
				member.setPassword(rset.getString("password"));
				member.setMemberName(rset.getString("member_name"));
				member.setMemberRole(rset.getString("member_role"));
				member.setGender(rset.getString("gender"));
				member.setBirthDay(rset.getDate("birthday"));
				member.setEmail(rset.getString("email"));
				member.setPhone(rset.getString("phone"));
				member.setAddress(rset.getString("address"));
				member.setHobby(rset.getString("hobby"));
				member.setEnrollDate(rset.getDate("enroll_date"));
				list.add(member);
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

	public int selectTotalMembersBy(Connection conn, Map<String, Object> param) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectTotalMembersBy");
		//select count(*) from member where # like ?
		int totalContents= 0;
		
		query = query.replace("#", (String)param.get("searchType"));
		
		try {
			//1.PreparedStatement객체생성(미완성쿼리 값대입)
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, (String)param.get("searchKeyword"));
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
