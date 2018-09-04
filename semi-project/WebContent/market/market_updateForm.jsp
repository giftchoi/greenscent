<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br>
<br>
<br>
<br>
<br>
<br>
<script type="text/javascript">
	function sendList() {
		location.href = "${pageContext.request.contextPath}/front?command=marketList";
	}
</script>
<!-- <!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head> -->
<body>
	<div class="container">
		<form action="${pageContext.request.contextPath}/front" method="post">
			<input type="hidden" name=command value="marketUpdatePost"> <input
				type="hidden" name=mno value="${mvo.mno}">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text"></span>
				</div>
				제목 <input type="text" class="form-control" name="title"
					value="${mvo.title}">
			</div>
			<div class="form-group">
				본문내용
				<textarea class="form-control" name="content">${mvo.content}</textarea>
			</div>
			<div class="form-group">
				<input type="radio" name="state" value="0"> 판매중 <input
					type="radio" name="state" value="1"> 판매완료
			</div>
			<button type="submit" class="btn btn-success">수정</button>
			<button type="reset" class="btn btn-success" onclick="sendList()">취소</button>



		</form>
	</div>

</body>
</html>