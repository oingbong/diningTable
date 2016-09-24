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
	th{
		background-color: #D9E5FF;
	}
</style>
</head>
<body>

	<h2>예약정보</h2>

	<div class="table-responsive"> <!-- 반응형 테이블 -->
		<table class="table table-bordered"> <!-- 선있는 테이블 -->
			<tr><th>예약번호</th><td>${r.rNo }</td></tr>
			<tr><th>날짜</th><td>${r.rDate }</td></tr>
			<tr><th>시간</th><td>${r.rTime }</td></tr>
			<tr><th>인원수</th><td>${r.rNumber }</td></tr>
			<tr><th>요구사항</th><td><textarea rows="5" cols="50">${r.rRequest }</textarea> </td></tr>
			<tr><th>레스토랑 번호</th><td>${r.tNo }</td></tr>
		</table>

		<c:choose>
			<c:when test="${mNo != null }"><!-- 개인회원 경우 보이는 메뉴 -->
				<h4><a href="updateReservation.do?rNo=${r.rNo }">예약 수정하기</a></h4>
				<h4><a href="deleteReservation.do?rNo=${r.rNo }">예약 취소하기</a></h4>
			</c:when>
			<c:otherwise>
				<h4><a href="listReservationCo.do">예약 목록으로 돌아가기</a></h4>
			</c:otherwise>
		</c:choose>
	</div>
	
</body>
</html>