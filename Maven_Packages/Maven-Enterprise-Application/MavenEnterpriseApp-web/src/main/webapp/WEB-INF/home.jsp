
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<spring:url value="/resources/images/unitedlogo.jpg" var="unitedlogo" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>United Core System - Home Page</title>
<link href="${unitedlogo}" rel="icon">
</head>
</head>
<body>
<h1 align="center">Welcome to United Core System</h1>
<h1 align="center">This program is designed to merge the principles of DevOps with the expansive capabilities of cloud computing.</h1>
<hr>
<div style="text-align: center;">
	<span>
		<img src="${unitedlogo}" alt="" width="100"/>

	</span>
	<span style="font-weight: bold;">
		United Core System, 
	</span>
</div>
<hr>
	<p> Service : <a href="${pageContext.request.contextPath}/services/getEmployeeDetails">Get Employee Details </p>
<hr>
<p align=center>United Core System - Consultant, Training, Development Center.</p>
<p align=center><small>Copyrights 2023 by <a href="http://unitedcoresystems.com/">United Core System</a> </small></p>

</body>
</html>