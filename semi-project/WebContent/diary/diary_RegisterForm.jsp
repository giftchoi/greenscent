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
	               $("#pics").append("<li>"+result.orgName+"<input type='hidden'name='pics'value="+result.fileName+"><input type='button' class='delImg' value='X'></li>");
	               $("#picture").val("");
	            }
	         });
		});
		 $("#pics").on("click",".delImg",function(){
			 $.ajax({
	             type:"post",
	             url:"${pageContext.request.contextPath}/front",
	             data:"command=deleteDiaryImg&fileName="+$(this).parent().text(),
	             success:function(){
	             }
	          });
	          $(this).parent().remove();
	      }); 
	});
</script>
<div class="container">
  <form action="${pageContext.request.contextPath}/front" method="post">
  <input type="hidden" name=command value="registerDiary">
	 <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">제목</span>
      </div>
      <input type="text" class="form-control" name="title" placeholder="제목을 입력하세요">
    </div>
    <div class="form-group">
      <textarea class="form-control" name="content" placeholder="본문내용을 입력하세요"></textarea>
    </div>
    <div class="form=group">
    <input type="radio" name="secret" value="1" checked="checked"> 다른사람과 공유
    <input type="radio" name="secret" value="0"> 비공개
    </div><br><br>
    *사진 목록 *
    <ul id="pics">
    </ul>
    <br><br>
    <button type="submit" class="btn btn-success">글쓰기</button>
  </form>
  <form id="uploadForm" action="${pageContext.request.contextPath}/front" method="post" enctype="multipart/form-data">
  	<input type="file" name="picture" id="picture">
  </form> 
</div>
