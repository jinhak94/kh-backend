<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>    
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />

<!-- 반드시 스크립트 위 onload 함수에 적어야한다.
폼이 모두 등록 완료된 다음에 실행되야 되기 때문에.... -->
<script>
$(function(){
	$("[name=boardEnrollFrm]").submit(boardValidate);
});
/**
* boardEnrollFrm 유효성 검사
*/
function boardValidate(){
	//제목을 작성하지 않은 경우 폼제출할 수 없음.
	var $boardTitle = $('[name=boardTitle]');
	//.는 임의의 아무 글자 1개 이상
	if(/^.{1,}$/.test($boardTitle.val()) == false){
		alert("제목을 입력해주세요.");
		return false;
	}
	//내용을 작성하지 않은 경우 폼제출할 수 없음.
	var $boardContent = $('[name=boardContent]');
	//[]는 한 글자가 표현할 수 있는 범위
	//()는 문자열을 제한할 수 있음. or 연산을 할 수 있음.
	//아무 글자 또는 개행문자가 1개 이상인지 검사
	if(/^(.|\n){1,}$/.test($boardContent.val()) == false){
		alert("내용을 입력해주세요.");
		return false;
	}
	
	return true;
}
</script>
<section id="board-container">
<h2>게시판 작성</h2>
<form
	name="boardEnrollFrm"
	action="<%=request.getContextPath() %>/board/boardEnroll" 
	method="post"
	enctype="multipart/form-data">
	<!-- 파일업로드가 포함된 폼 전송시 필수속성 enctype="multipart/form-data" -->
	<table id="tbl-board-view">
	<tr>
		<th>제 목</th>
		<td><input type="text" name="boardTitle" required></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>
			<input type="text" name="boardWriter" value=<%= memberLoggedIn.getMemberId()%> readonly/>
		</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td>			
			<input type="file" name="upFile">
		</td>
	</tr>
	<tr>
		<th>내 용</th>
		<td><textarea rows="5" cols="40" name="boardContent"></textarea></td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="등록하기" >
		</th>
	</tr>
</table>
</form>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
