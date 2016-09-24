<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>

	<h2>레스토랑 상세정보</h2>
	
	<div class="table-responsive"> <!-- 반응형 테이블 -->
	
		<p>
			<div class="form-group">
				<img src="resources/upload/${t.tImage }" width="400" height="300">
			</div>
		</p>
	
		<table class="table table-bordered"> <!-- 선있는 테이블 -->
			<tr><th>타입</th><td>${t.tType }</td></tr>
			<tr><th>이름</th><td>${t.tName }</td></tr>
			<tr><th>전화번호</th><td>${t.tPhoneF }-${t.tPhoneS }-${t.tPhoneT }</td></tr>
			<tr><th>주소</th><td>${t.tAddrF } ${t.tAddrS } ${t.tAddrT } ${t.tAddrO } </td></tr>
			<tr><th>오픈시간</th><td>${t.tTimeS }</td></tr>
			<tr><th>마감시간</th><td>${t.tTimeC }</td></tr>
			<tr><th>휴식시작</th><td>${t.tTimeBs }</td></tr>
			<tr><th>휴식마감</th><td>${t.tTimeBc }</td></tr>
			<tr><th>휴일</th><td>${t.tHoliday }</td></tr>
		</table>
		
				<h4><a href="member/insertReservation.do?tNo=${t.tNo }">레스토랑 예약 하기</a></h4>

	</div>
</body>
</html>