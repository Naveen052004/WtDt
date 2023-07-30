<%@include file="connect.jsp" %>
<%
String uname=request.getParameter("DriverId");
String pass=request.getParameter("Driverpass");
String str="Select uname,pass from drivers_info where uname='"+uname+"' and pass='"+pass+"';";
ResultSet rs=s.executeQuery(str);
if(rs.next()){
    response.sendRedirect("loc1.jsp");
}
else{
    out.println("<script>alert('Wrong Credentials Entered');</script>");
    out.println("<script>history.back()</script>");
}
%>