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
	listGoods Page
	
	<table border="1">
			<tr>
		<c:forEach var="t" items="${list }" varStatus="status">
			<td onclick="detail()">
				<a href="detailRestaurant.do?tNo=${t.tNo }"><img style="cursor: pointer;" src="resources/upload/${t.tImage }" width="200" height="200"></a><br>
				타입 : ${t.tType }<br>
				이름 : ${t.tName }<br>
				번호 : ${t.tPhoneF }-${t.tPhoneS }-${t.tPhoneT }<br>
				주소 : ${t.tAddrF } ${t.tAddrS } ${t.tAddrT } ${t.tAddrO }<br>
			</td>
			<c:if test="${status.count%3==0 }"><!-- 리스트 나열을 %n 만큼 해주기 위한 if문 -->
				</tr><tr>
			</c:if>
		</c:forEach>
			</tr>
	</table>
</body>
</html>