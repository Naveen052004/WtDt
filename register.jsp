
<%@page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String pass=request.getParameter("pass1");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbl2.0","root","Naveen@123");
Statement s=c.createStatement();
PreparedStatement pst=c.prepareStatement("Insert into login_creds values(?,?)");
pst.setString(1,email);
pst.setString(2,pass);
pst.executeUpdate();
out.println("Registered");
out.println("Connected");
Cookie ck=new Cookie("name",request.getParameter("email"));
response.addCookie(ck);
ck=new Cookie("pass",request.getParameter("pass1"));
response.addCookie(ck);
response.sendRedirect("home.jsp");
%>