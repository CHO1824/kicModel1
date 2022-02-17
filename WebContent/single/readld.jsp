<%@page import="model.Member"%>
<%@page import="service.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
if(id==null) id="";
MemberDao md = new MemberDao();
Member m = md.selectOne(id); //MeberDao에서 selectOne 받음
String chk = m==null ? "false" : "true";
%><%=chk%>