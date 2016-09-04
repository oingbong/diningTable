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

	// 지역 select option 값 주기 위한 배열
	var selectArea = ["지역", "서울시", "인천시", "대전시", "대구시", "부산시", "제주도"];

	// 상세 지역 관련된 select option 값 주기 위한 배열
	var seoul = ["상세지역","강남구","강동구","강북구","강서구","관악구","광진구","구로구",
	             "금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구",
	             "성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	var incheon = ["상세지역","강화군", "계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "옹진군", "중구"];
	var daejeon = ["상세지역", "대덕구", "동구", "서구", "유성구", "중구"];
	var daegu = ["상세지역","남구", "달서구", "달성군", "동구", "북구", "서구", "수성구", "중구"];
	var busan = ["상세지역", "강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구"];
	var jeju = ["상세지역", "서귀포시", "제주시"];
		
	// 레스토랑 타입 select option 값 주기 위한 배열
	var restType = ["레스토랑타입", "Korean", "Western", "Japanese", "Chinese", "Asian", "Contemporary", "Pub", "Bar", "Cafe", "Bakery", "BBQ", "Buffet"];
	
	
		$(document).ready(function() {
			
			// 초기 지역 선택값 배열 추가해주기
			for(i=0; i<selectArea.length; i++){
				$("#addrSelectF").append("<option value='"+selectArea[i]+"'>"+selectArea[i]+"</option>");
			}
			
			// 초기 레스토랑 타입 선택값 배열 추가해주기
			for(i=0; i<restType.length; i++){
				$("#typeSelect").append("<option value='"+restType[i]+"'>"+restType[i]+"</option>");
			}
			
			// 초기 지역 선택값을 '선택하세요'로 설정
			$("#addrSelectF").val("지역").attr("selected","selected");
			
			var ff = $("#addrSelectF option:selected").val();
			if(ff=="지역"){
					$("#addrSelectS").append("<option value=''>상세지역</option>");
			}  
			
			
		})
	
	
	 	// 범위 큰 지역을 선택했을 경우 발생하는 이벤트
		function addrSetF() {
			
			var addrSelectF = $("#addrSelectF option:selected").val(); // 선택값을 가져오기 위한 것
			
			if(addrSelectF=="지역"){
				$("#tAddrF").val(""); // '지역'를 선택할 경우 아무것도 입력 하지 않음
			}else{
				$("#tAddrF").val(addrSelectF); // 그외는 선택값을 입력
			}
			
			// 다른지역을 선택할 경우 해야하는 두가지
			$("#tAddrS").val(""); // 상세지역의 값을 없애주기 위한 것 
			$("#addrSelectS *").remove();  // 상세지역의 기존 선택값을 삭제 해주기 위한 것
			
			// 범위 큰 지역의 선택값에 따른 상세지역의 선택값을 주기 위한 것
			switch(addrSelectF){
				case "서울시" : for(i=0; i<seoul.length; i++){
					$("#addrSelectS").append("<option value='"+seoul[i]+"'>"+seoul[i]+"</option>");
				};break;
				case "인천시" : for(i=0; i<incheon.length; i++){
					$("#addrSelectS").append("<option value='"+incheon[i]+"'>"+incheon[i]+"</option>");
				};break;
				case "대전시" : for(i=0; i<daejeon.length; i++){
					$("#addrSelectS").append("<option value='"+daejeon[i]+"'>"+daejeon[i]+"</option>");
				};break;
				case "대구시" : for(i=0; i<daegu.length; i++){
					$("#addrSelectS").append("<option value='"+daegu[i]+"'>"+daegu[i]+"</option>");
				};break;
				case "부산시" : for(i=0; i<busan.length; i++){
					$("#addrSelectS").append("<option value='"+busan[i]+"'>"+busan[i]+"</option>");
				};break;
				case "제주도" : for(i=0; i<jeju.length; i++){
					$("#addrSelectS").append("<option value='"+jeju[i]+"'>"+jeju[i]+"</option>");
				};break;
				case "지역" : $("#addrSelectS").append("<option value=''>상세지역</option>");break;
			}
		}
		
	
		// 상세지역을 선택했을 경우 발생하는 이벤트
		function addrSetS() {
			var addrSelectS = $("#addrSelectS option:selected").val();
			
			if(addrSelectS=="상세지역"){
				$("#tAddrS").val(""); // '상세지역'를 선택할 경우 아무것도 입력 하지 않음
			}else{
				$("#tAddrS").val(addrSelectS); // 그외는 선택값을 입력
			}
			
		}
		
		
		// 레스토랑 타입을 선택했을 경우 발생하는 이벤트
		function typeSet() {
			var typeSelect = $("#typeSelect option:selected").val();
			
			if(typeSelect=="레스토랑타입"){
				$("#tType").val("");
			}else{
				$("#tType").val(typeSelect);
			}
		}
		
</script>
</head>
<body>
	<a href="listMember.do">listMember</a>&nbsp;
	<a href="listCoMember.do">listCoMember</a>&nbsp;
	<a href="listRestaurant.do">listRestaurant</a>&nbsp;
	<a href="main.do">main</a>&nbsp;
	<c:choose>
		<c:when test="${mNo != null}"><!-- 개인회원 경우 보이는 메뉴 -->
			<a href="listReservation.do">예약 정보 확인</a>&nbsp;
			<a href="detailMember.do">change information</a>&nbsp;
			<a href="logout.do">logout</a>&nbsp;
		</c:when>
		<c:when test="${tNo != null}"><!-- 레스토랑 회원 경우 보이는 메뉴 -->
			<a href="listReservationCo.do">예약자 정보 확인</a>&nbsp;
			<a href="detailCoMember.do">change informationR</a>&nbsp;
			<a href="logout.do">logout</a>&nbsp;
		</c:when>
		<c:otherwise><!-- 로그인 하기 전 -->
			<a href="login.do">login</a>&nbsp;
			<a href="insertMember.do">insertMember</a>&nbsp;
			<a href="insertCoMember.do">insertRestaurant</a>&nbsp;
		</c:otherwise>
	</c:choose>
	
	<br>
	
	<!-- 검색을 위한 것 -->
	<form action="">
		지역 : <input type="hidden" name="tAddrF" id="tAddrF" value="">
		<select name="addrSelectF" id="addrSelectF" onchange="addrSetF()"></select>
		
		상세지역 : <input type="hidden" name="tAddrS" id="tAddrS" value="">
		<select name="addrSelectS" id="addrSelectS" onchange="addrSetS()"></select>
		
		레스토랑 타입 : <input type="hidden" name="tType" id="tType" value="">
		<select name="typeSelect" id="typeSelect" onchange="typeSet()"></select>
		
	</form>
	
</body>
</html>