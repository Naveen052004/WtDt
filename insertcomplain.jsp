<%@include file="connect.jsp"%>
<%@include file="getcookies.jsp"%>
<script></script>
<%
String cookname=(String)session.getAttribute("cookiename");
String rollno=cookname.substring(0,cookiename.indexOf('@'));
//out.println(cookiename);
//out.println(rollno);
//out.println(request.getParameter("complaintarea"));
try{

    String qinsert="Insert into complaintable(roll_no,complaints) values(?,?);";
    PreparedStatement insertstatement=cn.prepareStatement(qinsert);
    insertstatement.setString(1,rollno);
    insertstatement.setString(2,request.getParameter("complaintarea"));
    insertstatement.executeUpdate();
    response.sendRedirect("studentcomplains.jsp");
}
catch(Exception e){
    out.println(e);
}
%>