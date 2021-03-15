<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--
	EL Expression Language
	jsp 2.0부터 사용된 스펙으로, jsp에서 간결한 출력식을 지원한다.
	
	${value}
	
	EL 내장객체
	속성에 저장된(setAttribute) 객체를 EL이 별도의 맵으로 작성해둔 것. 생략가능.
	생략시 page - request - session - application 순으로 속성을 조회
 	- pageScope
 	- requestScope
 	- sessionScope
 	- applicationScope
 	
 	사용자 입력값 query string
	-param
	-paramValues
	
	요청 header 정보
	-header
	-headerValues
	
	쿠키
	-cookie
	
	초기화  파라미터 : application에서 지정한 값들.
	-initParam
	
	포인터 객체
	-pageContext : 내장객체 중 유일하게 Map이 아닌 포인터 객체
		getErrorData() : ErrorData
		getPage() : PageContext
		getRequest() : HttpServletRequest
		getResponse() : HttpServletResponse
		getSession() : HttpSession
		getServletConfig() : ServletConfig
		getServletContext() : ServletContext
 --%>

<html>
<head>
<meta charset="UTF-8">
<title>EL - basic</title>
</head>
<body>
	<h1>EL - basic</h1>
	<ul>
<!-- 		scope별 name충돌이 있다면, 내장객체명을 생략하지 말것. -->
		<li>${requestScope.coffee }</li>
		<li>${sessionScope.year }</li>
		<li>${today}</li>
		<li>${person }
			<ul>
				<li>${person.name}</li>
				<li>${person.gender}</li>
				<li>${person.age}</li>
				<li>${person.married}</li>
			</ul>	
		</li>
		<li>${list}
			<ul>
				<li>${list[0]}</li>
				<li>${list[1]}</li>
				<li>${list[2]}</li>
			</ul>
		</li>
		<li>${map}
			<ul>
				<li>${map.num}</li> <%-- dot notation --%>
				<li>${map.jang}</li> 
				<li>${map['jang']}</li> <%-- bracket notation --%>
				<li>${map['jang']['name']}</li>
				<li>${map.jang.gender}</li>
				<li>${map['jang'].age}</li>
				<li>${map['jang'].married}</li>
			</ul>
		</li>
		<li>존재하지 않는 값 : ${hello}</li>
		<%-- 값이 존재하지 않아도 null을 출력하지 않는다. --%>
		<li>존재하지 않는 값의 속성을 참조 : ${hello.world}</li>
<!-- 		EL은 결코 NullPointerException을 유발하지 않는다. -->
	</ul>	
	
	<h2>param</h2>
	<ul>
		<li>${param.produceId}</li>
		<li>${param.amount}</li>
<!-- 		아래와 같이 하면 첫 번째 값만 접근 가능하다 -->
<%-- 		<li>${param.option }</li> --%>
		<li>${paramValues}
			<ul>
				<li>${paramValues.option[0]}</li>
				<li>${paramValues.option[1]}</li>
			</ul>
		</li>
	</ul>
	
	<h2>header</h2>
<!-- 	request.getHeader("User-Agent") -->
	<ul>
		<li>${header["User-Agent"]}</li>
		<li>${header["Referer"]}</li>
	</ul>
	
	<h2>cookie</h2>
	<ul>
		<li>${cookie.JSESSIONID.value}</li>
	</ul>
	
	<h2>pageContext</h2>
	<ul>
		<li><%=request.getMethod()%></li>
<!-- 		EL에서는 직접적으로 request 접근할 수 없고, pageContext를 사용해야 한다. -->
		<li>${pageContext.request.method}</li>
		<li><%=request.getContextPath() %></li>
		<li>${pageContext.request.contextPath}</li>
	</ul>
	<ul>
		<li>${pageContext.errorData}</li>
		<li>${pageContext.request}</li>
		<li>${pageContext.response}</li>
		<li>${pageContext.page}</li>
		<li>${pageContext.session}</li>
		<li>${pageContext.servletConfig}</li>
		<li>${pageContext.servletContext}</li>
	</ul>
	
	
</body>
</html>





