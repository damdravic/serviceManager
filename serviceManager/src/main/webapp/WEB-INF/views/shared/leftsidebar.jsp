<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Sidebar -->
<ul class="sidebar navbar-nav">

	<li id="home" class="nav-item "><a class="nav-link"
		href="${contextRoot}/index">  <span>Meniu Principal</span>
	</a></li>
	<li id="" class="nav-item">
	  <a class="nav-link" href="${contextRoot}/adminArea/addNewCase"><span>Caz nou</span><img style="max-width: 30px;float:right;" align="middle" src="${images}/add.png " /></a>
	</li>


	<!--  
	<c:forEach items="${listOfWorkshop}" var="workshop">
		<li id="${workshop.name}" class="nav-item"><a class="nav-link"
			href="${contextRoot}/${workshop.name}"> <i
				class="fas fa-fw fa-chart-area"></i> <span>${workshop.name}</span></a></li>
	</c:forEach>
-->
	<!--   add buttons for administrators  -->
	<security:authorize
		access="hasAuthority('ADMIN') or hasAuthority('MANAGER')">
		
		

	
			<!--  dropdown menu for cases management -->
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <span>Cases Management</span></a>
			<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				<h6 class="dropdown-header">Cases Management:</h6>
				   <a class="dropdown-item" href="${contextRoot}/adminArea/addNewCase">Add New Case</a> 
				   <a class="dropdown-item" href="${contextRoot}/adminArea/casesManagement">Other Statistics</a>
			</div>
			</li>
			
			
				<!--  dropdown menu for cars management -->
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <span>Cars Management</span></a>
			<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				<h6 class="dropdown-header">Cases Management:</h6>
				   <a class="dropdown-item" href="${contextRoot}/adminArea/cars">Add New Case</a> 
				   <a class="dropdown-item" href="${contextRoot}/table"> ">Other Statistics</a>
			</div>
			</li>

	</security:authorize>

	<security:authorize access=" hasAuthority('MANAGER')">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <span>Management
					Area</span>
		</a>
			<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				<h6 class="dropdown-header">Management:</h6>
				  <a class="dropdown-item" href="${contextRoot}/adminArea/workshopManagement">Workshops</a>
				  <a class="dropdown-item" href="${contextRoot}/adminArea/insurersManagement">Insurers</a>
				 <a class="dropdown-item" href="${contextRoot}/adminArea/usersManagement">Users</a>
				 <a class="dropdown-item" href="${contextRoot}/adminArea/carBrand">Cars brand</a>

			</div></li>

	</security:authorize>

	<li id="manageCars" class="nav-item"><a class="nav-link"
		href="${contextRoot}/perform-logout"> <i
			class="fas fa-fw fa-chart-area"></i> <span>Logout</span></a></li>


</ul>
