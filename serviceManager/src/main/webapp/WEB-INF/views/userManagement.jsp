<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<c:choose>
<c:when test="${not empty id}">
<c:url var="action" value="/adminArea/usersManagementUpdateUser" context="${contextRoot}"/>
<c:set var="cardTitle" value="Update selected User" />
</c:when>
<c:otherwise>
<c:url var="action" value="/adminArea/usersManagementAddNewUser" context="${contextRoot}"/>
<c:set var="cardTitle" value="Insert new User" />
</c:otherwise>
</c:choose>

<div id="insertForm" class="container" style="display:none;">
	<div class="row justify-content-center">
		<div class="col-md-10">
			<div class="card">
				<div class="card-header bg-primary text-white text-right">
					<p><c:out value="${cardTitle}"/></p>
				</div>
				<div class="card-body bg-none">

					<sf:form action="${action}" modelAttribute="user">
						
						<div class="form-group row">
							<label for="name" class="col-sm-3 col-form-label "> First Name </label>
							<div class="col-sm-9">
								<sf:input type="text" class="form-control" path="firstName"
									placeholder="User First Name" />
							</div>
						</div>
						
						<div class="form-group row">
							<label for="name" class="col-sm-3 col-form-label "> Last Name </label>
							<div class="col-sm-9">
								<sf:input type="text" class="form-control" path="lastName"
									placeholder="User Last Name" />
							</div>
						</div>
						
						<div class="form-group row">
							<label for="name" class="col-sm-3 col-form-label "> Nickname </label>
							<div class="col-sm-9">
								<sf:input type="text" class="form-control" path="nickname"
									placeholder="User Nickname" />
							</div>
						</div>
						
						<div class="form-group row">
							<label for="name" class="col-sm-3 col-form-label "> User Email </label>
							<div class="col-sm-9">
								<sf:input type="text" class="form-control" path="email"
									placeholder="User Email" />
							</div>
						</div>
						
						<div class="form-group row">
							<label for="name" class="col-sm-3 col-form-label "> User Password </label>
							<div class="col-sm-9">
								<sf:input type="text" class="form-control" path="password"
									placeholder="User Password" />
							</div>
						</div>
						
						<div class="form-group row">
							<label for="name" class="col-sm-3 col-form-label "> User Security Key </label>
							<div class="col-sm-9">
								<sf:input type="text" class="form-control" path="securityKey"
									placeholder="User Security Key" />
							</div>
						</div>
						
						<div class="form-group row">
							<label for="name" class="col-sm-3 col-form-label "> User Role </label>
							<div class="col-sm-9">
								<sf:input type="text" class="form-control" path="role"
									placeholder="User Role" />
							</div>
						</div>
						
						<div class="form-group row">
							<label for="name" class="col-sm-3 col-form-label "> User Active </label>
							<div class="col-sm-9">
								<sf:input type="text" class="form-control" path="active"
									placeholder="User Active" />
							</div>
						</div>
						
						<div class="form-group row">
							<label for="model" class="col-sm-8 col-form-label text-dark">Update or create user</label>
							<div class="col-sm-4">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</div>

                         <sf:hidden path="id" />

					</sf:form>
				</div>
				<div class="card-footer bg-primary text-white text-right"></div>

			</div>

		</div>

	</div>

</div>

<div id="table" class="container" style="display:block;" >
	<div class="row justify-content-center">
	   
	   <div class="col-md-12">
	   <div class="card">
	   <div class="card-header bg-primary text-white text-right">
	       <h2> Workshop Management </h2>
	   </div>
	   
	    <div class="card-body bg-none"> 

		<table id="usersTable" style="width:100%;" class="table table-striped  ">
		  <thead>
		    <tr>
		       <th>Id</th>
		       <th>F.Name</th>
		       <th>L.Name</th>
		       <th>Nickname</th>
               <th>Email</th>
		       <th>Role</th>
		       <th>Is active</th>
		       <th>10</th>
		      
		        
             </tr>
		  </thead>
         </table>
     
	
         </div>
         

         <div class="card-body bg-light">
           <button type="button" class="btn btn-block btn-outline-primary" onclick="display()" >ffffff</button>
         </div>
         <div class="card-footer bg-primary">
         <br/>
         </div>
         
         
        
	
	    </div>
	  </div>
	
	</div>

</div>


 <c:if test="${not empty id}">
       <script>
       display();
       </script>
      
       </c:if>