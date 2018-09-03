<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>      

<form action="${pageContext.request.contextPath }/front" method="post">
<input type="hidden" name="command" value="login">
<input type="text" name="id" placeholder="아이디">
<input type="password" name="password" placeholder="비밀번호">
<input type="submit" value="로그인">
</form>