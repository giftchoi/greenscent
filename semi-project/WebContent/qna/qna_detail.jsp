<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- image-slider 선언부 -->
      <link rel="stylesheet" type="text/css"
         href="${pageContext.request.contextPath}/assets/img-slider-pro/dist/css/slider-pro.min.css" media="screen" />
      <%--<link rel="stylesheet" type="text/css"
         href="${pageContext.request.contextPath}/assets/img-slider-pro/libs/fancybox/jquery.fancybox.css" media="screen" />
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/img-slider-pro/example/css/examples.css"
         media="screen" /> --%>
      <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600'
         rel='stylesheet' type='text/css'>

      <script type="text/javascript" src="${pageContext.request.contextPath}/assets/img-slider-pro/libs/jquery-1.11.0.min.js"></script>
      <script type="text/javascript"
         src="${pageContext.request.contextPath}/assets/img-slider-pro/dist/js/jquery.sliderPro.min.js"></script>
      <%-- <script type="text/javascript"
         src="${pageContext.request.contextPath}/assets/img-slider-pro/libs/fancybox/jquery.fancybox.pack.js"></script>   --%>
<script type="text/javascript">
   $( document ).ready(function( $ ) {
      
      $( '#pictureslide' ).sliderPro({
         width: '50%',
         height: 500,
         aspectRatio: 1.5,
         visibleSize: '100%',
         forceSize: 'fullWidth'
      });

      // instantiate fancybox when a link is clicked
      $( '#example2 .sp-image' ).parent( 'a' ).on( 'click', function( event ) {
         event.preventDefault();

         // check if the clicked link is also used in swiping the slider
         // by checking if the link has the 'sp-swiping' class attached.
         // if the slider is not being swiped, open the lightbox programmatically,
         // at the correct index
         if ( $( '#pictureslide' ).hasClass( 'sp-swiping' ) === false ) {
            $.fancybox.open( $( '#pictureslide .sp-image' ).parent( 'a' ), { index: $( this ).parents( '.sp-slide' ).index() } );
         }
      });
   });



	function qnaDelete(){
		if(confirm("게시글을 삭제 하시겠습니까?"))
			document.qnaDeleteForm.submit();
	}
	function qnaUpdate(){
		if(confirm("게시글을 수정 하시겠습니까?"))
			location.href="${pageContext.request.contextPath}/front?command=updateQnaForm&qNo=${requestScope.qvo.qNo}";
	}
</script>


<div id="pictureslide" class="slider-pro">
   <div class="sp-slides">
      <div class="sp-slide">
         <a href="http://bqworks.com/slider-pro/images/image1_large.jpg">
            <img class="sp-image" src="${pageContext.request.contextPath}/assets/img-slider-pro/src/css/images/blank.gif"
            data-src="http://bqworks.com/slider-pro/images/image1_medium.jpg"
            data-retina="http://bqworks.com/slider-pro/images/image1_large.jpg" />
         </a>
         <p class="sp-caption">1번 사진</p>
      </div>

      <div class="sp-slide">
         <a href="http://bqworks.com/slider-pro/images/image2_large.jpg">
            <img class="sp-image" src="${pageContext.request.contextPath}/assets/img-slider-pro/src/css/images/blank.gif"
            data-src="http://bqworks.com/slider-pro/images/image2_medium.jpg"
            data-retina="http://bqworks.com/slider-pro/images/image2_large.jpg" />
         </a>
         <p class="sp-caption">2번 사진</p>
      </div>

      <div class="sp-slide">
         <a href="http://bqworks.com/slider-pro/images/image3_large.jpg">
            <img class="sp-image" src="${pageContext.request.contextPath}/assets/img-slider-pro/src/css/images/blank.gif"
            data-src="http://bqworks.com/slider-pro/images/image3_medium.jpg"
            data-retina="http://bqworks.com/slider-pro/images/image3_large.jpg" />
         </a>
         <p class="sp-caption">Ut enim ad minim veniam, quis nostrud
            exercitation ullamco laboris nisi ut aliquip ex ea commodo.</p>
      </div>

      <div class="sp-slide">
         <a href="http://bqworks.com/slider-pro/images/image4_large.jpg">
            <img class="sp-image" src="${pageContext.request.contextPath}/assets/img-slider-pro/src/css/images/blank.gif"
            data-src="http://bqworks.com/slider-pro/images/image4_medium.jpg"
            data-retina="http://bqworks.com/slider-pro/images/image4_large.jpg" />
         </a>
         <p class="sp-caption">Duis aute irure dolor in reprehenderit in
            voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
      </div>

   </div>
</div>
<table>
	<tr>
		<td>글 번호 : ${requestScope.qvo.qNo}</td>
		<td>글 제목 : ${requestScope.qvo.title}</td>
		<td>작성자 : ${requestScope.qvo.mvo.name}</td>
		<td>등록일시 : ${requestScope.qvo.regDate}</td>
	</tr>
	<tr>
	<td>
		<pre>${requestScope.qvo.content}</pre>
	</td>
	</tr>
	<tr>
		<td>
			<c:if test="${requestScope.qvo.mvo.id==sessionScope.mvo.id}">
				<form action="${pageContext.request.contextPath}/front" name="qnaDeleteForm" method="post">
				<input type="hidden" name="command" value="deleteQna">	
				<input type="hidden" name="qNo" value="${requestScope.qvo.qNo}">
				</form>
				<button type="button" onclick="qnaDelete()">삭제</button>
				<button type="button" onclick="qnaUpdate()">수정</button>
			</c:if>
		</td>
	</tr>
</table>


