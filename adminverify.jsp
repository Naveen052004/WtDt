<%@include file="connect.jsp" %>
<%
String uname=request.getParameter("AdminId");
String pass=request.getParameter("AdminPass");
String str="Select * from admin_logins where uname='"+uname+"' and pass='"+pass+"';";
ResultSet rs=s.executeQuery(str);
if(rs.next()){
    response.sendRedirect("admin.jsp");
}
else{
    out.println("<script>alert('Wrong Credentials Entered');</script>");
    out.println("<script>history.back()</script>");
}
%>