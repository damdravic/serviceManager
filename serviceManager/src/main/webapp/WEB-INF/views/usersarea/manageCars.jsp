<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<c:choose>
 <c:when test="${ not empty requestFromNewCase}">
 <c:url var="action" value="/adminArea/cars?requestFromNewCase=newCase" context = "${contextRoot}"/>
 </c:when>
 <c:otherwise>
 <c:url var="action" value="/adminArea/cars?requestFromNewCase=notNewCase" context="${contextRoot}"/>
 </c:otherwise>


</c:choose>

<div class="container justify-content-center">
	<div class="row justify-content-center">





		<div class="col-md-8 ">
			<div class="card text-white bg-primary mb-3">
				<div class="card-header" style="text-align: center">

					<h4>Cars Management</h4>
					<br>
					<br></div>
				<c:if test="${not empty message }">
					<div class="col-xs-12">

						<div class="alert alert-success alert-dismissible">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							${message}
						</div>
					</div>
				</c:if>



				<div class="card-body bg-light text-black">
				
					
					
					<!-- FORM ELEMENTS -->
					<sf:form modelAttribute="car" action="${action}" methode="POST">
						<div class="form-group row">
							<label for="license_plate"
								class="col-sm-3 col-form-label text-dark">License Plate</label>
							<div class="col-sm-9">
								<sf:input type="text" class="form-control text-uppercase"
									path="licencePlate" id="licencePlate" name="licencePlate"
									placeholder="Enter Licence plate" />
								<sf:errors path="licencePlate"
									cssClass="form-text text-muted help-block" element="em" />
								  <em id="passwordHelpBlock" class="form-text text-muted">
                                                   Enter a Licence plate (if is not create it)</em> 
							</div>
						</div>
                    
                       
						<div class="form-group row">
							<label for="brand" class="col-sm-3 col-form-label text-dark">Brand</label>
							<div class="col-sm-6">
								<sf:select class="form-control" path="brand"  id="selectBrand"  >
								    <sf:option value="" selected="selected"  ><em>Insert brand of car</em></sf:option>
								<c:forEach items="${carBrands}" var="carBrand" >
								   <sf:option value="${carBrand.id}" >${carBrand.name}</sf:option>
								</c:forEach>
								</sf:select>
								<em id="passwordHelpBlock" class="form-text text-muted">
									Enter brand (if is not create it --> )</em>
							</div>
							<div class="col-md-3">
							<button type="button" class="btn btn-primary " >  Create Brand </button>
							</div>
						</div>

						<div class="form-group row">
							<label for="model" class="col-sm-3 col-form-label text-dark">Model</label>
							<div class="col-sm-6">
								<sf:select type="text" class="form-control" id="selectModel" path="model" >
								   <sf:option value="" selected="selected" ><em>Insert brand of model</em></sf:option>
								</sf:select>
								<em id="passwordHelpBlock" class="form-text text-muted">
									Enter model (if is not create it --> )</em>
							</div>
							<div class="col-md-3">
							<button type="button" class="btn btn-primary " >  Create Model </button>
							</div>
						</div>
						
						
						
						
						
							
					

                        <div class="form-group row">
							<label for="model" class="col-sm-3 col-form-label text-dark">Owner</label>
							<div class="col-sm-9">
								<sf:input type="text" class="form-control text-capitalize"
									id="model" path="owner" placeholder="Owner name" />
								<em id="passwordHelpBlock" class="form-text text-muted">
									Please enter owner name</em>
							</div>
							</div>
							
					


						<div class="form-group row">
							
							<div class="col-sm-12">
								<button type="submit" class="btn btn-block btn-primary">Create
									this car</button>
							</div>
						</div>



						<sf:hidden path="carId" />
						<sf:hidden path="active" />

					</sf:form>

				</div>

			</div>



		</div>



	</div>





</div>
<script>
$(document).ready(function(){
	console.log("este");
	});
</script>

<script>
$(document).ready(function(){
 $("#selectBrand").change(function(){
	 var brandId = $(this).val();
	 var ajaxURLformodels = window.contextRoot + '/json/data/all/models/'+brandId;
	 console.log(ajaxURLformodels);
	 $.ajax({
		 type:'GET',
		 url:ajaxURLformodels,
		 success:function(data){
			 var selectModel = $('#selectModel'), option="";
			
			 
			 for(var i=0;i<data.length;i++){
				 option = option + "<option value='" + data[i].id + "'>"+ data[i].name +"</option>";
			 }
			 
			 selectModel.append(option);
			 
		 },
		 error:function(){
			 alert("error");
		 }
	 
	 });
 
 });

});
</script>
