<%@page import="board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%
	Board board = (Board)request.getAttribute("board");
%>
<script>

function fileDownload(oName, rName){
	console.log(oName, rName);
	location.href = "<%= request.getContextPath()%>/board/fileDownload?oName=" + oName + "&rName=" + rName;
}
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />
<section id="board-container">
	<h2>게시판</h2>
	<table id="tbl-board-view">
		<tr>
			<th>글번호</th>
			<td><%=board!=null?board.getBoardNo():"" %></td>
		</tr>
		<tr>
			<th>제 목</th>
			<td><%=board!=null?board.getBoardTitle():"" %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=board!=null?board.getBoardWriter():"" %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=board!=null?board.getBoardReadCount():"" %></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<%--첨부파일이 있을경우만, 이미지와 함께 original파일명 표시--%>
				<%if(board.getBoardOriginalFileName()!=null){ %>
				<a href="javascript:fileDownload('<%=board.getBoardOriginalFileName()%>', '<%=board.getBoardRenamedFileName()%>')"><%-- 링크 자리이므로, 자바스크립트 접두어를 붙여야 함 --%>
					<img alt="첨부파일" src="<%=request.getContextPath() %>/images/file.png" width=16px>
					<%=board.getBoardOriginalFileName()%>
				</a>
				<%} %>
			</td>
		</tr>
		<tr>
			<th>내 용</th>
			<td><%=board!=null?board.getBoardContent():"" %></td>
		</tr>
		<tr>
			<%-- 작성자와 관리자만 마지막행 수정/삭제버튼이 보일수 있게 할 것 --%>		
 			<% if(
				memberLoggedIn != null
		 		&& (memberLoggedIn.getMemberId().equals(board.getBoardWriter())
			 	|| MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole()))
			){ %>
 				<th colspan="2">
				<input type="button" value="수정하기" onclick="updateBoard();"/> 
				<input type="button" value="삭제하기" onclick="deleteBoard();"/>
			</th>
		</tr>
		<script>
		function updateBoard(){
			$("[name=boardUpdateFrm]").submit();	
		}
		
		function deleteBoard(){
			if(confirm("이 게시물을 삭제하시겠습니까?")){
				$("[name=boardDelFrm]").submit();	
			}
		}
		</script>
		<form 
			action="<%= request.getContextPath()%>/board/boardDelete"
			method="POST"
			name="boardDelFrm">
			<input type="hidden" name="boardNo" value="<%= board.getBoardNo() %>" />
			<input type="hidden" name="rName" value="<%=board.getBoardRenamedFileName() != null ? board.getBoardRenamedFileName() : "" %>" />
		</form>
		<form 
			action="<%= request.getContextPath()%>/board/boardUpdate"
			method="GET"
			name="boardUpdateFrm">
			<input type="hidden" name="boardNo" value="<%= board.getBoardNo() %>" />
			<input type="hidden" name="boardWriter" value="<%= board.getBoardWriter()%>" />
			<input type="hidden" name="boardTitle" value="<%= board.getBoardTitle()%>" />
			<input type="hidden" name="boardContent" value="<%= board.getBoardContent()%>" />
<%-- 		<input type="hidden" name="rName" value="<%=board.getBoardRenamedFileName() != null ? board.getBoardRenamedFileName() : "" %>" /> --%>
		</form>
		<%} %>
	</table>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
