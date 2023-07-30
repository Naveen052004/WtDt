<%@include file="connect.jsp" %>
<%
String old[]=request.getParameterValues("olddata");
String new1[]=request.getParameterValues("newdata");
out.println(old.length);
out.println(new1.length);
String str="Update drivers_info set Name=?,Bus_no=?,uname=?,pass=?,pho_no=? where uname='"+old[2]+"';";
PreparedStatement stmt=cn.prepareStatement(str);
stmt.setString(1,new1[0]);
stmt.setString(2,new1[1]);
stmt.setString(3,new1[2]);
stmt.setString(4,new1[3]);
stmt.setString(5,new1[4]);
stmt.execute();
response.sendRedirect("busdrivers.jsp");
%>