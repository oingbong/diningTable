<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		// 비밀번호 일치하는지 확인
		$(".submit").click(function (event) {
			var tPwd = $("#tPwd").val();
			var tPwdCheck = $("#tPwdCheck").val();
			
			if(tPwd != tPwdCheck){
				alert("비밀번호가 다릅니다.")
				event.preventDefault();
			}
		});
		
		// 레스토랑 타입 선택값을 가져오기 위한 것
		var choicedType = $("#choicedType").val();
  		$("#type").val(choicedType).attr("selected", "selected");

  		
  		// 레스토랑 번호 선택값을 가져오기 위한 것
  		var choicedPhone = $("#choicedPhone").val();
  		if ((choicedPhone.substring(0,2))=="02") { 
  			// 전화번호가 서울시인 경우
	  		$("#p1").val(choicedPhone.substring(0,2)).attr("selected", "selected");
		}else{
			// 서울시를 제외한 나머지인 경우
	  		$("#p1").val(choicedPhone.substring(0,3)).attr("selected", "selected");
		}
  		
  		
  		// 시간과 관련된 select option 값 주기 위한 배열
  		var time = ["선택하세요","03:00","03:30","04:00","04:30","05:00","05:30","06:00","06:30","07:00","07:30",
  		            "08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30",
  		            "13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30",
  		            "18:00","18:30","19:00","19:30","20:00","20:30","21:00","21:30","22:00","22:30",
  		            "23:00","23:30","24:00","24:30"];
  		
  		// 오픈시간, 마감시간, 휴무시간시작,끝에 option 값 주는 반복문
  		for(i=0; i<time.length; i++){
  			$("#s1").append("<option value='"+time[i]+"'>"+time[i]+"</option");
  			$("#c1").append("<option value='"+time[i]+"'>"+time[i]+"</option");
  			$("#bs1").append("<option value='"+time[i]+"'>"+time[i]+"</option");
  			$("#bc1").append("<option value='"+time[i]+"'>"+time[i]+"</option");
  		} 
  		
  		// 레스토랑 시간관련 선택값을 가져오기 위한 것
		var choicedTimeS = $("#choicedTimeS").val();
		var choicedTimeC = $("#choicedTimeC").val();
		var choicedTimeBs = $("#choicedTimeBs").val();
		var choicedTimeBc = $("#choicedTimeBc").val();
  		$("#s1").val(choicedTimeS).attr("selected", "selected");
  		$("#c1").val(choicedTimeC).attr("selected", "selected");
  		$("#bs1").val(choicedTimeBs).attr("selected", "selected");
  		$("#bc1").val(choicedTimeBc).attr("selected", "selected");
  		
  		
  		// 레스토랑 휴무일 선택값을 가져오기 위한 것
		var choicedHoliday = $("#choicedHoliday").val();
  		var holiday1 = choicedHoliday.substring(0,2);
  		var holiday2 = choicedHoliday.substring(2,5);
  		$("#h1").val(holiday1).attr("selected", "selected");
  		$("#h2").val(holiday2).attr("selected", "selected");
  		
	})

	function pwdChange() {
		$(".pwd").show();
		$("#pChange").hide();
	}
	
	function pwdCancel() {
		$(".pwd").hide();
		$("#pChange").show();
	}
	
 	// 레스토랑 타입 읽어오기
 	function RestType() {
		var aa = $("#type option:selected").val();
		$("#tType").val(aa);
	}
 	
 	
 	// 레스토랑 번호 관련
  	function phone() {
  		event = event || window.event;
  		var keyID = (event.which) ? event.which : event.keyCode;
  		if((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) 
  			|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 
  			|| $("#p1 option:selected").val()){
  			
	  			var phone = $("#p1").val() + "-" + $("#p2").val() + "-" + $("#p3").val();
				$("#tPhone").val(phone);
  		}else{
  			return false;
  		}
	}
 	
  	// 레스토랑 주소 합치고 읽어오기
  	function addr() {
		var addr  = $("#a1").val() + $("#a2").val();
		$("#tAddr").val(addr);
	}
	
  	// 시간 관련과 관련된 select option 값 가져오기(DB 저장값을 위한 것)
  	function timeSet() {
		var s1 = $("#s1 option:selected").val();
		var c1 = $("#c1 option:selected").val();
		var bs1 = $("#bs1 option:selected").val();
		var bc1 = $("#bc1 option:selected").val();
		$("#tTimeS").val(s1);
		$("#tTimeC").val(c1);
		$("#tTimeBs").val(bs1);
		$("#tTimeBc").val(bc1);
	}
  	
 	// 휴무일
  	function holiday() {
		var h1 = $("#h1 option:selected").val();
		var h2 = $("#h2 option:selected").val();
		var h3 = $("#h3").val();
		
		// 선택값에 따른 보이거나 숨기기
		if(h1=="기타"){ // 기타일때 추가적인 것 입력
			$("#h2").hide();
			$("#h3").show();
			$("#tHoliday").val(h1 + h3);
		}else if(h1=="명절"){ // 명절일때 '명절'만 입력
			$("#h2").hide();
			$("#h3").hide();
			$("#tHoliday").val(h1);
		}else{ // 매주 혹은 매월 일때 '매주/매월'과 '요일' 입력
			$("#h2").show();
			$("#h3").hide();
			$("#tHoliday").val(h1 + h2);
		}
	}
 	
