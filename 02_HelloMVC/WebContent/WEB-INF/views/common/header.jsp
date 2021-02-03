<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello MVC</title>
<%--application별칭(context-root, context-path)를 동적으로 얻어오기 /mvc --%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" />
<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<script>
$(function(){
	console.log("jquery loading complete!");
});
</script>
</head>
<body>
	<div id="container">
		<header>
			<h1>Hello MVC</h1>
		</header>
		
		<section id="content">