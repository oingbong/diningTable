<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insertReservation.do" method="post">
		예약 날짜 : <input type="text" name="rDate" id="rDate" value=""><br>
		예약 시간 : <input type="text" name="rTime" id="rTime" value=""><br>
		인원수 : <input type="text" name="rNumber" id="rNumber" value=""><br>
		요구사항 :<br>
		<textarea name="rRequest" id="rRequest" rows="5" cols="60"></textarea>
		<br>
		회원번호 : <input type="text" name="mNo" id="mNo" value="${m.mNo }"><br>
		레스토랑 번호 : <input type="text" name="tNo" id="tNo" value="${t.tNo }"><br>
		<input type="submit" value="예약하기">
		<input type="reset" value="취소하기">
	</form>
</body>
</html>