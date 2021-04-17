<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setLocale value="ko_kr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mybatis실습</title>
<style>
div#emp-container{text-align:center;}
table.tbl-emp{
	margin:0 auto;
	border:1px solid; 
	border-collapse:collapse;
}
table.tbl-emp th, table.tbl-emp td{
	border:1px solid;
	padding:5px;
	background:lightseagreen;
}
table.tbl-emp td{
	background:white;
}
div#search-container{
	padding:15px 0;
}
</style>
</head>
<body>
<div id="emp-container">
	<h2>사원정보 </h2>
		<div id="search-container">
		<form>
			<select name="searchType" required>
				<option value="">검색타입</option>
				<!-- required여부를 판단할 value="" 반드시 있어야함.-->
				<option value="emp_id" ${param.searchType eq 'emp_id' ? 'selected' : '' }>사번</option> <!-- db컬럼명을 지정 -->
				<option value="emp_name" ${param.searchType eq 'emp_name' ? 'selected' : '' }>사원명</option>
				<option value="email" ${param.searchType eq 'email' ? 'selected' : '' }>이메일</option>
				<option value="phone" ${param.searchType eq 'phone' ? 'selected' : '' }>전화번호</option>
			</select>
			<input type="search" name="searchKeyword" value="${param.searchKeyword}" required/>	
			<input type="submit" value="검색" />
		</form>
	</div>
	<table class="tbl-emp">
		<tr>
			<th></th><!-- 1부터 넘버링 처리 -->
			<th>사번</th>
			<th>사원명</th>
			<th>주민번호</th><!--뒷6자리는 ******처리-->
			<th>이메일</th>
			<th>전화번호</th>
			<th>부서코드</th>
			<th>직급코드</th>
			<th>급여레벨</th>
			<th>급여</th><!--원화기호, 세자리마다 콤마표시-->
			<th>보너스율</th><!--percent로 표시-->
			<th>매니져 사번</th>
			<th>입사일</th><!--날짜형식 yyyy/MM/dd-->
			<th>퇴사여부</th>
		</tr>
		<!-- 조회된 데이터가 있는 경우와 없는 경우를 분기처리 하세요 -->
		<!-- 조회된 사원이 있는 경우 -->
		<c:if test="${not empty list}">
			<c:forEach items="${list}" var="map" varStatus="vs">
			<tr>
				<td>${vs.count}</td>
				<td>${map.empId}</td>
				<td>${map.empName}</td>
<%-- 				<td>${fn:replace(map.empNo, fn:substring(map.empNo, 8, 14), '******')}</td> --%>
				<td>${fn:substring(map.empNo,0,8)}******</td>
				<td>${map.email}</td>
				<td>${map.phone}</td>
				<td>${map.deptCode}</td>
				<td>${map.jobCode}</td>
				<td>${map.salLevel}</td>
				<td><fmt:formatNumber value="${map.salary}" type="currency"/></td>
				<td><fmt:formatNumber value="${map.bonus}" type="percent" maxFractionDigits="2"/></td>
				<td>${map.managerId}</td>
				<td><fmt:formatDate value="${map.hireDate}" pattern="yyyy/MM/dd"/></td>
				<td>${map.quitYN}</td>
			</tr>
			</c:forEach>
		</c:if>
		<!-- 조회된 사원이 없는 경우 -->
		<c:if test="${empty list}">
			<tr>
				<td colspan="14" style="text-align:center;">조회된 데이터가 없습니다.</td>
			</tr>
		</c:if>
	</table>
</div>

</body>
</html>
