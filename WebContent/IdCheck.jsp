<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 추가 -->
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="mem" scope="page" class="id.DBBean"/>


<%
	String id = request.getParameter("id");

	// idCheck 값이 가질 수 있는 값은 1 또는 -1이다.
	int idCheck = mem.confirmId(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheck.jsp 페이지</title>

</head>
<body>
	<table border="0" align="center">
		<tr>
			<td align="center">
				<%
					if(idCheck == 1) {  // ID가 중복인 경우
				%>
				<br>
				<%= id %>는 이미 존재하는 ID 입니다.&nbsp;<br><br>
				<input type="button" value="닫기" 
				onClick=" location='Round21_02_Page_Register.jsp'"/>
				<%
					} else {
				%>
				<br>
				<%= id %>는 사용 가능한 ID입니다.&nbsp;<br><br>
				<input type="button" value="닫기" 
				onClick=" location='Round21_02_Page_Register.jsp'"/>
				<%
					}
				%>
			</td>
		</tr>
	</table>
</body>
</html>