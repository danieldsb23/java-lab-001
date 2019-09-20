<%@ page language="java" %>
<%@ page import="java.util.Set"%>

<%@ page import="com.phoenixone.bean.NameListManagerBean"%>
<jsp:useBean id="namesManager" 
			 class="com.phoenixone.bean.NameListManagerBean" 
			 scope="session"/>

<html>
	<head>
		<title>Name</title>
	</head>
	<body>
		<form action="<%= request.getContextPath()%>/names" action="post">
			Name <input type="text" name="name">
			<input type="hidden" name="action" value="add-name"/>
			<button type="submit">Submit</button>
		</form>
		<%
			NameListManagerBean nameManager = (NameListManagerBean) session.getAttribute("namesManager");
			if(nameManager != null) {				
				Set<String> names = nameManager.getNames();
				for(String name: names) {
		%>
				<%= name %> <a href="<%= request.getContextPath() + "/names?name=" + name + "&action=remove-name" %>">Remove</a><br/>
		<%
				}
			}
		%>
	</body>
</html>