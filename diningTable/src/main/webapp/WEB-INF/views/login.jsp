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
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">

	// 처음 로그인화면은 회원 로그인이 보이도록 설정
	$(document).ready(function(){
		$("#member").show();
		$("#coMember").hide();
	})
	
	// 라디오버튼 체크에 따라 회원 혹은 레스토랑 로그인 페이지 설정
	function choiceType() {
		var type = $("input:radio[name='loginType']:checked").val();
		if(type=="회원"){
			$("#member").show();
			$("#coMember").hide();
		}else{
			$("#member").hide();
			$("#coMember").show();
		}
		
	}
</script>
</head>
<body>
<!-- 운영자는 개인회원 창에서 로그인 해야 하며
	운영자 : 1, 개인회원 : 2, 레스토랑 : 3 값을 준다.
 -->
	login Page
	<p>
		<div class="form-group">
			<label class="radio-inline">
				<input type="radio" name="loginType" value="회원" onchange="choiceType()" checked="checked">회원 로그인 
			</label>
			<label class="radio-inline">
				<input type="radio" name="loginType" value="레스토랑" onchange="choiceType()">레스토랑 로그인
			</label>
		</div>
		
		<div id="member" class="form-group">
			<form action="loginMember.do" method="post" class="form-inline">
				<p>
					<div class="form-group">
						<label>회원 이메일</label>
						<input type="text" name="mEmail" id="mEmail" value="" class="form-control" placeholder="이메일 @ 주소">
					</div>
				</p>
				<p>
					<div class="form-group">
						<label>비밀번호</label>
						<input type="password" name="mPwd" id="mPwd" value="" class="form-control" placeholder="비밀번호">
					</div>
				</p>
				<p>
					<div class="form-group">
						<input type="submit" value="로그인" class="btn btn-success">
						<input type="reset" value="취소" class="btn btn-default">
					</div>
				</p>
			</form>
		</div>
		
		<div id="coMember" class="form-group">
			<form action="loginCoMember.do" method="post" class="form-inline">
				<p>
					<div class="form-group">
						<label>레스토랑 이메일</label>
						<input type="text" name="tEmail" id="tEmail" value="" class="form-control" placeholder="이메일 @ 주소">
					</div>
				</p>
				<p>
					<div class="form-group">
						<label>비밀번호</label>
						<input type="password" name="tPwd" id="tPwd" value="" class="form-control" placeholder="비밀번호">
					</div>
				</p>
				<p>
					<div class="form-group">
						<input type="submit" value="로그인" class="btn btn-success">
						<input type="reset" value="취소" class="btn btn-default">
					</div>
				</p>
			</form>
		</div>
		
	</p>
</body>
</html>