<%@page import="board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Board> list = (List<Board>)request.getAttribute("list");
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />
<section id="board-container">
	<h2>게시판 </h2>
	<table id="tbl-board">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>첨부파일</th><%--첨부파일이 있는 경우(board_renamed_filename등이 null이 아닌 경우) /images/file.png 표시 width:16px --%>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
		<% if(list==null || list.isEmpty()){ %>
			<tr>
				<td colspan="6" style="text-align:center;">
					조회된 결과가 없습니다.
				</td>			
			</tr>
		<%}else{
			for(Board b : list){%>
			<tr>
				<td><%= b.getBoardNo()%></td>
				<td><%= b.getBoardTitle()%></td>
				<td><%= b.getBoardWriter()%></td>
				<td><%= b.getBoardDate()%></td>
				<td><%= b.getBoardOriginalFileName() != null ? "<img src='/images/file.png'>" : ""%></td>
				<td><%= b.getBoardReadCount()%></td>
			</tr>
		<%} 
		}%>
		</tbody>
	</table>

	<div id="pageBar">
		<%= request.getAttribute("pageBar") %>
	</div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
