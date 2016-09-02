<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#list:hover{
		background-color: lime;
	}
</style>

<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	function detail(rNo) {
		location.href="detailReservation.do?rNo="+rNo;
	}
</script>
</head>
<body>
	<table border="1">
		<tr>
			<td>예약번호</td>
			<td>날짜</td>
			<td>시간</td>
			<td>인원수</td>
			<td>레스토랑번호</td>
		</tr>
		<c:forEach var="r" items="${list }">
			<tr id="list" style="cursor: pointer;" onclick="detail(${r.rNo})">
				<td>${r.rNo }</td>
				<td><fmt:formatDate value="${r.rDate }" pattern="yyyy-MM-dd"/></td><!-- 날짜 형식 변환 jstl 이용 -->
				<td>${r.rTime }</td>
				<td>${r.rNumber }</td>
				<td>${r.tNo }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>