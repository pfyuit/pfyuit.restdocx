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
<title>API List by Category</title>
</head>

<body>
   <div style="background-color: #FFFFFF; padding-left: 3px">
      <table class="table table-hover">
         <thead>
            <tr>
               <th>API Name</th>
               <th>API URL</th>
               <th>API Method</th>
               <th>API Parameter</th>
               <th>API Format</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="item" items="${list}">
               <tr>
                  <td><a href="${contextPath}/detail/${item.name}.html?category=${active}">${item.name}</a></td>
                  <td>${item.url}</td>
                  <td>${item.method}</td>
                  <td>${item.param}</td>
                  <td>${item.format}</td>
               </tr>
            </c:forEach>
         </tbody>

      </table>


   </div>
</body>
</html>