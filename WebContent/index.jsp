<%@page import="java.util.regex.Pattern"%>
 
<%@ page language="java" contentType="text/html; charset=EUC-KR"
 
    pageEncoding="EUC-KR"%>
 
<%@ page import="java.sql.*" %>  
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
 
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 
<title>����! �Խ��� - �Խñ� ����Ʈ</title>        <!-- ������ ��ܿ� �ߴ� �����Դϴ�. -->
<style type="text/css">
 
    table, td, th   {
 
    border:1px solid green;
 
    }
 
    th{
 
    background-color:green;
 
    color:white;
 
    }
 
</style>
</head>
 
<%
 
    try {
 
        String driverName = "com.mysql.jdbc.Driver"; 
 
        String url = "jdbc:mysql://localhost:3306/bbs?characterEncoding=utf8";
 
        ResultSet rs = null;
 
      
 
        Class.forName(driverName);
 
        Connection con = DriverManager.getConnection(url,"jspexam","jsppw");
 
        out.println("Database Connection Success.");
 
      
 
        Statement stmt = con.createStatement();        
 
        String sql = "select * from bbstable order by idx desc";
 
        rs = stmt.executeQuery(sql);
 
%>
 
 
 
 
 
<body>                                            <!-- HTML������ �� ������ ���� �κ��Դϴ�. -->
 
    <h1>�Խñ� ����Ʈ</h1>                        <!-- ������ �۾��� ǥ���ϴ� �±��Դϴ�. -->
 
    <table>                                       <!-- ǥ ������ �����͸� ǥ���ϴ� �±��Դϴ�. -->
 
        <tr>                                  <!-- table�±� ������ ���� �����Ҷ� ���� �±��Դϴ�. -->
 
            <th>��ȣ</th>                     <!-- Table Header�� ���ڷ� table�±� ������ -->
 
            <th>����</th>                     <!-- �����ϰ���� �÷��� ��Ÿ���� ���� �±��Դϴ�. -->
 
            <th>�ۼ���</th>
 
            <th>��¥</th>
 
            <th>��ȸ��</th>
 
        </tr>
 
<%   
 
        while(rs.next()){
 
            out.print("<tr>");
 

 
            out.print("<td>" + rs.getString(1) + "</td>");
            out.print("<td> <a href='content.jsp?idx="+ rs.getString("idx") +"'>" + rs.getString("title") + " </a></td>");
            out.print("<td>" + rs.getString(3) + "</td>");
 
            out.print("<td>" + rs.getString(4) + "</td>");
 
            out.print("<td>" + rs.getString(5) + "</td>");
 
            out.print("</tr>");
 
        }
 
%>
 
    </table>
 
    <a href="write.html">�۾���</a>
 
<%      
 
        con.close();
 
    }catch (Exception e) {
 
        out.println("Oracle Database Connection Something Problem. <hr>");
 
        out.println(e.getMessage());
 
        e.printStackTrace();
 
    }
 
%>
 
</body>
 
</html>
