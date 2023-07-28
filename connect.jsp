<%@page import="java.sql.*"%>
<%
    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbl2.0","root","Naveen@123");
    Statement s=cn.createStatement();
    session.setAttribute("connection",cn);
    session.setAttribute("statement",s);
%>