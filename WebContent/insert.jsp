<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
     int idx = 1;
     String title = request.getParameter("title");
     String writer = request.getParameter("writer");
     String regdate = request.getParameter("regdate");
    
     String content = request.getParameter("content");
     
     if (title == null || title == "")out.println("title이 null입니다.");
     if (writer == null || writer == "")out.println("writer가 null입니다.");
     if (regdate == null || regdate == "")out.println("date가 null입니다.");
     if (content == null || content == "")out.println("content가 null입니다.");
  
     try {
 		String driverName = "com.mysql.jdbc.Driver";
 		String Url = "jdbc:mysql://localhost:3306/bbs?characterEncoding=utf8";
 		Class.forName(driverName);
 		Connection con = DriverManager.getConnection(Url,"jspexam","jsppw");
        out.println("성공");
        Statement stmt = con.createStatement();            // SQL 쿼리를 날리기위한 Statement 객체 생성
        
        String sql = "INSERT INTO BBSTABLE "+
        
                       "(TITLE, WRITER, REGDATE, COUNT, CONTENT) "+
        
                       "VALUES ('"+title+"', '"+writer+"', '"+regdate+"', '1', '"+content+"')";
        
       stmt.executeUpdate(sql); 

    	 con.close();
     } catch (Exception e) {
    	 out.println("실패");
    	 out.println(e.getMessage());
    	 e.printStackTrace();
     }
   
     %>
<body>
</body>
</html>