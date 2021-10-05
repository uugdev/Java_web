<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="container">
<div class="text-center">

<form action="<%=request.getContextPath() %>/member/join" method="post">

<label>ID
<input type="text" id="userid" name="userid" /></label><br>
<label>PASS
<input type="password" id="userpw" name="userpw" /></label><br><br>
<label>NICK
<input type="text" id="usernick" name="usernick" /></label><br><br>

<button>회원가입</button>

</form>

</div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />