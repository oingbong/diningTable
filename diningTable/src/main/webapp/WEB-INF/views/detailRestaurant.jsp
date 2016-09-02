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
	<table>
		<tr>
			<td rowspan="10"><img src="resources/upload/${t.tImage }" width="200" height="200"> </td>
		</tr>
		<tr><td>타입 : </td><td>${t.tType }</td></tr>
		<tr><td>이름 : </td><td>${t.tName }</td></tr>
		<tr><td>전화번호 : </td><td>${t.tPhoneF }-${t.tPhoneS }-${t.tPhoneT }</td></tr>
		<tr><td>주소 : </td><td>${t.tAddrF } ${t.tAddrS } ${t.tAddrT } ${t.tAddrO } </td></tr>
		<tr><td>오픈시간 : </td><td>${t.tTimeS }</td></tr>
		<tr><td>마감시간 : </td><td>${t.tTimeC }</td></tr>
		<tr><td>휴식시작 : </td><td>${t.tTimeBs }</td></tr>
		<tr><td>휴식마감 : </td><td>${t.tTimeBc }</td></tr>
		<tr><td>휴일 : </td><td>${t.tHoliday }</td></tr>
		<tr>
			<td><a href="reservation.do">예약하기</a></td>
		</tr>
	</table>
</body>
</html>