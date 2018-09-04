<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
  <form action="${pageContext.request.contextPath }/front">
  <input type="hidden" name="command" value=registerQna>
	 <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text"></span> 
      </div>
      <input type="text" class="form-control" name="title" placeholder="제목을 입력하세요">
  
    </div>
    <div class="form-group">
      <textarea class="form-control" rows="10" name="content" placeholder="본문내용을 입력하세요"></textarea>
    </div>
    <button type="submit" class="btn btn-success">글쓰기</button>
  </form>
</div>
