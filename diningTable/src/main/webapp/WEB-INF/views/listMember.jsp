<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	listMember Page
	
	<table border="1" width="100%">
		<tr>
			<td>회원 번호</td>
			<td>회원 이메일</td>
			<td>회원 비밀번호</td>
			<td>회원 타입</td>
			<td>회원 이름</td>
			<td>회원 핸드폰</td>
			<td>회원 성별</td>
			<td>회원 생일</td>
		</tr>
		<c:forEach var="m" items="${list }">
			<tr>
				<td>${m.mNo }</td>
				<td>${m.mEmail }</td>
				<td>${m.mPwd }</td>
				<td>${m.mType }</td>
				<td>${m.mName }</td>
				<td>${m.mPhone }</td>
				<td>${m.mGender }</td>
				<td>${m.mBirth }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>