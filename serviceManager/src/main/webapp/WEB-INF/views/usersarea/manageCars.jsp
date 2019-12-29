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
									path="licencePlate" id="licencePlate"
									placeholder="Enter Licence plate" />
								<sf:errors path="licencePlate"
									cssClass="form-text text-muted help-block" element="em" />
								<!--  <em id="passwordHelpBlock" class="form-text text-muted">
                                                   Please enter a valid licence plate</em> -->
							</div>
						</div>

						<div class="form-group row">
							<label for="brand" class="col-sm-3 col-form-label text-dark">Brand</label>
							<div class="col-sm-9">
								<sf:input type="text" class="form-control text-capitalize"
									path="brand" id="brand" placeholder="Car Brand" />
								<em id="passwordHelpBlock" class="form-text text-muted">
									Please enter a car brand</em>
							</div>
						</div>

						<div class="form-group row">
							<label for="model" class="col-sm-3 col-form-label text-dark">Model</label>
							<div class="col-sm-9">
								<sf:input type="text" class="form-control text-capitalize"
									id="model" path="model" placeholder="Model" />
								<em id="passwordHelpBlock" class="form-text text-muted">
									Please enter a car model</em>
							</div>
						</div>



						<div class="form-group row">
							<label for="model" class="col-sm-8 col-form-label text-dark">Create
								this car in database</label>
							<div class="col-sm-4">
								<button type="submit" class="btn btn-primary">Create
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
