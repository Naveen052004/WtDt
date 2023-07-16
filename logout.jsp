<%
Cookie c[]=request.getCookies();
for(Cookie cook:c){
    if(cook.getName().equals("name")||cook.getName().equals("pass")){
        cook.setMaxAge(0);
        response.addCookie(cook);
    }
}
response.sendRedirect("login.html");
%>
<script>
    localStorage.clear();
</script>