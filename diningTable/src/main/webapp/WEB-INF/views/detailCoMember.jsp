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
		<tr><td>레스토랑 이메일 : ${t.tEmail }</td></tr>
		<tr><td>레스토랑 타입 : ${t.tType }</td></tr>
		<tr><td>레스토랑 이름 : ${t.tName }</td></tr>
		<tr><td>레스토랑 전화번호 : ${t.tPhoneF }-${t.tPhoneS }-${t.tPhoneT }</td></tr>
		<tr><td>레스토랑 주소 : ${t.tAddrF } ${t.tAddrS } ${t.tAddrT } ${t.tAddrO }</td></tr>
		<tr><td>레스토랑 오픈시간 : ${t.tTimeS }</td></tr>
		<tr><td>레스토랑 마감시간 : ${t.tTimeC }</td></tr>
		<tr><td>레스토랑 휴식시작시간 : ${t.tTimeBs }</td></tr>
		<tr><td>레스토랑 휴식마감시간 : ${t.tTimeBc }</td></tr>
		<tr><td>레스토랑 휴일 : ${t.tHoliday }</td></tr>
		<tr><td><a href="updateRestaurant.do">레스토랑 정보수정</a></td></tr>
	</table>
</body>
</html>