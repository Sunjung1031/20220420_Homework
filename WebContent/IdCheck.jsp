<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String f_id=(String)request.getParameter("id");
	int check= -1;
	
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		
		try{
			Context context = new InitialContext();
			DataSource source = (DataSource)context.lookup("java:comp/env/jdbc/myconn");
			conn = source.getConnection();
			
			String query = "select id from user_tb where id =  '" +f_id+"'";
			st = conn.createStatement();
			st.executeQuery(query);
			rs=st.executeQuery(query);
			if(rs.next()){
				check = 1;
			}else{
				check = 0;
			}
		}finally{
			if(rs != null) 
				try{rs.close();
				}catch(SQLException e){}
			if(st != null) 
				try{st.close();
				}catch(SQLException e){}
			if(conn != null) 
				try{conn.close();
				}catch(SQLException e){}
		}
		if(check == 1){
			%>
		<b><%= f_id %>는 이미 사용중입니다.</b>
		<form name="checkForm" method="post" action="Round21_02_Page_Login.jsp">
		<b>다시 입력 해 주세요</b><br/><br/>
		<input type="text" name="id"/>
		<input type="submit" value="ID중복확인"/>
		</form>
		<%
		}else{
		%><center>
		<b>입력하신 <%= f_id %>는 사용하실 수 있는 ID입니다.</b>
		<input type="button" value="닫기" onclick="setid()">
		</center>
		<script language="javascript">
		<%
		}
		%>
		function setid(){
			opener.document.Round21_02_Page_Register.id.value="<%= f_id%>";
			window.self.close();
		}
		</script>
		

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>