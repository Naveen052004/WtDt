<%
Cookie c[]=request.getCookies();
Cookie temp;
for(int i=0;i<c.length;i++){
    out.println("Name = "+c[i].getName()+"Value = "+c[i].getValue());
}
%>