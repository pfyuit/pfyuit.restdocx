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
</head>
<body>

   <c:forEach var="entry" varStatus="status" items="${map}">
      <c:set var="home" value="Home"></c:set>
      <c:if test="${home==active}">
         <div class="list-group">
            <a href="${contextPath}/category/${entry.key.name}.html" class="list-group-item list-group-item-info">${entry.key.name}</a>
            <c:forEach var="item" varStatus="status" items="${entry.value}">
               <a href="${contextPath}/detail/${item.name}.html?category=${entry.key.name}" class="list-group-item">${item.name}</a>
            </c:forEach>
         </div>
      </c:if>

      <c:if test="${entry.key.name==active}">
         <div class="list-group">
            <a href="${contextPath}/category/${entry.key.name}.html" class="list-group-item list-group-item-info">${entry.key.name}</a>
            <c:forEach var="item" varStatus="status" items="${entry.value}">
               <a href="${contextPath}/detail/${item.name}.html?category=${entry.key.name}" class="list-group-item">${item.name}</a>
            </c:forEach>
         </div>
      </c:if>


   </c:forEach>

</body>
</html>