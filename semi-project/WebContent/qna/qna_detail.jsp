<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
   $( document ).ready(function( $ ) {
      
      $('#pictureslide').sliderPro({
         width: '50%',
         height: 500,
         aspectRatio: 1.5,
         visibleSize: '100%',
         forceSize: 'fullWidth'
      });

      // instantiate fancybox when a link is clicked
      $('#example2 .sp-image').parent('a').on('click', function(event) {
         event.preventDefault();

         // check if the clicked link is also used in swiping the slider
         // by checking if the link has the 'sp-swiping' class attached.
         // if the slider is not being swiped, open the lightbox programmatically,
         // at the correct index
         if ($('#pictureslide').hasClass('sp-swiping') === false ) {
            $.fancybox.open($('#pictureslide .sp-image').parent('a'), {index:$(this).parents('.sp-slide').index()});
         }
      });
   });
	function qnaDelete(){
		if(confirm("게시글을 삭제 하시겠습니까?"))
			location.href="front?command=deleteQna&qNo=${qvo.qNo}";
	}
	function qnaUpdate(){
		if(confirm("게시글을 수정 하시겠습니까?"))
			location.href="${pageContext.request.contextPath}/front?command=updateQnaForm&qNo=${requestScope.qvo.qNo}";
	}
</script>

<table class="table">
	<tr>
		<td>글 번호 : ${requestScope.qvo.qNo}</td>
		<td>글 제목 : ${requestScope.qvo.title}</td>
		<td>작성자 : ${requestScope.qvo.mvo.name}</td>
		<td>등록일시 : ${requestScope.qvo.regDate}</td>
	</tr>
	<tr>
	<td colspan="5">
		<div id="pictureslide" class="slider-pro">
   			<div class="sp-slides">
   				<c:forEach var="qImg" items="${requestScope.qvo.fileList}">
	   				<div class="sp-slide">
	   					<img class="sp-image" 
	   						src="${pageContext.request.contextPath}/uploadImg/${qImg}"
	            			data-src="${pageContext.request.contextPath}/uploadImg/${qImg}"
	          				data-retina="http://bqworks.com/slider-pro/images/image1_large.jpg" />
	   				</div>		
   				</c:forEach>
      		</div>
   		</div>
   		
   		<pre>${requestScope.qvo.content}</pre>
	
	</td>
	<tr>
	</table>

			<c:if test="${requestScope.qvo.mvo.id==sessionScope.mvo.id}">
				<form action="${pageContext.request.contextPath}/front" name="qnaDeleteForm" method="post">
				<input type="hidden" name="command" value="deleteQna">	
				<input type="hidden" name="qNo" value="${requestScope.qvo.qNo}">
				</form>
				<button type="button" onclick="qnaDelete()">삭제</button>
				<button type="button" onclick="qnaUpdate()">수정</button>
			</c:if>
	


<!----------------------------------------- 댓글 form -------------------------------------------------->
  <form action="${pageContext.request.contextPath }/front" method="post">
	<input type="hidden" name="command" value="writeReplyInQna">
	<input type="hidden" name="qno" value="${qvo.qNo}">
	<input type="hidden" name="id" value="${sessionScope.mvo.id}">

	<div class="form-group">
      <label for="comment">댓글달기:</label>
      <textarea class="form-control" rows="1" id="replycontent" name="replycontent"></textarea>
    </div>
	<button class="btn btn-success" onclick="return checkComment()">등록</button>

  </form>
  
  <c:if test="${fn:length(requestScope.rvoList)!=0}">
  <br><br><br>
  <p align="left"> ${fn:length(requestScope.rvoList)}개의 댓글</p>
  <br>
  <c:forEach items="${requestScope.rvoList}" var="comment">
  <p align="left">${comment.id }</p>
  	<c:if test="${comment.id == sessionScope.mvo.id}">
  		<form action="${pageContext.request.contextPath }/front" method="post" id="deletecommentform">
		<input type="hidden" name="command" value="deleteReplyInQna">
		<input type="hidden" name="rno" value="${comment.rNo}">
		<input type="hidden" name="qno" value="${qvo.qNo}">
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
	function checkComment() {
		var comment = document.getElementById("replycontent").value;
		//alert(comment);
		if (comment == "") {
			alert("댓글란이 비어있습니다.");
			return false;
		}
	}

	function deleteComment() {
		if (confirm("댓글을 삭제하시겠습니까?"))
			$("#deletecommentform").submit();
	}
</script>
<!------------- 댓글 form --------------------------------->


