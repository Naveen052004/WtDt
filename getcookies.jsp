<%
String cookiename="";
Cookie ck[]=request.getCookies();
int count=0;
for(Cookie temp:ck){
    if((temp.getName()).equals("name")){
        cookiename=temp.getValue();
        session.setAttribute("cookiename",cookiename);
        session.setAttribute("rollno",cookiename.substring(0,cookiename.indexOf('@')));
        count++;
    }
    else if((temp.getName()).equals("pass")){
        cookiename=temp.getValue();
        session.setAttribute("cookiepass",cookiename);
        count++;
    }
    if(count==2)
    break;
}

%>