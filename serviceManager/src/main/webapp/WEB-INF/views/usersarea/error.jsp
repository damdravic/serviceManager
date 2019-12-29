<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<c:set var="css" value="${contextRoot}/resources/css" />
<c:set var="js" value="${contextRoot}/resources/js" />
<c:set var="images" value="${contextRoot}/resources/images" />



<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>${title}</title>

<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}';
</script>

<!-- Custom styles for this template-->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!--  Style for tables  -->
<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${css}/serviceManager.css" rel="stylesheet">

</head>

<body id="page-top">

	

	<div id="wrapper">

		

		<div id="content-wrapper">

			<div class="container-fluid">

				<div class="jumbotron">
					<h1>${errorTitle}</h1>
					<hr />
					<blockquote>${ErrorDescription}</blockquote>

				</div>

			</div>
			<!-- /.container-fluid -->

			<!--  Footer -->
		
		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->





	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>



	<!-- Bootstrap core JavaScript-->
	<script src="${js}/jquery.min.js"></script>
	<script src="${js}/jquery.dataTables.js"></script>
	<script src="${js}/bootstrap.bundle.min.js"></script>
	<script src="${js}/activeMenu.js"></script>
	<script src="${js}/t.js"></script>
	<script src="${js}/dataTables.bootstrap4.js"></script>






</body>

</html>
