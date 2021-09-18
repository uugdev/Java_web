<%@page import="java.util.Date"%>
<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 자바에서 날짜/시간을 표현하는 데이터타입(클래스) --%>
<%-- 	java.util.Date : 고정된 날짜/시간(상수)를 표현 --%>

<%-- 	java.util.Calender : 고정된 날짜/시간(상수)를 표현 --%>

<%-- 	java.util.GregorianCalencder : 고정된 날짜/시간(상수)를 표현
			Calender의 하위 클래스
			날짜/시간 데이터를 생성할 수 있게 해준다
			그레고리력(양력)을 표현하기에 적절한 클래스 --%>

<c:set var="testTime"
	value="<%=new GregorianCalendar(2021, 4, 6, 19, 20, 21).getTime() %>" />
	
<%-- 1월을 0으로 표현한다. 12월은 11 --%>
${testTime }

<%----------------------------------------------------------------------- --%>

<%-- 퀴즈. --%>
<%--	현재시간을 기준시간으로 생각한다 --%>

<%--	시간1, 시간2 지정하여 생성한다 --%>
<%--	시간1 : 2021-4-3 10:54:23 --%>
<%--	시간2 : 2021-9-17 11:21:33 --%>

<%--	JSTL을 이용하여 현재시간과 비교하여 시간1, 시간2를 출력한다 --%>
<%--	기준날짜보다 이전 날짜라면 연-월-일 로 출력 --%>
<%--	기준날짜와 같은 날짜라면 시:분 으로 출력 --%>

<%-- 	c:if, c:choose, c:when, c:set, fmt:formatDate 등을 활용한다 --%>

<%--------------------------------------------------------------------------- --%>

<%-- 시간1, 시간2를 변수에 저장하기(java.util.Date) --%>
<c:set var="time1" value="<%= new GregorianCalendar(2021,3, 3, 10, 54, 23).getTime() %>" />
<c:set var="time2" value="<%= new GregorianCalendar(2021, 8, 17, 11, 21, 33).getTime() %>" />

<%-- 시간1, 시간2를 변환(yyyyMMdd)하여 변수에 저장 --%>
<fmt:formatDate value="${time1 }" pattern="yyyyMMdd" var="time1Str" />
<fmt:formatDate value="${time2 }" pattern="yyyyMMdd" var="time2Str" />

<%-- 현재 날짜 --%>
<fmt:formatDate value="<%=new Date() %>" pattern="yyyyMMdd" var="nowStr" />

<hr>
nowStr: ${nowStr }<br>
time1Str: ${time1Str }<br>
time2Str: ${time1Str }<br>

<hr>

time1:
<c:choose>
	<c:when test="${time1Str lt nowStr }">
		<fmt:formatDate value="${time1 }" pattern="yyyy-MM-dd" />
	</c:when>
	<c:when test="${time1Str eq nowStr }">
		<fmt:formatDate value="${time1 }" pattern="HH:mm" />
	</c:when>
</c:choose>

<hr>
time2:
<c:choose>
	<c:when test="${time2Str lt nowStr }">
		<fmt:formatDate value="${time2 }" pattern="yyyy-MM-dd" />
	</c:when>
	<c:when test="${time2Str eq nowStr }">
		<fmt:formatDate value="${time2 }" pattern="HH:mm" />
	</c:when>
</c:choose>


</body>
</html>