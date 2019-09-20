<%@ page language="java" isELIgnored="false" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@ page import="java.util.Set"%>
<%@ page import="java.util.List"%>
<%@ page import="com.phoenixone.bean.NameListManagerBean"%>

<jsp:useBean id="namesManager" class="com.phoenixone.bean.NameListManagerBean" scope="session"/>

<html>
	<head>
		<title>Name</title>
	</head>
	<body>
		<form action="<%= request.getContextPath()%>/names" action="post">
			<label for="name">Name</label><input type="text" name="name">
			<input type="hidden" name="action" value="add-name"/>
			<button type="submit">Submit</button>
		</form>		
		<c:choose>
			<c:when test="${empty namesManager.names}">
				<b>Empty List</b>
			</c:when>
			<c:otherwise>
				<ul>
				<c:forEach items="${namesManager.names}" var="name">
					<c:url value="/names" var="namesUrl">
						<c:param name="action" value="remove-name"/>
						<c:param name="name" value="${name}"/>
					</c:url>
					<li><c:out value="${name}"/><a href="${namesUrl}">Remove</a></li>
				</c:forEach>
			</ul>
			</c:otherwise>
		</c:choose>
		<%-- 
		<c:if test="${empty namesManager.names}">
			<b>Empty List</b>
		</c:if>
		
		<c:if test="${!empty namesManager.names}">
			<ul>
				<c:forEach items="${namesManager.names}" var="name">
					<c:url value="/names" var="namesUrl">
						<c:param name="action" value="remove-name"/>
						<c:param name="name" value="${name}"/>
					</c:url>
					<li><c:out value="${name}"/><a href="${namesUrl}">Remove</a></li>
				</c:forEach>
			</ul>
		</c:if>
		 --%>		
	</body>
</html>