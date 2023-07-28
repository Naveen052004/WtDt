<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.io.*, java.util.*" %>
<%@include file="connect.jsp"%>
<%
    String lat = request.getParameter("lat");
    String lon = request.getParameter("lon");
    session.setAttribute("lat",lat);
    session.setAttribute("lon",lon);
    String str=" update coords set lat='"+lat+"';";
    s.execute(str);
    str=" update coords set lon='"+lon+"';";
    s.execute(str);
%>
