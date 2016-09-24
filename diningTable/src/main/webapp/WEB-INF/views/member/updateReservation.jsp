<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<script src="//code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script type="text/javascript">
	//spinner
	$(function(){
	    var spinner = $( "#rNumber" ).spinner();
	    $( "button" ).button();
	});
	
	// datePicker 설정
	$.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd', // 날짜 형식 20xx-xx-xx
        minDate:0, // 오늘 이후부터 선택 가능
        defaultDate:${r.rDate}, // 초기값을 DB에 저장된 값으로 설정
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
	
	// rDate에 datePicker 추가
	$(function(){
		$("#rDate").datepicker();
	});
	
	$(document).ready(function() {
		// 예약시간 select option 값 주기 위한 배열
  		var time = ["선택하세요","03:00","03:30","04:00","04:30","05:00","05:30","06:00","06:30","07:00","07:30",
  		            "08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30",
  		            "13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30",
  		            "18:00","18:30","19:00","19:30","20:00","20:30","21:00","21:30","22:00","22:30",
  		            "23:00","23:30","24:00","24:30"];
  		
  		// 예약시간에 option 값 주는 반복문
  		for(i=0; i<time.length; i++){
  			$("#r1").append("<option value='"+time[i]+"'>"+time[i]+"</option");
  		} 
  		
  		// 예약시간 선택값을 가져오기 위한 것
  		var choicedTime = $("#rTime").val();
  		$("#r1").val(choicedTime).attr("selected", "selected");
	})
	
	// 예약시간 select option 값 가져오기(DB 저장값을 위한 것)
	function timeSet() {
		var r1 = $("#r1 option:selected").val();
		$("#rTime").val(r1);
	}
</script>
</head>
<body>
	<h2>레스토랑 예약 변경</h2>

	<form action="updateReservation.do" method="post" class="form-inline"> <!-- 인라인 폼 -->
	
		<p>
			<div class="form-group">
				<label>예약번호</label>
				<input type="text" name="rNo" id="rNo" value="${r.rNo }" readonly="readonly" class="form-control">
			</div>
		</p>
		
		<p>
			<div class="form-group">
				<label>예약날짜</label>
				<input type="text" name="rDate" id="rDate" value="${r.rDate }" class="form-control">
			</div>
		</p>
		
		<p>
			<div class="form-group">
				<label>예약시간</label>
				<input type="hidden" name="rTime" id="rTime" value="${r.rTime }">
				<select name="r1" id="r1" onchange="timeSet()" class="form-control"></select>
			</div>
		</p>	

		<p>
			<div class="form-group">
				<label>인원수</label>
				<input type="text" name="rNumber" id="rNumber" value="${r.rNumber }" class="form-control">
			</div>
		</p>		
		
		<p>
			<div class="form-group">
				<label>요구사항</label>
				<textarea name="rRequest" id="rRequest" rows="5" cols="60" class="form-control">${r.rRequest }</textarea>
			</div>
		</p>		

		<p>
			<div class="form-group">
				<label>회원번호</label>
				<input type="text" name="mNo" id="mNo" value="${r.mNo }" readonly="readonly" class="form-control">
			</div>
		</p>		
		
		<p>
			<div class="form-group">
				<label>레스토랑 번호</label>
				<input type="text" name="tNo" id="tNo" value="${r.tNo }" readonly="readonly" class="form-control">
			</div>
		</p>
		
		<input type="submit" value="예약변경" class="btn btn-success">
		<input type="reset" value="취소하기" class="btn btn-warning">
	</form>
</body>
</html>