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
		<tr><td>이메일 : ${m.mEmail }</td></tr>
		<tr><td>타입 : ${m.mType }</td></tr>
		<tr><td>이름 : ${m.mName }</td></tr>
		<tr><td>핸드폰 : ${m.mPhoneF }-${m.mPhoneS }-${m.mPhoneT }</td></tr>
		<tr><td>성별 : ${m.mGender }</td></tr>
		<tr><td>생일 : ${m.mBirth }</td></tr>
		<tr><td><a href="updateMember.do">회원정보수정</a></td></tr>
	</table>
</body>
</html>