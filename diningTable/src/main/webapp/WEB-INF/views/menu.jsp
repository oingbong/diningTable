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
	<a href="listMember.do">listMember</a>&nbsp;
	<a href="listCoMember.do">listCoMember</a>&nbsp;
	<a href="listRestaurant.do">listRestaurant</a>&nbsp;
	<a href="main.do">main</a>&nbsp;
	<c:choose>
		<c:when test="${mNo != null}"><!-- 개인회원 경우 보이는 메뉴 -->
			<a href="detailMember.do">change information</a>&nbsp;
			<a href="logout.do">logout</a>&nbsp;
		</c:when>
		<c:when test="${tNo != null}"><!-- 레스토랑 회원 경우 보이는 메뉴 -->
			<a href="detailCoMember.do">change informationR</a>&nbsp;
			<a href="logout.do">logout</a>&nbsp;
		</c:when>
		<c:otherwise><!-- 로그인 하기 전 -->
			<a href="login.do">login</a>&nbsp;
			<a href="insertMember.do">insertMember</a>&nbsp;
			<a href="insertCoMember.do">insertRestaurant</a>&nbsp;
		</c:otherwise>
	</c:choose>
</body>
</html>