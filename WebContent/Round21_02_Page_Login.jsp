<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
 									"http://www.w3.org/TR/html4/loose.dtd">    
 <% 
  	String id = (String)session.getAttribute("id");
 	if(id == null) id ="";
 %>

<html>
<head>
<meta charset="UTF-8">
<title>Login Page!</title>
</head>
<body>
	<center>
		<h2>Login Page!</h2>
		<form name='login_form' method='post' action='Round21_02_Page_Login_Process.jsp'>
		<table width='300' border='1'>
			<tr>
				<th width='100'>아이디</th>
				<td>
			<input type ='text' name='id' size='15' value='<%= id %>'/>
			</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
			<input type ='password' name='pw' size='15'/>
			</td>
			</tr>
			<tr>
				<td colspan='2' align='right'>
					<input type='submit' value='로그인'/>
			</td>
			</tr>
		</table>
		
		</form>
	</center>

</body>
</html>