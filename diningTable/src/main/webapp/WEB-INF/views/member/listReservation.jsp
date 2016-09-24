<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 부트스크랩 적용 시작 -->
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 부트스크랩 적용 끝 -->

<style type="text/css">
	#list:hover{
		background-color: lime;
		cursor: pointer;
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

	<h2>예약 리스트</h2>
	<div class="table-responsive"> <!-- 반응형 테이블 -->
		<table class="table table-hover"> <!-- 행over 상태 확인 -->
			<tr class="info"> <!-- 색표현 -->
				<td>예약번호</td>
				<td>날짜</td>
				<td>시간</td>
				<td>인원수</td>
				<td>레스토랑번호</td>
			</tr>
			<c:forEach var="r" items="${list }">
				<tr id="list" onclick="detail(${r.rNo})">
					<td>${r.rNo }</td>
					<td>${r.rDate }</td>
					<td>${r.rTime }</td>
					<td>${r.rNumber }</td>
					<td>${r.tNo }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>