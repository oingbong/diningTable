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
		var choicedType = $("#tType").val();
  		$("#type").val(choicedType).attr("selected", "selected");

  		
  		// 레스토랑 번호 선택값을 가져오기 위한 것
  		var choicedPhoneF = $("#tPhoneF").val();
  		$("#p1").val(choicedPhoneF).attr("selected", "selected");
  		
  		// 레스토랑 주소 선택값을 가져오기 위한 것
  		var choicedAddrF = $("#tAddrF").val();
  		$("#a1").val(choicedAddrF).attr("selected", "selected");
  		
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
		var choicedTimeS = $("#tTimeS").val();
		var choicedTimeC = $("#tTimeC").val();
		var choicedTimeBs = $("#tTimeBs").val();
		var choicedTimeBc = $("#tTimeBc").val();
  		$("#s1").val(choicedTimeS).attr("selected", "selected");
  		$("#c1").val(choicedTimeC).attr("selected", "selected");
  		$("#bs1").val(choicedTimeBs).attr("selected", "selected");
  		$("#bc1").val(choicedTimeBc).attr("selected", "selected");
  		
  		
  		// 레스토랑 휴무일 선택값을 가져오기 위한 것
		var choicedHoliday = $("#tHoliday").val();
  		var holidayF = choicedHoliday.substring(0,2);
  		var holidayS = choicedHoliday.substring(3);
  		
  		if(holidayF=="기타"){ // 기타일때 추가적인 것 보이기
  			$("#h2").hide();
			$("#h3").show();
			$("#h3").val(holidayS);
  		}else if(holidayF=="명절"){ // 명절일때 '명절'만 보이기
  			$("#h2").hide();
			$("#h3").hide();
  		}else{ // 매주 혹은 매월 일때 '매주/매월'과 '요일' 보이기
  			$("#h2").show();
			$("#h3").hide();
  		}

  		$("#h1").val(holidayF).attr("selected", "selected");
  		$("#h2").val(holidayS).attr("selected", "selected");
  		
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
		var t = $("#type option:selected").val();
		$("#tType").val(t);
	}
 	
 	
 	// 레스토랑 번호 관련
  	function phone() {
  		event = event || window.event;
  		var keyID = (event.which) ? event.which : event.keyCode;
  		if((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) 
  			|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 
  			|| $("#p1 option:selected").val()){
  			
	  			var phoneF = $("#p1").val();
				$("#tPhoneF").val(phoneF);
  		}else{
  			return false;
  		}
	}
 	
  	// 레스토랑 주소 읽어오기
  	function addr() {
		var addr  = $("#a1").val();
		$("#tAddrF").val(addr);
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
			$("#tHoliday").val(h1 + " " + h3);
		}else if(h1=="명절"){ // 명절일때 '명절'만 입력
			$("#h2").hide();
			$("#h3").hide();
			$("#tHoliday").val(h1);
		}else{ // 매주 혹은 매월 일때 '매주/매월'과 '요일' 입력
			$("#h2").show();
			$("#h3").hide();
			$("#tHoliday").val(h1 + " " + h2);
		}
	}
 	
 	// 비밀번호 일치 판단 후 사용자에게 보여주기
  	function pwd() {
		var pwd = $("#tPwd").val();
		var pwdCheck = $("#tPwdCheck").val();
		if(pwd==pwdCheck){
			$("#pwdCheck *").remove();
			$("#pwdCheck").append("<font color='blue'>" + "비밀번호가 일치합니다." + "</font>")
		}else{
			$("#pwdCheck *").remove();
			$("#pwdCheck").append("<font color='red'>" + "비밀번호가 일치하지 않습니다." + "</font>")
		}
	}
 	
</script>
</head>
<body>
	<form action="updateRestaurant.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="tNo" id="tNo" value="${t.tNo }">

		<input type="hidden" name="tEmail" id="tEmail" value="${t.tEmail }">
		레스토랑 이메일 : ${t.tEmail }<font color="red" size="0.5">이메일은 변경할 수 없습니다.</font>
		<br>

		<input type="button" name="pChange" id="pChange" value="비밀번호 변경" onclick="pwdChange()">
		<div class="pwd" style="display: none;">
			비밀번호 : <input type="password" name="tPwd" id="tPwd" value="${t.tPwd }" onkeyup="pwd()">
			<br>
			비밀번호확인 : <input type="password" name="tPwdCheck" id="tPwdCheck" onkeyup="pwd()">
			<br>
			
			<!-- 비밀번호 일치 확인 --><div id="pwdCheck"></div>
			
			<input type="button" name="pCancel" id="pCancel" value="변경 취소" onclick="pwdCancel()">
		</div>
		<br>
		
		레스토랑 타입 :<input type="hidden" name="tType" id="tType" value="${t.tType }">
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
		<input type="hidden" name="tPhoneF" id="tPhoneF" value="${t.tPhoneF }">
			<select name="p1" id="p1" onchange="phone()">
				<option value="">선택하세요
				<option value="02">02
				<option value="032">032
				<option value="042">042
				<option value="051">051
				<option value="053">053
				<option value="064">064
			</select>
			-<input type="text" name="tPhoneS" id="tPhoneS" value="${t.tPhoneS }">
			-<input type="text" name="tPhoneT" id="tPhoneT" value="${t.tPhoneT }">
		<br>
		
		레스토랑 주소 : 
		<input type="hidden" name="tAddrF" id="tAddrF" value="${t.tAddrF }">
			<select name="a1" id="a1" onchange="addr()">
				<option value="">선택하세요
				<option value="서울시">서울시
				<option value="인천시">인천시
				<option value="대전시">대전시
				<option value="대구시">대구시
				<option value="부산시">부산시
				<option value="제주도">제주도
			</select>
			-<input type="text" name="tAddrS" id="tAddrS" value="${t.tAddrS }">
			-<input type="text" name="tAddrT" id="tAddrT" value="${t.tAddrT }">
			-<input type="text" name="tAddrO" id="tAddrO" value="${t.tAddrO }">
		<br>
		
		오픈시간 : 
		<input type="hidden" name="tTimeS" id="tTimeS" value="${t.tTimeS }">
			<select name="s1" id="s1" onchange="timeSet()"></select>
		<br>
		
		마감시간 : 
		<input type="hidden" name="tTimeC" id="tTimeC" value="${t.tTimeC }">
			<select name="c1" id="c1" onchange="timeSet()"></select>
		<br>
		
		휴무시간시작 : 
		<input type="hidden" name="tTimeBs" id="tTimeBs" value="${t.tTimeBs }">
			<select name="bs1" id="bs1" onchange="timeSet()"></select>
		<br>
		
		휴무시간끝 : 
		<input type="hidden" name="tTimeBc" id="tTimeBc" value="${t.tTimeBc }">
			<select name="bc1" id="bc1" onchange="timeSet()"></select>
		<br>
		
		휴무일 : 
		<input type="hidden" name="tHoliday" id="tHoliday" value="${t.tHoliday }">
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
		<input type="file" name="uploadFile" id="uploadFile" value="">
		<br>
		
		레스토랑 메뉴 :
		<input type="text" name="tMenu" id="tMenu" value="${t.tMenu }">
		<br>
		
		<input type="submit" value="수정하기">
		<input type="reset" value="취소하기">
	</form>
</body>
</html>