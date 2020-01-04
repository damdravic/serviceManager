<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>


<div id="insertForm" class="container" style="display:none">
	<div class="row justify-content-center">

		<div class="col-md-10">
			<div class="card">
				<div class="card-header bg-primary text-white">Insert new brand </div>
				<div class="card-body bg-none">
					<sf:form action="" modelAttribute="carBrand">

						<div class="form-group row">
							<label class="col-md-3" for="name">Brand Name</label>
							<sf:input class="col-md-9 form-control" path="name"
								name="brandName" placeholder="New Brand Name" />
						</div>

						<div class="form-group row">
							<label class="col-md-3" for="active">Is Active</label>
							<sf:select class="col-md-9 form-control" path="active">

								<sf:option value="false">False</sf:option>
								<sf:option value="true">True</sf:option>
							</sf:select>

						</div>
						<sf:hidden path="id" />


	                   <div class="form-group row">
							
							<div class="">
								<button type="submit" class="btn btn-block btn-primary">Create</button>
							</div>
						</div>
					</sf:form>

				</div>
				<div class="card-footer bg-primary text-white"></div>

			</div>
		</div>
	</div>
</div>

<div id="table" class="container" style="display:block">
 <div class="row justify-content-center">
 <div class="col-md-10">
   <div class="card">
   <div class="card-header bg-primary text-white text-right">
   <p>List of brands</p>
   </div>
   <div class="card-body bg-none">
     <table id="carBrandTable" class="table table-striped" style="width:100%">
       <thead>
       <tr>
       <th>Id</th>
       <th>Name</th>
       <th>Active</th>
       <th></th>
     
       </tr>
      </thead>
     
     </table>
     
     <div>
           <button type="button" class="btn btn-block btn-outline-primary" onclick="display()">Add new Brand</button>
     
         </div>
   </div>
   <div class="card-footer bg-primary text-white text-right">
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