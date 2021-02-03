<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%
	//server단 처리 : java코드로 연산
	int sum = 0;
	for(int i = 1; i <= 10; i++)
		sum += i;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Test</title>
<script>
	window.onload = function(){
		var sum = 0;
		for(var i = 1; i <= 10; i++){
			sum += i;
		}
		document.querySelector("span#result").innerHTML = sum;
// 		alert('클라이언트 계산이 끝났습니다.');
		
		var date = new Date();
		var year = date.getFullYear();
		var month = new String(date.getMonth()+1);
		var day = new String(date.getDate());
		
 		if(month.length == 1){
			month = "0" + month;
		}
		
		if(day.length ==1){
			day = "0" + day;
		}
 		var time = year+"/"+month+"/"+day

		document.querySelector("#time").innerHTML = time; 
	};
</script>
</head>
<body>
	<%--jsp 주석 : java파일 변환시 생략 --%>
	<!-- html 주석 : client까지 전달되고, 화면처리에서 생략 -->
	<h1>JSP Test</h1>
	<p>1 ~ 10까지의 합 구하기</p>
	<ul>
	<!-- C:\Workspaces\web_server_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\web\org\apache\jsp\jsp -->
		<!-- 세미콜론 찍으면 오류남. 변환된 servlet에서 확인. -->
		<li>서버 : <%-- <%= sum%> --%><%out.print(sum); %></li>
		<li>클라이언트 : <span id="result"></span></li>
	</ul>
	
	<p>시각 표시</p>
	<ul>
		<%  Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
/* 			if(true)
				throw new Exception("ssssssss"); */
		%>
		<li>서버 : <%= format.format(date)%></li>
		<li>클라이언트 : <span id="time"></span></li>
	</ul>

</body>
</html>