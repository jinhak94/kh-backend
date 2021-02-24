<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax - text</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function(){
	console.log('jquery loading complete!');
	
	$("#btn").click(function(){
		//ajax 요청 전송
		$.ajax({
<%-- 			url : "<%=request.getContextPath()%>/text/sample.txt", --%>
			url : "<%=request.getContextPath()%>/text", //?name=홍길동&age=30    
			//data : "name=홍길동&age=50",  //data도 결과적으로 url 뒤에 ? 붙여서 넣어줌
			data : {
				name : "신사임당",
				age : 48
			},
			method : "GET", //기본값 GET | POST | PUT | DELETE
			dataType : "text", // xml | json | html | text | script   
			//적지 않아도 스마트하게 dataType 판단해준다
			beforeSend : function(){
				//비동기통신 요청 전 호출되는 함수
				console.log('beforeSend');
			},
			success : function(data){
				//data 매개변수에는 응답결과가 담겨있다.
// 				alert(data);
// 				$('#result').html(data);
				$('#result').text(data);
			},
			error : function(xhr, textStatus, err){
				//처리실패시 호출
				//xhr : XMLHttpRequest에 대한 정보를 갖고 있음
				//textStatus : 현재 상태를 간단한 text로 표시
				//err : 던져진 error 객체
				console.log(xhr, textStatus ,err);
			},
			complete : function(){
				//요청성공/실패와 상관없이 마지막에 호출
				console.log('complete');
			}
		});
	});
});
</script>
<style>
#result{
	width: 500px;
	min-height: 100px;
	background-color: lightgray;
	border: 2px solid gray;
	padding: 5px;
	margin: 5px 0;
}
</style>
</head>
<body>
	<h1>text</h1>
	<input type="button" value="실행" id="btn" />
	<div id="result"></div>
</body>
</html>