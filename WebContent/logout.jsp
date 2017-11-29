<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<%
	Cookie loginCookie = null;
	for (Cookie cookie : request.getCookies()) {
		if (cookie.getName().equals("loginUser")) {
			loginCookie = cookie;
			break;
		}
	}
	if (loginCookie != null) {
		loginCookie.setMaxAge(0);
		response.addCookie(loginCookie);
	}
	response.sendRedirect("index.jsp");
%>

<%@ include file="sidebar.jsp"%>
<%@ include file="footer.jsp"%>

