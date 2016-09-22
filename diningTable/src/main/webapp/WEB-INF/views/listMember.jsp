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
	listMember Page
	<div class="table-responsive"> <!-- 반응형 테이블 -->
		<table class="table table-hover"> <!-- 행over 상태 확인 -->
			<tr class="info"> <!-- 색표현 -->
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
					<td>${m.mPhoneF }-${m.mPhoneS }-${m.mPhoneT }</td>
					<td>${m.mGender }</td>
					<td>${m.mBirth }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>