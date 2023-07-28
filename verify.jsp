<%@include file="connect.jsp"%>
<%
String user=request.getParameter("User");
String pass=request.getParameter("pass");
String query="Select * from login_creds where email='"+user+"' and password='"+pass+"';";
ResultSet rs=s.executeQuery(query);
if(rs.next())
{
    Cookie c=new Cookie("name",user);
    response.addCookie(c);
    c=new Cookie("pass",pass);
    response.addCookie(c);
    response.sendRedirect("home.jsp");
}
else{%>
    <%@include file="login.html"%>
    <script>document.getElementById("WrongInfo").innerHTML="Wrong Credentials";</script>
    <%}%>