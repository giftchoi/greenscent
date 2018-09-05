<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<div class="container">
  <form action="${pageContext.request.contextPath }/front" method="post">
  <input type="hidden" name="command" value="updateQna"></input>
  <input type="hidden" name="qNo" value="${qvo.qNo}"></input>
	 <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text"></span>
      </div>
      <input type="text" class="form-control" name="title" value="${qvo.title }">
  
    </div>
    <div class="form-group">
      <textarea class="form-control" rows="20" name="content" >${qvo.content}</textarea>
    </div>
    <button type="submit" class="btn btn-success">수정</button>
    <button type="reset" class="btn btn-success">취소</button>
  </form>
</div>
