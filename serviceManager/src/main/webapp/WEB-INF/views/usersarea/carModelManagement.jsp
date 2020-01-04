<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>


<div id="insertForm" class="container" style="display:none">
	<div class="row justify-content-center">

		<div class="col-md-10">
			<div class="card">
				<div class="card-header bg-primary text-white text-right">Create new model for 
				 <span style="font-weight: 900;font-size:25px; text-transform: uppercase; color:#cccc00"><c:out value="${brandName}"/></span></div>
				<div class="card-body bg-none">
					<sf:form action="${contextRoot}/adminArea/carModelUpdate" modelAttribute="carModel" method="POST">

						<div class="form-group row">
							<label class="col-md-3" for="name">Model Name</label>
							<sf:input class="col-md-9 form-control"  path="name"
								name="brandName" placeholder="New Brand Name" />
						</div>
						<input type="hidden" name="brandId" value="${param.brandId}" />
						
						

						<div class="form-group row">
							<label class="col-md-3" for="active">Is Active</label>
							<sf:select class="col-md-9 form-control" path="active">

								<sf:option value="true" selected="selected">True</sf:option>
								<sf:option value="false">False</sf:option>
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
    <p>List of models for    <span style="font-weight: 900;font-size:25px; text-transform: uppercase;color:#cccc00"><c:out value="${brandName}"/></span></p>
   </div>
   <div class="card-body bg-none">
     <table id="carModelTable" class="table table-striped" style="width:100%">
       <thead>
       <tr>
       <th>Id</th>
       <th>Name</th>
       <th>Active</th>
       <th></th>
     
       </tr>
      </thead>
     <c:forEach var="carModel" items="${carModels}">
       
       <tr>
       <td>${carModel.id}</td>
       <td>${carModel.name}</td>
       <td>${carModel.active}</td>
       <td><a href="${contextRoot}/json/data/${carModel.id}/carmodel/delete " style="width : 40%" onclick="return getConfirmation()" class="btn btn-outline-primary" title="Delete"><i class="fa fa-times" style="color:red; font-size: 20px; " aria-hidden="true"></i></a>
       <a href="${contextRoot}/adminArea/carModel?id=${carModel.id}&brandId=${param.brandId}" style="width : 40%" class="btn mybtn btn-outline-primary"><i class="fa fa-sliders" style="color:blue; font-size: 20px;" aria-hidden="true"></i></a></td>
       </tr>
     </c:forEach>
     </table>
     
     <div>
           <button type="button" class="btn btn-block btn-primary" onclick="display()">Create new model</button>
     
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