</script>
</head>
<body>
	<form action="" method="post">
		<input type="hidden" name="tNo" id="tNo" value="${t.tNo }">

		<input type="hidden" name="tEmail" id="tEmail" value="${t.tEmail }">
		레스토랑 이메일 : ${t.tEmail }<font color="red" size="0.5">이메일은 변경할 수 없습니다.</font>
		<br>

		<input type="button" name="pChange" id="pChange" value="비밀번호 변경" onclick="pwdChange()">
		<div class="pwd" style="display: none;">
			비밀번호 : <input type="password" name="tPwd" id="tPwd" value="${t.tPwd }">
			<br>
			비밀번호확인 : <input type="password" name="tPwdCheck" id="tPwdCheck">
			<br>
			<input type="button" name="pCancel" id="pCancel" value="변경 취소" onclick="pwdCancel()">
		</div>
		<br>
		
		레스토랑 타입 :<input type="hidden" name="tType" id="tType" value="${t.tType }">
		<!-- 기존 선택된 값 가져오기 위한 것 --><input type="hidden" name="choicedType" id="choicedType" value="${t.tType }">
			<select name="type" id="type" onchange="RestType()">
				<option value="">선택하세요
				<option value="Korean">Korean
				<option value="Western">Western
				<option value="Japanese">Japanese
				<option value="Chinese">Chinese
				<option value="Contemporary">Contemporary
				<option value="Pub">Pub
				<option value="Bar">Bar
				<option value="Cafe">Cafe
				<option value="Bakery">Bakery
				<option value="BBQ">BBQ
				<option value="Buffet">Buffet
			</select>
		<br>
		
		레스토랑 이름 : <input type="text" name="tName" id="tName" value="${t.tName }">
		<br>

		레스토랑 전화번호 : 
		<!-- 수정시에 DB에 들어갈 값 --><input type="hidden" name="tPhone" id="tPhone" value="${t.tPhone }">
		<!-- 기존 선택된 값 가져오기 위한 것 --><input type="hidden" name="choicedPhone" id="choicedPhone" value="${t.tPhone }">
			<select name="p1" id="p1" onchange="phone()">
				<option value="">선택하세요
				<option value="02">02
				<option value="032">032
				<option value="042">042
				<option value="051">051
				<option value="053">053
				<option value="064">064
			</select>
			-<input type="text" name="p2" id="p2" value="${(t.tPhone).substring(4,8) }" onkeyup="phone()">
			-<input type="text" name="p3" id="p3" value="${(t.tPhone).substring(9,13) }" onkeyup="phone()">
		<br>
		
		레스토랑 주소 : 
		<!-- 수정시에 DB에 들어갈 값 --><input type="hidden" name="tAddr" id="tAddr" value="${t.tAddr }">
		<!-- 기존 선택된 값 가져오기 위한 것 --><input type="hidden" name="choicedAddr" id="choicedAddr" value="${t.tAddr }">
			<select name="a1" id="a1" onchange="addr()">
				<option value="">선택하세요
				<option value="서울시">서울시
				<option value="인천시">인천시
				<option value="대전시">대전시
				<option value="대구시">대구시
				<option value="부산시">부산시
				<option value="제주도">제주도
			</select>
			-<input type="text" name="a2" id="a2" value="${(t.tAddr).substring(4) }" onkeyup="addr()">
		<br>
		
		오픈시간 : 
		<!-- 수정시에 DB에 들어갈 값 --><input type="text" name="tTimeS" id="tTimeS" value="${t.tTimeS }">
		<!-- 기존 선택된 값 가져오기 위한 것 --><input type="text" name="choicedTimeS" id="choicedTimeS" value="${t.tTimeS }">
			<select name="s1" id="s1" onchange="timeSet()"></select>
		<br>
		
		마감시간 : 
		<!-- 수정시에 DB에 들어갈 값 --><input type="text" name="tTimeC" id="tTimeC" value="${t.tTimeC }">
		<!-- 기존 선택된 값 가져오기 위한 것 --><input type="text" name="choicedTimeC" id="choicedTimeC" value="${t.tTimeC }">
			<select name="c1" id="c1" onchange="timeSet()"></select>
		<br>
		
		휴무시간시작 : 
		<!-- 수정시에 DB에 들어갈 값 --><input type="text" name="tTimeBs" id="tTimeBs" value="${t.tTimeBs }">
		<!-- 기존 선택된 값 가져오기 위한 것 --><input type="text" name="choicedTimeBs" id="choicedTimeBs" value="${t.tTimeBs }">
			<select name="bs1" id="bs1" onchange="timeSet()"></select>
		<br>
		
		휴무시간끝 : 
		<!-- 수정시에 DB에 들어갈 값 --><input type="text" name="tTimeBc" id="tTimeBc" value="${t.tTimeBc }">
		<!-- 기존 선택된 값 가져오기 위한 것 --><input type="text" name="choicedTimeBc" id="choicedTimeBc" value="${t.tTimeBc }">
			<select name="bc1" id="bc1" onchange="timeSet()"></select>
		<br>
		
		휴무일 : 
		<!-- 수정시에 DB에 들어갈 값 --><input type="text" name="tHoliday" id="tHoliday" value="${t.tHoliday }">
		<!-- 기존 선택된 값 가져오기 위한 것 --><input type="text" name="choicedHoliday" id="choicedHoliday" value="${t.tHoliday }">
			<select name="h1" id="h1" onchange="holiday()">
				<option value="">선택하세요
				<option value="매주">매주
				<option value="매월">매월
				<option value="명절">명절
				<option value="기타">기타
			</select>
			<select name="h2" id="h2" onchange="holiday()">
				<option value="">선택하세요
				<option value="일요일">일요일
				<option value="월요일">월요일
				<option value="화요일">화요일
				<option value="수요일">수요일
				<option value="목요일">목요일
				<option value="금요일">금요일
				<option value="토요일">토요일
			</select>
			<input type="text" name="h3" id="h3" onchange="holiday()" style="display: none;">
		<br>
		
		레스토랑 이미지 :
		<input type="text" name="tImage" id="tImage" value="${t.tImage }">
		<br>
		
		레스토랑 메뉴 :
		<input type="text" name="tMenu" id="tMenu" value="${t.tMenu }">
		<br>
		
		<input type="submit" value="수정하기">
		<input type="reset" value="취소하기">
	</form>
</body>
</html>