<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
	<script src="//code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
	<script>
		$.datepicker.setDefaults({
	        dateFormat: 'yy-mm-dd', // 날짜 형식 20xx-xx-xx
	        minDate:0, // 오늘 이후부터 선택 가능
	     	// datepicker 한글설정
	        prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
	    });
	
		$(function(){
			$( "#rDate" ).datepicker();
		});
	</script>
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