<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr><td>예약번호</td><td>${r.rNo }</td></tr>
		<tr><td>날짜</td><td>${r.rDate }</td></tr>
		<tr><td>시간</td><td>${r.rTime }</td></tr>
		<tr><td>인원수</td><td>${r.rNumber }</td></tr>
		<tr><td>요구사항</td><td><textarea rows="5" cols="50">${r.rRequest }</textarea> </td></tr>
	</table>
</body>
</html>