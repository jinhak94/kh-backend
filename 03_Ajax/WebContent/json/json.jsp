<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ajax-json</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
.box{
	margin : 10px 0;
}
</style>
</head>
<body>
	<h1>JSON</h1>
	<h2>회원목록 조회</h2>
	<input type="button" value="실행" id="btn1"/>
	<div class="box" id="result1"></div>
	<script>
	$("#btn1").click(function(){
		$.ajax({
			url : "<%=request.getContextPath()%>/json/memberList",
			method : "GET",
			dataType : "json",
			success : function(data){
				console.log(data);
			},
			error : function(xhr, textStatus, err){
				console.log(xhr, textStatus, err);
			}
		});
	});
	</script>
</body>
</html>