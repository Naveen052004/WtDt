<%@page import="java.sql.*"%>
<%
try{
    Connection cn=(Connection)session.getAttribute("connection");
    Statement s=(Statement)session.getAttribute("statement");
    ResultSet rs=s.executeQuery("Select * from coords;");
    rs.next();
    String lat=rs.getString(1);
    String lon=rs.getString(2);
    rs.close();
    %>
    <jsp:forward page="getcoords1.jsp">  
    <jsp:param name="lat" value="<%=lat%>" />
    
    <jsp:param name="lon" value="<%=lon%>" />  
    </jsp:forward>
<%}catch(Exception e){
    out.println(e);
}
%>