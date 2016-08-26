<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
 	$(document).ready(function(){
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
		
		// 비밀번호 체크
		$(".submit").click(function (event) { 
			var tPwd = $("#tPwd").val();
			var tPwdCheck = $("#tPwdCheck").val();
			
			if(tPwd != tPwdCheck){
				alert("비밀번호가 다릅니다.")
				event.preventDefault();
			}
		});

		// 이메일 중복 체크
		$("#eCheck").click(function(){ 
			var tEmail = $("#tEmail").val();
			$.getJSON("checkEmailRest.do",{tEmail:tEmail},function(data){
				re=data.re;
				if(re==1){
					alert("이미 있는 이메일입니다.");
				}else{
					alert("사용 가능한 이메일입니다.");
				}
			});
		});
	})
	
	// 이메일 합치기
	function email() {
 		var email = $("#e1").val() + $("#e2").val();
		$("#tEmail").val(email.replace(/[^a-z,0-9,@,.]/gi,"")); // 한글제외 한 이메일 형식만 사용가능
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
	<!-- 
		기능
			1-1. 이메일 주소 선택시 자동입력 o (해결 못한것 : '직접입력' 선택 후 메일주소 선택하면 값 중복 (예) : test@naver.com@naver.com)
			1-2. 이메일 중복확인 x
			1-3. 이메일 한글 제한 o
			1-4. 이메일 중복시에 가입 불가능 x , 현재는 이메일 중복 가입 됨..
			2-1. 비밀번호 두번체크 o
			2-2. 비밀번호 숫자+영문 혼합 체크 x
			3-1. 타입 처음은 select 박스로 설정
			3-2. 타입 선택 안할시 경고창 뜸 x
			4-1. 전화 번호 선택시 자동입력 o
			4-2. 전화 번호 숫자만 입력 가능, 문자 제한
			4-3. 전화 번호 길이 수 제한 x
			5-1. 주소 자동입력 o 
			5-2. 주소 '시' 선택하면 '시'에 따른 '구' 나오게 하는것 x
			6-1. 시간관련된 것들은 배열을 이용해 select option 값 생성 o
			7-1. 휴무 현재는 하나만 선택 가능 o
			7-2. 휴무 복수선택 x
			8-1. 레스토랑 이미지 삽입 x
			9-1. 메뉴 이미지 삽입 x
	 -->
	insert Restaurant Page
	<form action="insertRestaurant.do" method="post">
	
		이메일 : <input type="hidden" name="tEmail" id="tEmail" value="">
				<input type="text" name="e1" id="e1" value="" onchange="email()">
				@
				<select name="e2" id="e2" onchange="email()">
					<option value="">직접입력
					<option value="@naver.com">naver.com
					<option value="@gmail.com">gmail.com
					<option value="@nate.com">nate.com
					<option value="@daum.net">daum.net
				</select>
			<input type="button" name="eCheck" id="eCheck" value="중복 확인">
		<br>
		
		비밀번호 : <input type="password" name="tPwd" id="tPwd" value="">
		<br>
		
		비밀번호확인 :  <input type="password" name="tPwdCheck" id="tPwdCheck" value="">
		<br>
		
		레스토랑 타입 : <input type="hidden" name="tType" id="tType" value="">
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
		
		레스토랑 명 : <input type="text" name="tName" id="tName" value="">
		<br>
		
		전화번호 : <input type="hidden" name="tPhone" id="tPhone" value="">
			<select name="p1" id="p1" onchange="phone()">
				<option value="">선택하세요
				<option value="02">02
				<option value="032">032
				<option value="042">042
				<option value="051">051
				<option value="053">053
				<option value="064">064
			</select>
			-<input type="text" name="p2" id="p2" value="" onkeyup="phone()">
			-<input type="text" name="p3" id="p3" value="" onkeyup="phone()">
		<br>
		
		주소 : <input type="hidden" name="tAddr" id="tAddr" value="">
			<select name="a1" id="a1" onchange="addr()">
				<option value="">선택하세요
				<option value="서울시">서울시
				<option value="인천시">인천시
				<option value="대전시">대전시
				<option value="대구시">대구시
				<option value="부산시">부산시
				<option value="제주도">제주도
			</select>
			-<input type="text" name="a2" id="a2" value="" onkeyup="addr()">
		<br>
		
		오픈시간 : <input type="hidden" name="tTimeS" id="tTimeS" value="">
			<select name="s1" id="s1" onchange="timeSet()"></select>
		<br>
		
		마감시간 : <input type="hidden" name="tTimeC" id="tTimeC" value="">
			<select name="c1" id="c1" onchange="timeSet()"></select>
		<br>
		
		휴무시간시작 : <input type="hidden" name="tTimeBs" id="tTimeBs" value="">
			<select name="bs1" id="bs1" onchange="timeSet()"></select>
		<br>
		
		휴무시간끝 : <input type="hidden" name="tTimeBc" id="tTimeBc" value="">
			<select name="bc1" id="bc1" onchange="timeSet()"></select>
		<br>
		
		휴무일 : <input type="hidden" name="tHoliday" id="tHoliday" value="">
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
		
		레스토랑 이미지 : <input type="text" name="tImage" id="tImage" value="">
		<br>
		
		레스토랑 메뉴 : <input type="text" name="tMenu" id="tMenu" value="">
		<br>
		
		<input type="submit" value="등록하기" class="submit">
		<input type="reset" value="취소하기"><br>
	</form>
</body>
</html>