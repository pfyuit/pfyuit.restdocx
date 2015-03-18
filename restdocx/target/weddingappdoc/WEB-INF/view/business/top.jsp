<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/include.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Top Sub Menu</title>
</head>
<body>
   <ul class="nav nav-tabs" role="tablist">

      <!-- Dynamically load active class -->
      <c:set var="clazz" value=""></c:set>
      <c:set var="home" value="Home"></c:set>
      <c:if test="${home==active}">
         <c:set var="clazz" value="active"></c:set>
      </c:if>
      <li class="${clazz}"><a href="${contextPath}/index.html">Home</a></li>

      <c:forEach var="item" items="${list}">

         <!-- Dynamically load active class -->
         <c:set var="clazz" value=""></c:set>
         <c:if test="${item.name==active}">
            <c:set var="clazz" value="active"></c:set>
         </c:if>

         <li class="${clazz}"><a href="${contextPath}/category/${item.name}.html">${item.name}</a></li>
      </c:forEach>
   </ul>

</body>
</html>