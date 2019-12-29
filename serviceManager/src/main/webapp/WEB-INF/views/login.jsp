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
<link href="${css}/login.css" rel="stylesheet">

</head>

<body id="page-top">

	<div class="modal-dialog text-center">
		<div class="col-sm-10 main-section">
			<div class="modal-content">
				<div class="col-12 user-img">
					<img src="${images}/logo.png">
				</div>
				<form action="${contextRoot}/login" class="col-12 form-group" method="POST">
					<input type="text" id="login" class="form-control" name="username"
						placeholder="login"> <input type="password" id="password"
						class="form-control" name="password" placeholder="password">
					<button>Login</button>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />


				</form>
				<div class="col-12 forgot">
				  Forgot password !
				</div>

			</div>
			<!-- End of Modal Content -->
		</div>
	</div>






	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>



	<!-- Bootstrap core JavaScript-->
	<script src="${js}/jquery.min.js"></script>

	<script src="${js}/bootstrap.bundle.min.js"></script>
	<script src="${js}/activeMenu.js"></script>
	<script src="${js}/t.js"></script>
	<script src="${js}/dataTables.bootstrap4.js"></script>


<script type="text/javascript">
    var csrfParameter = '${_csrf.parameterName}';
    var csrfToken = '${_csrf.token}';
</script>



</body>

</html>