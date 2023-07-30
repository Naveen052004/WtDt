<%@include file="connect.jsp" %>
<%
String status=request.getParameter("statuss");
if(status.equals("Filter")){
    session.setAttribute("FilterStatus",request.getParameter("FilterStatus"));
    session.setAttribute("FilterBus",request.getParameter("FilterBus"));
    //out.println(request.getParameter("FilterStatus"));
    //out.println(request.getParameter("FilterBus"));
    response.sendRedirect("adminfilter.jsp");
}
else{
    session.setAttribute("FilterStatus",request.getParameter("FilterStatus"));
    session.setAttribute("FilterBus",request.getParameter("FilterBus"));
    String[] stats=request.getParameterValues("check");
        status=status.equals("Reopen")?"Processing":status;
        try{
            if(stats.length>0){
                for(String x:stats){
                out.println(x);
                String str="Update complaintable set status='"+status+"' where sd_no='"+x+"';";
                s.execute(str);
            }
        }
        response.sendRedirect("admin.jsp");
    }
    catch(Exception e){
        out.println(e);
    }
}
%>