<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.person.model.vo.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str1 = "안녕";
	String str2 = new String("안녕");
	
	int big = 100;
	int small = 30;
	
	Person hong1 = new Person("홍길동", '남', 33, false);
	Person hong2 = new Person("홍길동", '남', 33, false);

	List<String> list = null;
	list = new ArrayList<>();
	list.add("안뇽");
	
	pageContext.setAttribute("str1", str1);
	pageContext.setAttribute("str2", str2);
	pageContext.setAttribute("big", big);
	pageContext.setAttribute("small", small);
	pageContext.setAttribute("hong1", hong1);
	pageContext.setAttribute("hong2", hong2);
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8" />
<title>EL - Operator</title>
</head>
<body>	
	<h1>EL - Operator</h1>
	<h2>숫자 관련</h2>
	<ul>
		<li>${big + small}</li>
		<li>${big - small}</li>
		<li>${big * small}</li>
		<li>${big / small}</li>
		<li>${big div small}</li>
		<li>${big % small}</li>
		<li>${big mod small}</li>
		
<!-- 	getAttribute는 Object로 가져오는데, 형변환 없이 사용할 수 있는건 -->
<!-- 	내부적으로 자동형변환이 일어난다는 것. -->
		<li>${big > small} ${big gt small}</li>
		<li>${big >= small} ${big ge small}</li>
		<li>${big < small} ${big lt small}</li>		
		<li>${big <= small} ${big le small}</li>		
		<li>${big == small} ${big eq small}</li>		
		<li>${big != small} ${big ne small}</li>		
	</ul>

	<h2>문자열 관련</h2>
<!-- 	ul+ -->
	<ul>
<!-- 		EL은 + 연산자를 숫자 타입으로만 본다. -->
<%-- 		<li>${str1 + str2}
			</li>java.lang.NumberFormatException --%>
<!-- 		주소값 비교하지 않고, 내부적으로 equals 처리가 된다. -->
			<li><%=str1 == str2%> ${str1 == str2} ${str1 eq str2}</li>
			<li><%=str1 != str2%> ${str1 != str2} ${str1 ne str2}</li>			
	</ul>
	
	<h2>기타 객체</h2>
	<ul>
		<li><%= hong1 == hong2 %> ${hong1==hong2} ${hong1 eq hong2}</li>
		<li><%= hong1 != hong2 %> ${hong1!=hong2} ${hong1 ne hong2}</li>
<!-- 		해당 객체가 null이거나, 요소가 하나도 없는 경우 true 리턴 -->
		<li><%=list.isEmpty()%></li>
		<li>${empty list}</li>
		<li>${not empty list}</li>
	</ul>
</body>
</html>



