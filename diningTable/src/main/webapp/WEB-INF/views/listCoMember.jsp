<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 부트스크랩 적용 시작 -->
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 부트스크랩 적용 끝 -->
<title>Insert title here</title>
</head>
<body>

	listRestaurant Page
	<div class="table-responsive"> <!-- 반응형 테이블 -->
		<table class="table table-hover"> <!-- 행over 상태 확인 -->
			<tr class="info"> <!-- 색표현 -->
				<td>레스토랑 번호</td>
				<td>레스토랑 이메일</td>
				<td>비밀번호</td>
				<td>레스토랑 타입</td>
				<td>레스토랑 이름</td>
				<td>전화번호</td>
				<td>주소</td>
				<td>오픈시간</td>
				<td>마감시간</td>
				<td>휴식시간시작</td>
				<td>휴식시간끝</td>
				<td>휴무일</td>
				<td>레스토랑 이미지</td>
				<td>메뉴 이미지</td>
			</tr>
			<c:forEach var="t" items="${list }">
				<tr>
					<td>${t.tNo }</td>
					<td>${t.tEmail }</td>
					<td>${t.tPwd }</td>
					<td>${t.tType }</td>
					<td>${t.tName }</td>
					<td>${t.tPhoneF }-${t.tPhoneS }-${t.tPhoneT }</td>
					<td>${t.tAddrF } ${t.tAddrS } ${t.tAddrT } ${t.tAddrO }</td>
					<td>${t.tTimeS }</td>
					<td>${t.tTimeC }</td>
					<td>${t.tTimeBs }</td>
					<td>${t.tTimeBc }</td>
					<td>${t.tHoliday }</td>
					<td><img src="resources/upload/${t.tImage }" width="50" height="50"> </td>
					<td>${t.tMenu }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>