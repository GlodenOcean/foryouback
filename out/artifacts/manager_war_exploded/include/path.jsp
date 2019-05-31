<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" session="true"%>
 <%
String path = request.getContextPath().toString();
/* String basePath = "http://ymftest.hi-card.cn/"+path+"/"; */
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
pageContext.setAttribute("basePath", basePath);
%>