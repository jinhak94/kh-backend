<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Action Tag & EL</title>
</head>
<body>
	<h1>Action Tag & EL</h1>
	<h2>Action Tag</h2>
		<h3>Standard Action Tag</h3>
		<ul>
			<li><a href="<%=request.getContextPath()%>/standard/person.do?name=세종&gender=남&age=67&married=false">jsp:useBean</a></li>
			<li><a href="<%=request.getContextPath()%>/standard/include.jsp">jsp:include</a></li>
		</ul>
		
		<h3>JSTL - CustomAction Tag</h3>
		<ul>
			<li><a href="${pageContext.request.contextPath}/jstl/coreBasic.jsp?no1=370&no2=98">core-basic</a></li>
			<li><a href="${pageContext.request.contextPath}/jstl/forEach.do">core - forEach</a></li>
			<li><a href="${pageContext.request.contextPath}/jstl/format.jsp">format</a></li>
			<li><a href="${pageContext.request.contextPath}/jstl/function.jsp">function</a></li>
		</ul>
		
	<h2>EL</h2>
	<ul>
		<li><a href="${pageContext.request.contextPath}/el/basic.do?produceId=p123&amount=33&option=aaaa&option=bbbb">EL Basics</a></li>
<!-- 		출력을 위한 EL이지만 단순 연산도 가능하다. -->
		<li><a href="${pageContext.request.contextPath}/el/operator.jsp">EL Operator</a></li>
	</ul>


</body>
</html>