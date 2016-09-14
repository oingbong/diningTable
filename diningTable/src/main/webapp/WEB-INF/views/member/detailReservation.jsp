<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<tr><td>레스토랑 번호</td><td>${r.tNo }</td></tr>
	</table>
	<br>
	<c:choose>
		<c:when test="${mNo != null }"><!-- 개인회원 경우 보이는 메뉴 -->
			<a href="updateReservation.do?rNo=${r.rNo }">예약 수정하기</a>&nbsp;&nbsp;&nbsp;
			<a href="deleteReservation.do?rNo=${r.rNo }">예약 취소하기</a>
		</c:when>
		<c:otherwise>
			<a href="listReservationCo.do">예약 목록으로 돌아가기</a>
		</c:otherwise>
	</c:choose>
</body>
</html>