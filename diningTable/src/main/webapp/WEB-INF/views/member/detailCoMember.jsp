<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style type="text/css">
	th{
		background-color: #D9E5FF;
	}
</style>
<title>Insert title here</title>
</head>
<body>

	<h2>레스토랑 정보</h2>

	<div class="table-responsive"> <!-- 반응형 테이블 -->
		<table class="table table-bordered"> <!-- 선있는 테이블 -->
			<tr><th>레스토랑 이메일</th><td>${t.tEmail }</td></tr>
			<tr><th>레스토랑 타입</th><td>${t.tType }</td></tr>
			<tr><th>레스토랑 이름</th><td>${t.tName }</td></tr>
			<tr><th>레스토랑 전화번호</th><td>${t.tPhoneF }-${t.tPhoneS }-${t.tPhoneT }</td></tr>
			<tr><th>레스토랑 주소</th><td>${t.tAddrF } ${t.tAddrS } ${t.tAddrT } ${t.tAddrO }</td></tr>
			<tr><th>오픈시간</th><td>${t.tTimeS }</td></tr>
			<tr><th>마감시간</th><td>${t.tTimeC }</td></tr>
			<tr><th>휴식시작시간</th><td>${t.tTimeBs }</td></tr>
			<tr><th>휴식마감시간</th><td>${t.tTimeBc }</td></tr>
			<tr><th>휴일</th><td>${t.tHoliday }</td></tr>
		</table>

		<h4><a href="updateCoMember.do">레스토랑 정보수정</a></h4>

	</div>
</body>
</html>