<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td><h2>Menu</h2></td>
		</tr>
		<tr>
			<td><jsp:include page="menu.jsp" /></td>
		</tr>
		<tr>
			<td>----------------------------------------</td>
		</tr>
		<tr>
			<td><jsp:include page="${viewPage }" /></td>
		</tr>
		<tr>
			<td><h2>bottom Area</h2></td>
		</tr>
	</table>
</body>
</html>
