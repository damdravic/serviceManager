<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="true" %>



<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<c:set var="css" value="${contextRoot}/resources/css" />
<c:set var="js" value="${contextRoot}/resources/js" />
<c:set var="images" value="${contextRoot}/resources/images" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
  <link href="${css}/dataTables.bootstrap.css" rel="stylesheet" > 
  
  <!--  Font Awesome  -->
  <link href="${css}/font-awesome/css/font-awesome.css" rel="stylesheet" > 
  
  <link href="${css}/manageTables.css" rel="stylesheet" >

<!-- Custom styles for this template-->
<link href="${css}/serviceManager.css" rel="stylesheet">
<link href="${css}/serviceManagerStyle.css" rel="stylesheet">
<link href="${css}/case.css" rel="stylesheet">
<script src="${js}/jquery.min.js"></script>
<script src="${js}/styleneed.js"></script>

</head>

<body id="page-top">

	<%@include file="shared/header.jsp"%>
	
	
	<div id="wrapper">

		<%@include file="shared/leftsidebar.jsp"%>

		<div id="content-wrapper">
	    	

			<div class="container-fluid">
				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
					<li class="breadcrumb-item active">Overview</li>
					
				</ol>
				

				<!-- Home page-->
				<c:if test="${clientRequestHomePage == true}" >
				<%@include file="usersarea/dashboard.jsp"%>
				</c:if>
			
				
				<c:if test="${clientRequestCasesManagementPage == true }">
				<%@ include file="usersarea/casesManagement.jsp" %>
				</c:if>
				<c:if test="${clientRequestAddNewCasePage == true }">
				<%@ include file="usersarea/addNewCase.jsp" %>
				</c:if>
				
				<!-- Table page -->
				<c:if test="${userClickManageCars == true }">
				<%@ include file="usersarea/manageCars.jsp" %>
				</c:if>
				
				<c:if test="${workshopManagement == true }">
				<%@ include file="workshopManagement.jsp" %>
				</c:if>
				
				
				<c:if test="${insurersManagement == true }">
				<%@ include file="insurerManagement.jsp" %>
				</c:if>
				
				<c:if test="${requestUserManagement == true }">
				 <%@ include file="userManagement.jsp" %>
				</c:if>
				
				<c:if test="${carbrandrequest == true }">
				<%@ include file="usersarea/carBrandManagement.jsp" %>
				</c:if>
                   
                   <c:if test="${carmodelrequest == true }">
				<%@ include file="usersarea/carModelManagement.jsp" %>
				</c:if>


			</div>
			<!-- /.container-fluid -->

			<!--  Footer -->
<%@ include file="shared/footer.jsp" %>

		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->
	
	<div id="casemodal" class="bg-modal" style="display:none">
	<div class="casemodal-content">
	  
</div>
</div>
	
	


	<!-- Bootstrap core JavaScript-->
	
	<script src="${js}/jquery.dataTables.js"></script>
	<script src="${js}/bootstrap.bundle.min.js"></script>
	<script src="${js}/activeMenu.js"></script>
    <script src="${js}/jstables.js"></script>
    <script src="${js}/dataTables.bootstrap4.js"></script>

   
   
   


</body>

</html>
