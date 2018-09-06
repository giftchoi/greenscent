<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- image-slider 선언부 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/img-slider-pro/dist/css/slider-pro.min.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/img-slider-pro/libs/fancybox/jquery.fancybox.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/img-slider-pro/example/css/examples.css"
	media="screen" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600'
	rel='stylesheet' type='text/css'>
<script src="https://code.jquery.com/jquery-2.1.1.js"></script>
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/img-slider-pro/libs/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/img-slider-pro/dist/js/jquery.sliderPro.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/img-slider-pro/libs/fancybox/jquery.fancybox.pack.js"></script>
<script type="text/javascript">
	$(document).ready(function($) {

		$('#pictureslide').sliderPro({
			width : '50%',
			height : 500,
			aspectRatio : 1.5,
			visibleSize : '100%',
			forceSize : 'fullWidth'
		});

		// instantiate fancybox when a link is clicked
		$('#example2 .sp-image').parent('a').on('click', function(event) {
			event.preventDefault();

			// check if the clicked link is also used in swiping the slider
			// by checking if the link has the 'sp-swiping' class attached.
			// if the slider is not being swiped, open the lightbox programmatically,
			// at the correct index
			if ($('#pictureslide').hasClass('sp-swiping') === false) {
				$.fancybox.open($('#pictureslide .sp-image').parent('a'), {
					index : $(this).parents('.sp-slide').index()
				});
			}
		});
	});

	function sendList() {
		location.href = "${pageContext.request.contextPath}/market/market_list.jsp";
	}
	function deleteMarket() {
		if (confirm("게시글을 삭제하시겠습니까?")) {
			document.deleteForm.submit();
		}
	}
	function updateMarket() {
		if (confirm("게시글을 수정하시겠습니까?")) {
			document.updateForm.submit();
		}
	}
</script>

<br>
<br>
<br>
<br>
<br>
<br>



<table class="table">
	<tr>
		<td>글 번호 : ${requestScope.mvo.mno}</td>
		<td>글 제목 : ${requestScope.mvo.title}</td>
		<td>작성자 : ${requestScope.mvo.memberVO.name}</td>
		<td>현재상황 : <c:choose>
				<c:when test="${requestScope.mvo.state==0}">
					<span class="label label-success">판매가능</span>
				</c:when>
				<c:otherwise>
					<span class="label label-important">판매완료</span>
				</c:otherwise>
			</c:choose>
		</td>
		<td>등록일시 : ${requestScope.mvo.regDate}</td>
	</tr>
	<tr>
		<td colspan="5">
			<div id="pictureslide" class="slider-pro">
				<div class="sp-slides">
					<c:forEach var="mImg" items="${requestScope.mvo.filelist}">

						<div class="sp-slide">
							<img class="sp-image"
								src="${pageContext.request.contextPath}/uploadImg/${mImg}"
								data-src="${pageContext.request.contextPath}/uploadImg/${mImg}"
								data-retina="http://bqworks.com/slider-pro/images/image1_large.jpg"/>
						</div>

					</c:forEach>
				</div>
			</div> <pre>${requestScope.mvo.content}</pre>
		</td>
	</tr>
</table>
<br>
<br>
<%--수정 삭제 --%>

<form name="updateForm"
	action="${pageContext.request.contextPath}/front" method="post">
	<input type="hidden" name="command" value="marketUpdatePostForm">
	<input type="hidden" name="mno" value="${requestScope.mvo.mno}">
	<button type="button" class="btn" onclick="updateMarket()">수정</button>
</form>
<br>
<br>
<form name="deleteForm"
	action="${pageContext.request.contextPath}/front" method="post">
	<input type="hidden" name="command" value="marketDeletePost"> <input
		type="hidden" name="mno" value="${requestScope.mvo.mno}">
	<button type="button" class="btn" onclick="deleteMarket()">삭제</button>
</form>

<!----------------------------------------- 댓글 form -------------------------------------------------->
  <form action="${pageContext.request.contextPath }/front" method="post">
	<input type="hidden" name="command" value="writeReplyInMarket">
	<input type="hidden" name="mno" value="${requestScope.mvo.mno}">
	<input type="hidden" name="id" value="${sessionScope.mvo.id}">

	<div class="form-group">
      <label for="comment">댓글달기:</label>
      <textarea class="form-control" rows="1" id="replycontent" name="replycontent"></textarea>
    </div>
    <button type="submit" class="btn btn-success">등록</button>
  </form>
  
  <c:if test="${fn:length(requestScope.rvoList)!=0}">
  <br><br><br>
  <p align="left"> ${fn:length(requestScope.rvoList)}개의 댓글</p>
  <br>
  <c:forEach items="${requestScope.rvoList}" var="comment">
  <p align="left">${comment.id }</p>
  	<c:if test="${comment.id == sessionScope.mvo.id}">
  		<form action="${pageContext.request.contextPath }/front" method="post" id="deletecommentform">
		<input type="hidden" name="command" value="deleteReplyInMarket">
		<input type="hidden" name="rno" value="${comment.rNo}">
		<input type="hidden" name="mno" value="${requestScope.mvo.mno}">
		<input style="float: right;" class="btn btn-danger" type="button" value="삭제" onclick="deleteComment()">
		</form>
  	</c:if>
  	
  <div class="card">
    <div class="card-body" align="left"><pre>${comment.content }</pre></div>
  </div>
  </c:forEach>
  </c:if>
	<br>
	
	<script type="text/javascript">
function deleteComment() {
	if(confirm("댓글을 삭제하시겠습니까?"))
		$("#deletecommentform").submit();
}
</script>
<!------------- 댓글 form --------------------------------->

<br>
<br>
<a href="${pageContext.request.contextPath}/front?command=marketList">리스트로
	돌아가기</a>



