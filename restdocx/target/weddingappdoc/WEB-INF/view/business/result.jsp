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
<title>Detailed API Doc</title>
</head>

<body>
   <div style="background-color: #FFFFFF; padding-left: 3px">

      <c:if test="${not empty messages}">
         <blockquote>
            <font size="3px" class="text-success"><span class="glyphicon glyphicon-ok">&nbsp;</span></font>
            <c:forEach var="message" items="${messages}">
               <font size="3px" class="text-success">${message}</font>
               <br />
            </c:forEach>
         </blockquote>
      </c:if>

      <c:if test="${empty messages}">
         <blockquote>
            <font size="3px" class="text-warning">Read and copy information from this page, you can try the service invocation in the tooling below, or in your own
               applications. You can also update the API doc.</font>
         </blockquote>
      </c:if>

      <form method="post" action="${contextPath}/detail/save.html">

         <div class="form-group  has-feedback">
            <div style="background-color: aliceblue; height: 30px; font-weight: bold">Category Name</div>
            <span class="glyphicon glyphicon-heart form-control-feedback"></span>
            <input type="text" class="form-control bg-info" name="cname" value="${result.cname}" readonly></input>
         </div>

         <div class="form-group  has-feedback">
            <div style="background-color: aliceblue; height: 30px; font-weight: bold">Category URL</div>
            <span class="glyphicon glyphicon-globe form-control-feedback"></span>
            <input type="text" class="form-control bg-info" name="curl" value="${result.curl}"></input>
         </div>

         <div class="form-group  has-feedback">
            <div style="background-color: aliceblue; height: 30px; font-weight: bold">API Name</div>
            <span class="glyphicon glyphicon-heart form-control-feedback"></span>
            <input type="text" class="form-control bg-info" name="name" value="${result.name}" readonly></input>
         </div>

         <div class="form-group  has-feedback">
            <div style="background-color: aliceblue; height: 30px; font-weight: bold">API URL</div>
            <span class="glyphicon glyphicon-globe form-control-feedback"></span>
            <input type="text" class="form-control bg-info" name="url" value="${result.url}"></input>
         </div>

         <div class="form-group  has-feedback">
            <div style="background-color: aliceblue; height: 30px; font-weight: bold">API Method</div>
            <input type="text" class="form-control bg-info" name="method" value="${result.method}"></input>
            <span class="glyphicon glyphicon-bell form-control-feedback"></span>
         </div>

         <div class="form-group  has-feedback">
            <div style="background-color: aliceblue; height: 30px; font-weight: bold">API Parameter</div>
            <input type="text" class="form-control bg-info" name="param" value="${result.param}"></input>
            <span class="glyphicon glyphicon-wrench form-control-feedback"></span>
         </div>

         <div class="form-group  has-feedback">
            <div style="background-color: aliceblue; height: 30px; font-weight: bold">API Format</div>
            <input type="text" class="form-control bg-info" name="format" value="${result.format}"></input>
            <span class="glyphicon glyphicon-tint form-control-feedback"></span>
         </div>

         <div style="background-color: aliceblue; height: 30px; font-weight: bold">API Input Sample</div>
         <textarea name="input" class="form-control bg-info" rows="3">${result.input}</textarea>
         <p />

         <div style="background-color: aliceblue; height: 30px; font-weight: bold">API Output Sample</div>
         <textarea name="output" class="form-control bg-info" rows="3">${result.output}</textarea>

         <div style="background-color: aliceblue; height: 30px; font-weight: bold">API Notes</div>
         <textarea name="note" class="form-control bg-info" rows="5">${result.note}</textarea>

         <br />
         <button type="submit" class="btn btn-success">Update API Doc</button>
      </form>
      <br />

      <div style="background-color: aliceblue; height: 30px; font-weight: bold">Try it Yourself</div>
      <form method="post" action="/weddingappdoc/invoke.html">

         <div class="input-group">
            <span class="input-group-addon">URL:</span>
            <input type="text" class="form-control" placeholder="Input the URL">
         </div>

         <div class="input-group">
            <span class="input-group-addon">URL Param:</span>
            <input type="text" class="form-control" placeholder="Input the URL Parameters">
         </div>

         <c:if test="${result.method=='POST'}">
            <div class="input-group">
               <span class="input-group-addon">POST Data:</span>
               <input type="text" class="form-control" placeholder="POST Data">
            </div>
         </c:if>
         <br />
         <button type="button" class="btn btn-success">Invoke REST</button>
      </form>
      <br />
   </div>
</body>
</html>