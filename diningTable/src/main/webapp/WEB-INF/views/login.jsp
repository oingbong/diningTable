<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">

	// 처음 로그인화면은 회원 로그인이 보이도록 설정
	$(document).ready(function(){
		$("#member").show();
		$("#restaurant").hide();
	})
	
	// 라디오버튼 체크에 따라 회원 혹은 레스토랑 로그인 페이지 설정
	function choiceType() {
		var type = $("input:radio[name='loginType']:checked").val();
		if(type=="회원"){
			$("#member").show();
			$("#restaurant").hide();
		}else{
			$("#member").hide();
			$("#restaurant").show();
		}
		
	}
</script>
</head>
<body>
<!-- 운영자는 개인회원 창에서 로그인 해야 하며
	운영자 : 1, 개인회원 : 2, 레스토랑 : 3 값을 준다.
 -->
	login Page<br>
	<input type="radio" name="loginType" value="회원" onchange="choiceType()" checked="checked">회원 로그인 &nbsp;&nbsp;
	<input type="radio" name="loginType" value="레스토랑" onchange="choiceType()">레스토랑 로그인
	<div id="member">
		<form action="login.do" method="post">
			회원 이메일 : <input type="text" name="mEmail" id="mEmail" value=""><br>
			비밀번호 : <input type="password" name="mPwd" id="mPwd" value=""><br>
			<input type="submit" value="로그인"><br>
			<input type="reset" value="취소"><br>
		</form>
	</div>
	<div id="restaurant">
		<form action="loginRest.do" method="post">
			레스토랑 이메일 : <input type="text" name="tEmail" id="tEmail" value=""><br>
			비밀번호 : <input type="password" name="tPwd" id="tPwd" value=""><br>
			<input type="submit" value="로그인"><br>
			<input type="reset" value="취소"><br>
		</form>
	</div>
</body>
</html>