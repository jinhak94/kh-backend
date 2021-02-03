<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String main = (String)request.getAttribute("main");
	String side = (String)request.getAttribute("side");
	String drink = (String)request.getAttribute("drink");
	int sum = (int)request.getAttribute("sum");
	System.out.println(main);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#main{
		color: blue;
		font-size:2.5em;
	}
	#side{
		color: purple;
		font-size:2em;
	}
	#drink{
		color: green;
		font-size:1.5em;
	}
	#sum{
		color: brown;
		font-size:2.5em;
	}
</style>
</head>
<body>
	<h2>감사합니다.</h2>

	<span id="main"><%=main %>.</span>
	<span id="side"><%=side %>.</span>
	<span id="drink"><%=drink %></span>을/를 주문하셨습니다.<br>
	총 결제금액은 <span id="sum"><%= sum%>원</span> 입니다.

</body>
</html>