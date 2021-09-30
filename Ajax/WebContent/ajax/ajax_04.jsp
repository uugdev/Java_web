<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/httpRequest.js"></script>

<script type="text/javascript">
function ajaxToServer() {
	console.log("ajaxToServer() called")
	
	var params = "username=" + document.f.username.value + "&content=" + document.f.content.value;
	
	sendRequest("POST", "/ajax/ajax_04_ok.jsp", params, ajaxFromServer);
	
}

function ajaxFromServer() {
	console.log("ajaxFromServer() called")
	
		if(httpRequest.readyState == 4) { //DONE, 응답 완료
			if(httpRequest.status == 200) { //200 OK. 정상 응답
				console.log("AJAX 정상 응답")
				
				//응답데이터를 div에 반영하기
// 				result.innerHTML += httpRequest.responseText;
				appendResult();	
			
				f.username.value = "";
				f.content.value = "";
				
			} else {
				console.log("AJAX 요청/응답 에러")
			}
	}
}


</script>
</head>
<body>

<h1>AJAX 04</h1>
<hr>

<!-- 이름, <input>태그, id="username" -->
<!-- 내용, <input>태그, id="content" -->

<!-- 이름, 내용 두가지 데이터를 ajax_04_ok.jsp로 전송 -->
<!-- 전송한 데이터를 이용하여 응답데이터로 작성한다 -->

<!-- 응답 받은 데이터를 이용하여 <div>를 생성하고, 그 안에 데이터를 기록 -->
<!-- 형식

	<div>
		name: Alice
		content: 안녕하세요!
		
		Alice님, 안녕하세요!
	</div>
 
 -->
 
<!-- 응답받은 <div>데이터는 <button> 하단에 계속해서 추가되도록 만든다 -->

<!-- --------------------------------------------------------------------------- -->

<form name="f">
	<label>이름 <input type="text" id="username" /></label> 
	
	<label>내용<input type="text" id="content" /></label>
	
	<button onclick="ajaxToServer();">입력</button>
</form>

<div id="result"></div>


</body>
</html>