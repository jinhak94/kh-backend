<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- id : 저장된 속성의 key값
     class : 해당 객체의 타입
     scope : page(default) | request | session | application
--%>
<jsp:useBean id="person" class="com.kh.person.model.vo.Person" scope="request"></jsp:useBean>

<jsp:useBean id="sinsa" class="com.kh.person.model.vo.Person" scope="page">
	<jsp:setProperty property="name" value="신사임당" name="sinsa"/>
	<jsp:setProperty property="gender" value="여" name="sinsa"/>
	<jsp:setProperty property="age" value="48" name="sinsa"/>
	<jsp:setProperty property="married" value="true" name="sinsa"/>
</jsp:useBean>

<%-- parameter 처리 --%>
<jsp:useBean id="sejong" class="com.kh.person.model.vo.Person" scope="page">
	<%-- param 사용자 입력값 --%>
<%-- 	<jsp:setProperty property="name" param="name" name="sejong"/> --%>
<%-- 	<jsp:setProperty property="gender" param="gender" name="sejong"/> --%>
<%-- 	<jsp:setProperty property="age" param="age" name="sejong"/> --%>
<%-- 	<jsp:setProperty property="married" param="married" name="sejong"/> --%>
		<%-- wildcard *를 이용해 queryString의 key값과 bean 객체의  property 명이 같다면 값대입 처리 --%>
		<jsp:setProperty property="*" name="sejong"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp:useBean</title>
</head>
<body>
	<h1>jsp:useBean</h1>
	<table>
		<tr>
			<th>성명</th>
			<td>
				<%--
					property : getter에서 get을 제외하고, 소문자로 시작하는 단어
					name : useBean 객체의 id값
				 --%>
				<jsp:getProperty property="name" name="person"/>
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<jsp:getProperty property="gender" name="person"/>
			</td>
		</tr>
		<tr>
			<th>나이</th>
			<td>
				<jsp:getProperty property="age" name="person"/>
			</td>
		</tr>
		<tr>
			<th>결혼여부</th>
			<td>
				<jsp:getProperty property="married" name="person"/>
			</td>
		</tr>
	</table>
	<table>
	<caption>sinsa(page)</caption>
		<tr>
			<th>성명</th>
			<td>
				<%--
					property : getter에서 get을 제외하고, 소문자로 시작하는 단어
					name : useBean 객체의 id값
				 --%>
				<jsp:getProperty property="name" name="sinsa"/>
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<jsp:getProperty property="gender" name="sinsa"/>
			</td>
		</tr>
		<tr>
			<th>나이</th>
			<td>
				<jsp:getProperty property="age" name="sinsa"/>
			</td>
		</tr>
		<tr>
			<th>결혼여부</th>
			<td>
				<jsp:getProperty property="married" name="sinsa"/>
			</td>
		</tr>
	</table>
	<table>
	<caption>sejong(param)</caption>
		<tr>
			<th>성명</th>
			<td>
				<%--
					property : getter에서 get을 제외하고, 소문자로 시작하는 단어
					name : useBean 객체의 id값
				 --%>
				<jsp:getProperty property="name" name="sejong"/>
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<jsp:getProperty property="gender" name="sejong"/>
			</td>
		</tr>
		<tr>
			<th>나이</th>
			<td>
				<jsp:getProperty property="age" name="sejong"/>
			</td>
		</tr>
		<tr>
			<th>결혼여부</th>
			<td>
				<jsp:getProperty property="married" name="sejong"/>
			</td>
		</tr>
	</table>

</body>
</html>