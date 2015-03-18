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
<title><sitemesh:write property='title' /></title>

<!-- Bootstrap core CSS -->
<link href="${contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- //////Special configuration for IE browser compatibility////// -->

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="${contextPath}/static/ieonly/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="${contextPath}/static/ieonly/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="${contextPath}/static/ieonly/html5shiv.min.js"></script>
      <script src="${contextPath}/static/ieonly/respond.min.js"></script>
    <![endif]-->

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="${contextPath}/static/ieonly/ie10-viewport-bug-workaround.js"></script>

<!-- //////End Special configuration for IE browser compatibility////// -->

<!-- Bootstrap core JavaScript -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${contextPath}/static/jquery/jquery.min.js"></script>
<script src="${contextPath}/static/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
   <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
         <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
               <span class="sr-only">Toggle navigation</span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Wedding App API</a>
         </div>
         <div class="collapse navbar-collapse">
            <c:set var="home" value="Home"></c:set>
            <c:set var="admin" value="Admin"></c:set>
            <c:set var="about" value="About"></c:set>

            <ul class="nav navbar-nav">
               <li <c:if test="${home==menu}">class="active"</c:if>><a href="${contextPath}/index.html"><span class="glyphicon glyphicon-home"></span> API Home</a></li>
               <li><a href="http://54.82.209.247/javadoc/" target="_blank">Java Doc</a></li>
               <li <c:if test="${admin==menu}">class="active"</c:if>><a href="${contextPath}/admin.html">Admin Console</a></li>
               <li <c:if test="${about==menu}">class="active"</c:if>><a href="${contextPath}/about.html">About</a></li>
            </ul>

            <form class="navbar-form navbar-right">
               <div class="form-group" style="margin-top:6px">
                  <shiro:user>
                     <li><font color="#777"><span class="glyphicon glyphicon-log-out"></span>&nbsp;Welcome [<shiro:principal />], </font> <a href="${contextPath}/logout.html">Logout</a></li>
                  </shiro:user>
               </div>
            </form>

         </div>

      </div>
   </div>

   <div class="container">

      <div class="row">
         <div class="col-md-12" style="margin-bottom: 2px">
            <jsp:include page="/top.html"></jsp:include>
         </div>
         <p />
      </div>

      <div class="row row-offcanvas row-offcanvas-right">

         <div class="col-xs-6 col-md-3 sidebar-offcanvas" id="sidebar" role="navigation">
            <jsp:include page="/navigator.html"></jsp:include>
         </div>

         <div class="col-xs-12 col-md-9">
            <div class="alert alert-info alert-dismissible" role="alert">
               <button type="button" class="close" data-dismiss="alert">
                  <span aria-hidden="true">&times;</span>
                  <span class="sr-only">Close</span>
               </button>
               <span class="glyphicon glyphicon-leaf"></span>
               <b>Tips</b>: We strongly recommand you to read the completed Java API documentation to deeply understand the API definitions. If you have any questions please
               contact <a href="mailto:yupengfei@lightinthebox.com" class="alert-link">yupengfei@lightinthebox.com</a> for more information.
            </div>

            <div class="panel panel-info">
               <div class="panel-heading">
                  <sitemesh:write property='title' />
               </div>
               <div class="panel-body">
                  <sitemesh:write property='body' />
               </div>
            </div>

         </div>

      </div>

      <hr>

      <footer>
         <p>
            Powered by Restdocx by <a href="mailto:pfyuit@gmail.com">pfyuit@gmail.com</a>. All rights reserved.
         </p>
      </footer>

   </div>

</body>
</html>