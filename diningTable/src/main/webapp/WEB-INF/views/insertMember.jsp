<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
 	$(document).ready(function(){
		$(".submit").click(function (event) { // 비밀번호 체크
			var mPwd = $("#mPwd").val();
			var mPwdCheck = $("#mPwdCheck").val();
			
			if(mPwd != mPwdCheck){
				alert("비밀번호가 다릅니다.")
				event.preventDefault();
			}
		});

		$("#eCheck").click(function(){ // 이메일 중복 체크
			var mEmail = $("#mEmail").val();
			$.getJSON("checkEmail.do",{mEmail:mEmail},function(data){
				re=data.re;
				if(re==1){
					alert("이미 있는 이메일입니다.");
				}else{
					alert("사용 가능한 이메일입니다.");
				}
			});
		});
	}) 
	
	function email() {
		var emailF = $("#e1").val();
		var emailS = $("#e2").val();
		var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글찾기
		
		if(check.test(emailF)){
			$("#e1").val("");
			$("#mEmail").val("");
			alert("이메일 형식이 맞지 않습니다(한글포함)");
		}else{
			$("#mEmail").val(emailF + emailS);
		}
	}
	
  	function phone() {
  		var selectP1 = $("#p1 option:selected").val();
  		$("#mPhoneF").val(selectP1);
  		var mPhoneS = $("#mPhoneS").val();
  		var mPhoneT = $("#mPhoneT").val();
  		var check = /[^0-9]/; // 숫자가 아닌 것 찾기
  		
  		// 하이라이트 추가예정
  		if(check.test(mPhoneS)){
  			$("#mPhoneS").val("");
  			alert("숫자만 입력해주세요");
  		}else if(check.test(mPhoneT)){
  			$("#mPhoneT").val("");
  			alert("숫자만 입력해주세요")
  		}
	}
	
	function birth() {
		var b1 = $("#b1 option:selected").val();
		var b2 = $("#b2 option:selected").val();
		var b3 = $("#b3 option:selected").val();
		var birth = b1 + "-" + b2 + "-" + b3;
		$("#mBirth").val(birth);
	}
	
	// 비밀번호 일치 판단 후 사용자에게 보여주기
	function pwd() {
		var pwd = $("#mPwd").val();
		var pwdCheck = $("#mPwdCheck").val();
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
	<!-- 
		기능
			1-1. 이메일 주소 선택시 자동입력 o (해결 못한것 : '직접입력' 선택 후 메일주소 선택하면 값 중복 (예) : test@naver.com@naver.com)
			1-2. 이메일 중복확인 o
			1-3. 이메일 한글 제한 o
			2-1. 핸드폰 번호 선택시 자동입력 o
			2-2. 핸드폰 숫자만 입력 가능, 문자 제한
			2-3. 핸드폰 번호 길이 수 제한 x
			3-1. 비밀번호 두번체크 o
			3-2. 비밀번호 숫자+영문 혼합 체크 x
			4-1. 생일 선택시 자동 입력 o
			4-2. 생일 선택시 10 이하 숫자는 '0' 붙게 함 (update 할 때 substring 이용하기때문에 자리수 똑같게 해야하기 때문에)
			5-1. 타입 처음은 자동 실버 입력 o
	 -->
	insertMember Page
		<!-- 부트스크랩 적용을 받지 않기 위해 따로 위치시킴 -->
		<!-- 이메일 데이터 입력값 --><input type="hidden" name="mEmail" id="mEmail" value=""> 
		<!-- 타입 : --> <input type="hidden" name="mType" id="mType" value="실버회원">
	<form action="insertMember.do" method="post" class="form-inline"> <!-- 인라인 폼 -->
	
		<p> <!-- <p>태그 사용 이유 : 자연스러운 줄바꿈을 위함 -->
			<div class="form-group">
				<label>이메일</label>
					<input type="text" name="e1" id="e1" value="" onchange="email()" class="form-control" placeholder="이메일 아이디 입력">
					<label>@</label>
					<select name="e2" id="e2" onchange="email()" class="form-control">
						<option value="">직접입력
						<option value="@naver.com">naver.com
						<option value="@gmail.com">gmail.com
						<option value="@nate.com">nate.com
						<option value="@daum.net">daum.net
					</select>
				<input type="button" name="eCheck" id="eCheck" value="중복 확인" class="btn btn-default">
			</div>
		</p>
		
		<p>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" name="mPwd" id="mPwd" value="" onkeyup="pwd()" class="form-control" placeholder="비밀번호">
			</div>
		</p>
		
		<p>
			<div class="form-group">
				<label>비밀번호확인</label>
				<input type="password" name="mPwdCheck" id="mPwdCheck" value="" onkeyup="pwd()" class="form-control" placeholder="비밀번호확인">
			</div>
		</p>

		<!-- 비밀번호 일치 확인 --><div id="pwdCheck"></div>
		
		<p>
			<div class="form-group">
				<label>이름</label>
				<input type="text" name="mName" id="mName" value="" class="form-control" placeholder="이름">
			</div>
		</p>
		
		<p>
			<div class="form-group">
				<label>핸드폰</label>
				<input type="hidden" name="mPhoneF" id="mPhoneF" value=""> 
				<select name="p1" id="p1" onchange="phone()" class="form-control">
					<option value="">선택하세요
					<option value="010">010
					<option value="011">011
					<option value="016">016
					<option value="017">017
					<option value="019">019
				</select>
				<label>-</label>
				<input type="text" name="mPhoneS" id="mPhoneS" value="" onchange="phone()" class="form-control">
				<label>-</label>
				<input type="text" name="mPhoneT" id="mPhoneT" value="" onchange="phone()" class="form-control">
			</div>
		</p>
		
		<p>
			<div class="form-group">
				<label>성별</label>
				<label class="radio-inline">
					<input type="radio" name="mGender" value="남">남
				</label>
				<label class="radio-inline">
					<input type="radio" name="mGender" value="여">여
				</label>
			</div>
		</p>
		
		<p>
			<div class="form-group">
			<label>생일</label>
			<input type="hidden" name="mBirth" id="mBirth" value="">
				<select name="b1" id="b1" onchange="birth()" class="form-control">
					<c:forEach var="i" begin="1930" end="2016">
						<option value="${i }">${i }
					</c:forEach>
				</select>
				<select name="b2" id="b2" onchange="birth()" class="form-control">
					<c:forEach var="i" begin="1" end="12">
						<c:choose>
							<c:when test="${i < 10 }">
								<option value="0${i }">0${i }
							</c:when>
							<c:otherwise>
								<option value="${i }">${i }
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				<select name="b3" id="b3" onchange="birth()" class="form-control">
					<c:forEach var="i" begin="1" end="31">
						<c:choose>
							<c:when test="${i < 10 }">
								<option value="0${i }">0${i }
							</c:when>
							<c:otherwise>
								<option value="${i }">${i }
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</div>
		</p>	
			
		<input type="submit" value="회원가입" class="submit btn btn-success"> <!-- class 두개 -->
		<input type="reset" value="취소" class="btn btn-warning">
	</form>
</body>
</html>