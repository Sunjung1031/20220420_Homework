<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.* , javax.naming.*, javax.sql.* "%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = "", tel = "";

Connection conn = null;
PreparedStatement pstmt = null;
String query = "SELECT *FROM USER_TB WHERE ID = ? AND PW =?";

try {
	Context context = new InitialContext();
	DataSource source = (DataSource) context.lookup("java:comp/env/jdbc/myconn");
	conn = source.getConnection();
}
catch(Exception ex){}
try{
	
	pstmt = conn.prepareStatement(query);
	System.out.println("dd31");
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	ResultSet rs = pstmt.executeQuery();
	System.out.println("dd32");
	if (rs.next()) {
		name = rs.getString("name");
		tel = rs.getString("tel");
	System.out.println("dd33");
	} else
		throw new Exception();
	rs.close();
	pstmt.close();
} catch (Exception ex) {
	System.out.println("dd4");
	response.sendRedirect("Round21_02_Page_Register.jsp");
	return;
} finally {
	if (conn != null)
		conn.close();
	conn = null;
}
session.setAttribute("name", name);
session.setAttribute("id", id);
session.setAttribute("tel", tel);
pageContext.forward("Round21_02_Page_Main.jsp");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>