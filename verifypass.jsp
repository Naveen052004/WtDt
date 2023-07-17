<%@include file="connect.jsp"%>
<%@include file="getcookies.jsp"%>
<%
if(request.getParameter("oldpassword").equals((String)session.getAttribute("cookiepass")))
{
    if(request.getParameter("password").equals(request.getParameter("confirmPassword"))){
        try{

            String newpass=request.getParameter("password");
            String email=(String)session.getAttribute("cookiename");
            String str="UPDATE login_creds SET password = '"+newpass+"' WHERE email = '"+email+"';";
            //Statement s=(Statement)session.getAttribute("statement");
            s.executeUpdate(str);
            Cookie cook=new Cookie("pass",newpass);
            response.addCookie(cook);
            out.println("<script>");
            out.println("alert('Password Changed Succesfully Click To Redirect to Your Profile');");
            out.println("window.location = 'profile.jsp';</script>");
        }catch(Exception e)
        {
            out.println(e);
        }
    }
    else out.println("no");
}
%>