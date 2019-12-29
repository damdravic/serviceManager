<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<c:choose>
<c:when test="${not empty id}">
<c:url var="action" value="/Update" context="${contextRoot}"/>
<c:set var="cardTitle" value="Update selected case" />
</c:when>
<c:otherwise>
<c:url var="action" value="/AddNewCase" context="${contextRoot}"/>
<c:set var="cardTitle" value="Insert new case" />
</c:otherwise>
</c:choose>
<script type="text/javascript">
    var csrfParameter = '${_csrf.parameterName}';
    var csrfToken = '${_csrf.token}';
</script>
<script>
  function modalToggle(){
	var casemodal = document.getElementById("casemodal");

	if(casemodal.style.display === 'none'){
		casemodal.style.display = 'block';
	}
  }

</script>

<div id="insertForm" class="container" style="display:block;">
	<div class="row justify-content-center">
		<div class="col-md-10">
			<div class="card">
				<div class="card-header bg-primary text-white text-right">
					<p><c:out value="${cardTitle}"/></p>
				</div>
				<div class="card-body bg-none">

					<sf:form action="${action}" modelAttribute="serviceCase">
						
						<div class="form-group row">
							<label for="name" class="col-sm-3 col-form-label "> Car License Plate  </label>
							<div class="col-sm-9">
								<sf:input type="text" class="form-control" id="carLicencePlate" path="car"
									placeholder="License Plate" />
							</div>
						</div>
						
                        <div id="ifcarnotexist" class="form-group row " style="display:none" >
                        <button type="button" onclick="modalToggle()" class="btn btn-warning btn-lg  col-md-3 offset-md-2">Creeaza Masina</button>
                        <button type="button" onclick="location.href='${contextRoot}/adminArea/addNewCase';" class="btn btn-warning btn-lg  col-md-3 offset-md-2">Renunta</button>
                        </div>                 
						
						
						<div class="form-group row">
							<label for="name" class="col-sm-3 col-form-label "> Workshop </label>
							<div class="col-sm-9">
								<sf:select class="form-control" path="workshop" placeholder="User Last Name" >
									
									<c:forEach items="${listOfWorkshop}" var="workshop">
									   <sf:option itemLabel="${workshop.name}" value="${workshop.id}">${workshop.name}</sf:option>
									</c:forEach>
									
																		
								</sf:select>	
							</div>
						</div>
						
						<div class="form-group row">
							<label for="name" class="col-sm-3 col-form-label "> Nickname </label>
							<div class="col-sm-9">
								<sf:input type="text" class="form-control" path="caseActive"
									placeholder="User Nickname" />
							</div>
						</div>
						
						<div class="form-group row">
							<label for="name" class="col-sm-3 col-form-label "> Insurer </label>
							<div class="col-sm-9">
								<sf:select class="form-control" path="insurer" placeholder="User Email" >
								<c:forEach items="${listOfInsurers}" var="insurer">
								  <sf:option value = "${insurer.id}">${insurer.name}</sf:option>
								</c:forEach>
								</sf:select>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="name" class="col-sm-3 col-form-label "> caseWorkOrder </label>
							<div class="col-sm-9">
								<sf:input type="text" class="form-control" path="caseWorkOrder"
									placeholder="User Password" />
							</div>
						</div>
						
						<div class="form-group row">
							<label for="name" class="col-sm-3 col-form-label "> caseEntryDate </label>
							<div class="col-sm-9">
								<sf:input type="text" class="form-control" path="caseEntryDate"
									placeholder="User Security Key" />
							</div>
						</div>
						
						

                         <sf:hidden path="caseId" />

					</sf:form>
				</div>
				<div class="card-footer bg-primary text-white text-right"></div>

			</div>

		</div>

	</div>

</div>

<div id="casemodal" class="bg-modal justify-content-center" style="display:none">
	<div class="casemodal-content">
	  <%@ include file="manageCars.jsp" %>
</div>
</div>


<script>

$(document).ready(function(){

	var jsonParams = {};

	 jsonParams[csrfParameter] =csrfToken;
	
	 
	 $("#carLicencePlate").blur(function(){
		 console.log('your message xxx');
	
			var varname = 'carLicencePlate';
			var varvalue = $("#carLicencePlate").val();
			jsonParams[varname] = varvalue;
			console.log(jsonParams);
		 var ajaxURL = window.contextRoot + '/adminArea/check_availability';
		 console.log(ajaxURL);
		 $.ajax({
			 url :ajaxURL,
			 type:"POST",
		     data : jsonParams,
		     success : function(data){
		    	
		    	 if(data =="Car not exist"){
		    		 $("#ifcarnotexist").show();
		    	 }
		    	 
		    	 
		    	 
		    	 
		    	 
		    	 
		    	 
		    	 
		    	 
		    	 $("#demo").html(data);
		     }
		 });
	 });
});
</script>
 