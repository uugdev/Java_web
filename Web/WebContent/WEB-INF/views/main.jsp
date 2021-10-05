<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
    
<div class="container">

<div class="text-center">

<c:if test ="${empty login or not login}"> <!-- login == null || !login -->
	<strong>로그인이 필요합니다</strong><br>
	<button onclick="location.href = '/member/login';">로그인</button>
	<button onclick="location.href = '/member/join';">회원가입</button>
</c:if>

<c:if test="${not empty login and login }">
	<strong>${usernick }님, 환영합니다</strong><br>
	<button onclick="location.href = '/member/logout';">로그아웃</button>
	<button onclick="location.href = '/board/list';">게시판목록</button>

</c:if>

</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
