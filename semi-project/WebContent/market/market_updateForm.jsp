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
	$(document)
			.ready(
					function() {
						var fileTarget = $('.filebox .upload-hidden');
						fileTarget.on('change', function() {
							// 값이 변경되면 
							if (window.FileReader) { // modern browser
								var filename = $(this)[0].files[0].name;
							} else { // old IE 
								var filename = $(this).val().split('/').pop()
										.split('\\').pop(); // 파일명만 추출 
							}
							// 추출한 파일명 삽입 
							$(this).siblings('.upload-name').val(filename);
						});// function

						$("#picture")
								.change(
										function() {
											var form = $('#uploadForm')[0];
											var data = new FormData(form);
											$
													.ajax({
														type : "post",
														url : "${pageContext.request.contextPath}/front",
														data : data,
														dataType : "json",
														enctype : 'multipart/form-data',
														processData : false,
														contentType : false,
														cache : false,
														success : function(
																result) {
															//alert("#pics").val();
															$("#pics")
																	.append(
																			"<li>"
																					+ result.orgName
																					+ "<input type='hidden' name='pics' value="+result.fileName+"></li>");
															$("#picture").val(
																	"");
														}
													});
										});// picture change

						$("#pics").on("click", ".button", function() {
							$(this).parent().remove();
						}); //pics
					});
	function sendList() {
		location.href = "${pageContext.request.contextPath}/front?command=marketList";
	}
</script>

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
			<button type="submit" class="btn btn-success" onclick="sendList()">수정</button>
			<button type="reset" class="btn btn-success" onclick="sendList()">취소</button>

		</form>
		<ul id="pics">
			<c:forEach items="${requestScope.mvo.filelist}" var="mImg">
				<li>${mImg}<input type="button" value="X" class="button">
				</li>
			</c:forEach>
		</ul>
		<form id="uploadForm" action="${pageContext.request.contextPath}/front" method="post" enctype="multipart/form-data">
			<!-- 아래의 방법과 맨 윗줄의 jQuery를 사용해서 파일박스 모양을 변경하고 파일이름이 들어가게 함  -->
			<div class="filebox">
				<input class="upload-name" value="picture" disabled="disabled">
				<label for="picture">업로드</label> 
				<input type="file" name="picture" id="picture">
			</div>
		</form>
	</div>

</body>
</html>