<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	main Page
	메인화면
	<c:if test="${login==1 }"><script>alert('운영자 로그인 하였습니다.')</script> </c:if>
	<c:if test="${login==2 }"><script>alert('개인회원 로그인 하였습니다.')</script></c:if>	
	<c:if test="${login==3 }"><script>alert('레스토랑 로그인 하였습니다.')</script></c:if>	
	<c:if test="${logout==1 }"><script>alert('로그아웃 되었습니다.')</script></c:if>	
</body>
</html>