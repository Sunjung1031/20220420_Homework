package id;

import java.sql.*;  // java.sql 패키지에 포함되어 있는 인터페이스, 클래스들 임포트
import java.util.*;

public class DBBean {

	private int num;	
	private String name;	
	private String id;
	private String pw;	
	private String tel;	


Connection			conn = null;
PreparedStatement	pstmt = null;
ResultSet			rs = null;


// DB 연동 메소드 구현
public void connect() {
	try {
		Class.forName("org.gjt.mm.mysql.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sj","root","");
	
	} catch(Exception e) {
		System.out.println(e);
	}
}
// DB 연동 종료 메소드 구현
public void disconnect() {
	try {
		pstmt.close();  // 자원해제
		rs.close();		// 자원해제
		conn.close();	// 자원해제
	} catch(Exception e) {
		System.out.println(e);
	}
}
public int confirmId(String id) {
	connect();  //DB 접속할 수 있는 연결 객체 생성
	int idDuplication = 0;  // id 중복여부 체크 변수
	
	try {
		String Confirmed_SELECT = "select id from user_tb where id= ? ";  // ?로 주는 방식이 PreparedStatement방식이다.(보안에 좋다)
	
		pstmt = conn.prepareStatement(Confirmed_SELECT);
	
		pstmt.setString(1, id);  // (첫번째 물음표, 넘겨받은 아이디)

		rs = pstmt.executeQuery();
	
		if(rs.next()) {
			idDuplication = 1;  // ID가 중복인 경우

		} else {
			idDuplication = -1;  // 사용 가능한 ID인 경우
		
		}
	} catch(Exception e) {
		System.out.println("confirmId():" + e);
	} finally {
		disconnect();
	}
	return idDuplication;
} // end confirmId() ====================================
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPw() {
	return pw;
}
public void setPw(String pw) {
	this.pw = pw;
}
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}
}