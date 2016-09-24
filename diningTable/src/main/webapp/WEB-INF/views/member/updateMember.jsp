<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		// 핸드폰 앞자리 선택값을 가져오기 위한 것
		var phoneFirst = $("#mPhoneF").val();
  		$("#p1").val(phoneFirst).attr("selected", "selected"); 
	
		// 생일 선택값을 가져오기 위한 것
		var m1 = $("#m1").val();
		var m2 = $("#m2").val();
		var m3 = $("#m3").val();
		
		$("#b1").val(m1).attr("selected", "selected");
		$("#b2").val(m2).attr("selected", "selected");
		$("#b3").val(m3).attr("selected", "selected");
		
		// 성별 선택값을 가져오기 위한 것
		var genderSelected = $("#genderSelected").val();
		$("input:radio[name='mGender']:radio[value="+genderSelected+"]").attr('checked', true);
		
		// 비밀번호 일치하는지 확인
		$(".submit").click(function (event) {
			var mPwd = $("#mPwd").val();
			var mPwdCheck = $("#mPwdCheck").val();
			
			if(mPwd != mPwdCheck){
				alert("비밀번호가 다릅니다.")
				event.preventDefault();
			}
		});
		
	})
	
	function pwdChange() {
		$(".pwd").show();
		$("#pChange").hide();
	}
	
	function pwdCancel() {
		$(".pwd").hide();
		$("#pChange").show();
	}

	function phone() {
  		event = event || window.event;
  		var keyID = (event.which) ? event.which : event.keyCode;
  		if((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) 
  			|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 
  			|| $("#p1 option:selected").val()){
  			
	  			var phoneF = $("#p1").val();
				$("#mPhoneF").val(phoneF);
  		}else{
  			return false;
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
	<form action="updateMember.do" method="post" class="form-inline"> <!-- 인라인 폼 -->
		<input type="hidden" name="mNo" id="mNo" value="${m.mNo }"> <!-- 회원 번호 데이터 입력값 -->
		
		<p>
			<div class="form-group">
				<label>이메일</label>
				<input type="text" value="${m.mEmail }" name="mEmail" id="mEmail" readonly="readonly" class="form-control">
				<font color="red" size="0.5">이메일은 변경할 수 없습니다.</font> 
			</div>
		</p>
		
		<p>
			<input type="button" name="pChange" id="pChange" value="비밀번호 변경" onclick="pwdChange()" class="btn btn-default">
			
			<div class="pwd form-group" style="display: none;"> <!-- class 두개 -->
				<p>
					<div class="form-group">
						<label>비밀번호</label>
						<input type="password" name="mPwd" id="mPwd" value="${m.mPwd }" onkeyup="pwd()" class="form-control">
					</div>
				</p>
				
				<p>
					<div class="form-group">
						<label>비밀번호 확인</label>
						<input type="password" name="mPwdCheck" id="mPwdCheck" onkeyup="pwd()" class="form-control">
					</div>
				</p>
				
				<!-- 비밀번호 일치 확인 -->
				<p><div id="pwdCheck"></div></p>
				
				<input type="button" name="pCancel" id="pCancel" value="변경 취소" onclick="pwdCancel()" class="btn btn-default">
			</div>
					
		</p>
		
		<p>
			<div class="form-group">
				<label>회원 타입</label>
				<input type="text" value="${m.mType }" name="mType" id="mType" readonly="readonly" class="form-control">
				<font color="red" size="0.5">관리자만 변경 가능합니다.</font>
			</div>
		</p>
		
		<p>
			<div class="form-group">
				<label>이름</label>
				<input type="text" name="mName" id="mName" value="${m.mName }" class="form-control">
			</div>
		</p>

		<p>
			<div class="form-group">
				<label>핸드폰</label>
				<input type="hidden" name="mPhoneF" id="mPhoneF" value="${m.mPhoneF }">
				<select name="p1" id="p1" onchange="phone()" class="form-control">
					<option value="">선택하세요
					<option value="010">010
					<option value="011">011
					<option value="016">016
					<option value="017">017
					<option value="019">019
				</select>
				<label>-</label>
				<input type="text" name="mPhoneS" id="mPhoneS" value="${m.mPhoneS }" onchange="phone()" class="form-control">
				<label>-</label>
				<input type="text" name="mPhoneT" id="mPhoneT" value="${m.mPhoneT }" onchange="phone()" class="form-control">
			</div>
		</p>		
		
		<p>
			<div class="form-group">
				<label>성별</label>
				<input type="hidden" name="genderSelected" id="genderSelected" value="${m.mGender }">
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
				<input type="hidden" name="mBirth" id="mBirth" value="${m.mBirth }">
				<input type="hidden" name="m1" id="m1" value="${(m.mBirth).substring(0,4) }">
				<input type="hidden" name="m2" id="m2" value="${(m.mBirth).substring(5,7) }">
				<input type="hidden" name="m3" id="m3" value="${(m.mBirth).substring(8,10) }">
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

		<input type="submit" value="수정하기" class="submit btn btn-success"> <!-- class 여러개 -->
		<input type="reset" value="취소하기" class="btn btn-warning">
	</form>
</body>
</html>