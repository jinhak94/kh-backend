<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mybatis 실습</title>
<style>
div.enroll-container{text-align:center;}
table#tbl-student{margin:0 auto;border:1px solid; border-collapse:collapse;}
table#tbl-student th,table#tbl-student td{
   border:1px solid;
   padding:5px;
}
table#tbl-student th{text-align:right;}
table#tbl-student td{text-align:left;}
table#tbl-student tr:last-of-type td{text-align:center;}
</style>
<c:if test="${not empty msg }">
<script>
alert("${msg}");
<%-- msg 1회 사용후 삭제 --%>
<c:remove var="msg" scope="session"/>
</script>
</c:if>
</head>
<body>
   <div class="enroll-container">
      <h2>회원등록(VO)</h2>
      <%--현재주소로 전송하겠다 post 방식으로 --%>
      <form method="post">
         <table id="tbl-student">
            <tr>
               <th>학생이름</th>
               <td>
                  <input type="text" name="name" required/>
               </td>
            </tr>
            <tr>
               <th>전화번호</th>
               <td>
                  <input type="tel" name="tel" maxlength="11" required/>
               </td>
            </tr>      
            <tr>
               <td colspan="2">
                  <input type="submit" value="등록" />
               </td>
            </tr>
         </table>
      </form>
      <hr />
      <h2>회원등록(Map)</h2>
      <%--현재주소로 전송하겠다 post 방식으로 --%>
      <form 
      	action="${pageContext.request.contextPath}/student/studentMapEnroll.do"
      	method="post">
         <table id="tbl-student">
            <tr>
               <th>학생이름</th>
               <td>
                  <input type="text" name="name" required/>
               </td>
            </tr>
            <tr>
               <th>전화번호</th>
               <td>
                  <input type="tel" name="tel" maxlength="11" required/>
               </td>
            </tr>      
            <tr>
               <td colspan="2">
                  <input type="submit" value="등록" />
               </td>
            </tr>
         </table>
      </form>
   </div>

</body>
</html>