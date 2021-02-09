<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
$(function(){
	/*
	*	회원가임폼 유효성 검사	
	*/
	var frm = document.querySelector("[name=updatePwdFrm]");
    frm.onsubmit = function(){
        if(password.value.length < 4){
            alert("비밀번호는 4글자 이상이어야 합니다.");
            password.select();
            return false;
        }
        if(newPassword.value.length < 4){
            alert("비밀번호는 4글자 이상이어야 합니다.");
            newPassword.select();
            return false;
        }
        if(newPassword.value != passwordCheck.value){
            alert("비밀번호가 일치하지 않습니다.");
            newPassword.value = '';   
            passwordCheck.value = '';
            newPassword.focus();
            return false;
        }
    }
});
</script>
	<section id=enroll-container>
	<h2>비밀번호 변경</h2>
		<form 
			name="updatePwdFrm" 
			action="<%=request.getContextPath()%>/member/updatePassword" 
			method="post" >
			<table>
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" name="password" id="password" required></td>
				</tr>
				<tr>
					<th>변경할 비밀번호</th>
					<td>
						<input type="password" name="newPassword" id="newPassword" required>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>	
						<input type="password" name="passwordCheck" id="passwordCheck" required><br>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit"  value="변경" />
					</td>
				</tr>
			</table>
			<input type="hidden" name="memberId"/>
		</form>
	</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>