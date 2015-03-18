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
<title>Create or Update an API</title>
</head>
<body>

   <c:if test="${not empty messages}">
      <blockquote>
         <font size="3px" class="text-danger"><span class="glyphicon glyphicon-ban-circle">&nbsp;</span>Form validation error:</font><br />
         <c:forEach var="message" items="${messages}">
            <font size="3px" class="text-danger">${message}</font>
            <br />
         </c:forEach>
      </blockquote>
   </c:if>

   <form method="post" action="${contextPath}/admin/save.html" enctype="application/x-www-form-urlencoded; charset=UTF-8">
      <div style="background-color: aliceblue; height: 30px; font-weight: bold">
         Category Name<font color="red">*</font>
      </div>
      <input type="text" name="cname" class="form-control"></input>
      <p />

      <div style="background-color: aliceblue; height: 30px; font-weight: bold">
         Category URL<font color="red">*</font>
      </div>
      <input type="text" name="curl" class="form-control"></input>
      <p />

      <div style="background-color: aliceblue; height: 30px; font-weight: bold">
         API Name<font color="red">*</font>
      </div>
      <input type="text" name="name" class="form-control"></input>
      <p />

      <div style="background-color: aliceblue; height: 30px; font-weight: bold">
         API URL<font color="red">*</font>
      </div>
      <input type="text" name="url" class="form-control"></input>
      <p />

      <div style="background-color: aliceblue; height: 30px; font-weight: bold">
         API Method<font color="red">*</font>
      </div>

      <select name="method" class="form-control">
         <option value="GET">GET</option>
         <option value="POST">POST</option>
         <option value="DELETE">DELETE</option>
         <option value="PUT">PUT</option>
      </select>
      <p />

      <div style="background-color: aliceblue; height: 30px; font-weight: bold">API Parameter</div>
      <input type="text" name="param" class="form-control"></input>
      <p />

      <div style="background-color: aliceblue; height: 30px; font-weight: bold">
         API Format<font color="red">*</font>
      </div>

      <select name="format" class="form-control">
         <option value="JSON">JSON</option>
         <option value="XML">XML</option>
      </select>
      <p />

      <div style="background-color: aliceblue; height: 30px; font-weight: bold">API Input Sample</div>
      <textarea name="input" class="form-control" rows="3"></textarea>
      <p />

      <div style="background-color: aliceblue; height: 30px; font-weight: bold">API Output Sample</div>
      <textarea name="output" class="form-control" rows="3"></textarea>
      <p />

      <div style="background-color: aliceblue; height: 30px; font-weight: bold">API Note</div>
      <textarea name="note" class="form-control" rows="3"></textarea>
      <p />

      <input type="submit" class="btn btn-success" value="Save API"></input>
   </form>

</body>
</html>