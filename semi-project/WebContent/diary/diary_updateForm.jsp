<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#picture").change(function(){
			   var form = $('#uploadForm')[0];
		         var data = new FormData(form);
			$.ajax({
	            type:"post",
	            url:"${pageContext.request.contextPath}/front",
	            data: data,
	            dataType:"json",
	            enctype: 'multipart/form-data',
	            processData: false,
	              contentType: false,
	              cache: false,
	            success:function(result){
	               $("#pics").append("<li>"+result.orgName+"<input type='hidden'name='pics'value="+result.fileName+"></li>");
	               $("#picture").val("");
	            }
	         });
		});
	      $("#pics").on("click",".delImg",function(){
	          $(this).parent().remove();
	      });
	});
</script>
<div class="container">
  <form action="${pageContext.request.contextPath}/front">
  <input type="hidden" name="command" value="updateDiary">
  <input type="hidden" name="dno" value="${dvo.dno}">
	 <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">제목</span>
      </div>
      <input type="text" class="form-control" name="title" value="${dvo.title}">
    </div>
    <div class="form-group">
      <textarea class="form-control" name="content">${dvo.content}</textarea>
    </div>
    <div class="form=group">
    <c:choose><c:when test="${dvo.secretYN==1}">
    	<input type="radio" name="secret" value="1" checked="checked"> 다른사람과 공유
    	<input type="radio" name="secret" value="0"> 비공개
    </c:when>
    <c:otherwise>
    	<input type="radio" name="secret" value="1" > 다른사람과 공유
    	<input type="radio" name="secret" value="0" checked="checked"> 비공개
    </c:otherwise>
    </c:choose> 
    </div>
    *사진 목록 *
    <ul id="pics">
    <c:forEach items="${dvo.filelist}" var="img">
    	<li>${img}<input type="button" class="delImg" value="X">
    	<input type="hidden" name="pics" value="${img}"></li>
    </c:forEach>
    </ul>
    <button type="submit" class="btn btn-success">글쓰기</button>
  </form>
   <form id="uploadForm" action="${pageContext.request.contextPath}/front" method="post" enctype="multipart/form-data">
  	<input type="file" name="picture" id="picture">
  </form> 
</div>