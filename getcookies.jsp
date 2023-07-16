<%
String cookiename="";
Cookie ck[]=request.getCookies();
for(Cookie temp:ck){
    if((temp.getName()).equals("name")){
        cookiename=temp.getValue();
        session.setAttribute("cookiename",cookiename);
        session.setAttribute("rollno",cookiename.substring(0,cookiename.indexOf('@')));
        break;
    }
}

%>