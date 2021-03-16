<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Format</h1>
	<h2>숫자</h2>
	<c:set var="num1">1234567890</c:set>
	<c:set var="num2">123.4567</c:set>
	<ul>
		<li>
			<fmt:formatNumber value="${num1}" pattern="#,###"/>
		</li>
		<li>
			<fmt:setLocale value="ko_kr"/>
			<fmt:formatNumber value="${num1}" type="currency"/>			
		</li>
		<li>
			<fmt:formatNumber value="${num2}" pattern="#.##"/>
<!-- 			버림처리. Object로 가져오는데, 바로 Double로 못 바꾸므로, String 바꾸고 Double로 바꿈-->
			<fmt:formatNumber value='<%= Math.floor(Double.valueOf((String)pageContext.getAttribute("num2")) * 100) / 100 %>' pattern="#.##"/>
		</li>
		<li>
			<fmt:formatNumber value="0.015" type="percent" maxFractionDigits="2"/>
		</li>
	</ul>
	
	<h2>날짜 시각</h2>
	<c:set var="now" value="<%=new Date() %>"/>
	<ul>
		<li>
<%-- 			<fmt:formatDate value="${now}"/> --%>
<!-- 			시간까지 보려면 아래처럼 -->
			<fmt:formatDate value="${now}" type="both"/>
		</li>
		<li>
			<fmt:formatDate value="${now}" pattern="yyyy/MM/dd(E) HH:mm:ss"/>
		</li>
	</ul>
</body>
</html>










