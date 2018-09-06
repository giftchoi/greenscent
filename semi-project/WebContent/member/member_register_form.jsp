<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//code.jquery.com/jquery.min.js"></script>      
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member.css">

<script type="text/javascript">


function checkForm() {
	var pv=document.registerForm.password.value;
	var rv=document.registerForm.repeat_password.value;
	var idValue = document.getElementById("id").value;
	//alert(pv+" "+rv);
	if(pv!=rv){
		alert("비밀번호와 확인란이 일치하지 않습니다");
		document.getElementById("password").value="";
		document.getElementById("repeat_password").value="";
		document.getElementById("password").focus();
		return false;// false 를 반환하면 전송되지 않는다
	}
	
	if(idValue.length<4 || idValue.length>10) {
		alert("아이디 조건이 충족되지 않았습니다.");
		document.getElementById("id").focus();
		return false;// false 를 반환하면 전송되지 않는다
	}
	var name = document.registerForm.name.value;
	alert(name+"님 가입을 환영합니다!\n가입한 아이디와 비밀번호로 로그인해보세요");

}


	$(document).ready(function() {
	 	$("#id").keyup(function() {
			//alert("keyup");
			
			var idValue = $(this).val();
			//$("#checkResult").html("아이디 중복확인"+a).css("color", "pink");
			if(idValue.length<4 || idValue.length>10) {
				//alert(idValue.length);
				$("#checkId").html("아이디는 4자이상 10자이하만 가능!").css("color", "lightseagreen");
			}else {
				$.ajax({
					type:"get",
					url:"${pageContext.request.contextPath}/front",							
					data:"command=findMemberById&id="+$("#id").val(),
					success:function(result){
						$("#checkId").html(result);					
					}
				});//ajax
			}
		}); 
		$("#repeat_password").keyup(function() {
			var pv = $("#password").val();
			var rv = $("#repeat_password").val();
			if(pv!=rv){
				$("#checkPassword").html("패스워드 불일치!").css("color", "red");
			}else {
				$("#checkPassword").html("패스워드 일치!").css("color", "lightseagreen");
			}
		});
		$("#password").keyup(function() {
			var pv = $("#password").val();
			var rv = $("#repeat_password").val();
			if(pv!=rv){
				$("#checkPassword").html("패스워드 불일치!").css("color", "red");
			}else {
				$("#checkPassword").html("패스워드 일치!").css("color", "lightseagreen");
			}
		});
		
	}); 
	
</script>

<section class="main-container">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="form-block">
					<h2>회원가입</h2>
					<div align="right">
						<a href="${pageContext.request.contextPath}/index.jsp" style="color:#88c724">홈으로</a>
					</div>
					<div class="form">
						<form action="${pageContext.request.contextPath }/front" method="post"
						 name="registerForm" onsubmit="return checkForm()">
							<input type="hidden" name="command" value="registerMember">
							<div class="form-group">
								아이디:
								<span id="checkId"></span> 
								<input type="text" class="form-control"
									placeholder="한글,영문 가능 4자이상 10자이하" name="id" id="id" required>
							</div>
							<div class="form-group">
								이름: <input type="text" class="form-control"
									placeholder="당신은 누구신가요?" name="name" required>
							</div>
							<div class="form-group">
								비밀번호: <input type="password" class="form-control"
									placeholder="보안에 주의하세요" name="password" id="password" required>
							</div>
							<div class="form-group">
								비밀번호 확인:
								<span id="checkPassword"></span> <input type="password" class="form-control"
									placeholder="한번 더 입력하세요" name="repeat-password" id="repeat_password"
									required>
							</div>
							<div class="form-group">
								이메일: <input type="email" class="form-control"
									placeholder="greenscant@green.com" name="email" required>
							</div>
							<div class="form-group">
								생일 :<input type="date" class="form-control" id="birthday"
									 name="birthday" required>
							</div>

							<input type="submit" class="btn btn-default custom-btn" value="환영합니다">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


